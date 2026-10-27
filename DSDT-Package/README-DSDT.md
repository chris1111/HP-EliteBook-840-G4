# DSDT Fix Package — HPQOEM 828C 
(HP laptop, Intel Skylake/Kaby Lake era)

## Files

| File | Purpose |
|------|---------|
| `DSDT-fixed.dsl` | Fixed ASL source with **12 custom SSDTs merged inline** (`SSDT-PM` excluded) — 0 errors on old and new iasl |
| `DSDT.aml` | Compiled single-table build, ready to drop into your bootloader's ACPI folder |

## This round: 12 custom SSDTs merged into the DSDT

You no longer need any of your own SSDTs — everything they did is now inside the
DSDT itself. The table grew from 137,433 to 143,568 bytes (+6 KB of SSDT logic).

`SSDT-PM` is **not** part of the merge — and it was never enabled in your running
config anyway (CPU power management runs through `CPUFriend.kext`, which needs
nothing from this table: the native `\_PR.PR00–PR03` processors, the `CPC2`
package and the firmware `_PPC/_PSS/LPSS/TPSS` externals all stay in place). Its
ssdtPRGen content (plugin-type `_DSM`, APSS, ACST, APLF/APSN) would have been
fully self-contained, but it is simply gone — there is no `SSDT-PM` entry to
clean up in config.plist.

| SSDT removed | How it was merged |
|--------------|-------------------|
| `SSDT-XOSI` | root `Method (XOSI, 1)` — Darwin-aware Windows check, same 13-string package |
| `SSDT-GPRW` | root `Method (GPRW, 2)` — 0x6D / 0x0D instant-wake override, delegates to the **native `\XPRW`** already in your DSDT (that is why this SSDT worked without any rename) |
| `SSDT-SET-STAS` | `Scope (_SB) { Method (_INI) }` sets GNVS `STAS = 1` on Darwin (RTC `_STA` gate) |
| `FixShutdown-USB-SSDT` | root `Method (_PTS, 1)` — calls native `ZPTS`, then clears `\_SB.PCI0.XHC.PMEE` when Arg0 = 5 (your DSDT has no native `_PTS`, and `ZPTS` was already there unused) |
| `SSDT-PWRB` | `Method (_STA)` added to native `\_SB.PWRB` (device had only the `XSTA` placeholder, no `_STA`) |
| `SSDT-PPMC` | `Method (_STA)` added to native `\_SB.PCI0.PPMC` (1F.2, had no `_STA`) |
| `SSDT-PMCR` | `Device (PMCR)` APP9876 @ 0xFE000000/64K added under LPCB |
| `SSDT-HPET` | `Name (HPET._CRS, ...)` with IRQ 0,8,11 + FED00000/400 — native HPET only had the `XCRS` placeholder |
| `SSDT-EC-USBX` | fake `Device (EC)` (ACID0001) under LPCB + `Device (USBX)` with kUSB* power properties under `\_SB` |
| `SSDT-HP-FixLidSleep` | `Name (PS2K.RMCF, ...)` — VoodooPS2 "Custom PS2 Map" `e005=0` |
| `SSDT-PNLF` | `Device (PNLF)` APP0002 + RMP3/RMB1 register machinery under GFX0 (RMCF.* knobs stay external + `CondRefOf`, defaults active) |
| `SSDT-BATT` | `ECRX` region + byte-split field, `BTIF/BTST/ITLB/GBTI/GBTC/SBTC/GACW/GBAW` inside EC0, `NBTI` package in `_SB`, root `B1B2` — every field/mutex/method it touches (ECRG, BSEL, BST, INAC, INCH, IDIS, PSSB, BATP, BATN, BRCC, BRCV, NGBF, NGBT, NLB1/2, NLO2, NDCB, LB1/2, BTMX, ECMX, BTDR, BSTA, GBSS, GACS, GBMF, GCTL, GDNM, GDCH, NBST, NDBS) was verified to exist natively in your EC0; the native `\_SB.BTIF` wrapper now resolves against the merged method |

Still `External` on purpose (provided by HP's own OEM firmware SSDTs, which stay
loaded — they are not files in your EFI): `GFX0.AINT`, `EC0.BTIX`, `_PR.*` CPU
objects, etc.

## Verification matrix (merged build)

| Test | Result |
|------|--------|
| `DSDT-fixed.dsl` on iasl 20161222 (MaciASL RM era) | **0 Errors** (33 warnings, 83 remarks) |
| `DSDT-fixed.dsl` on iasl 20250404 (current ACPICA) | **0 Errors** (69 warnings, 295 remarks) |
| `DSDT.aml` decompile → recompile with iasl 2016 | **0 Errors** (38 warnings) |
| All 12 SSDT bodies present in compiled AML, each exactly once | verified |
| No `SSDT-PM` remnants (`APSS`, `plugin-type`, `APLF`, `APSN`, `ACST` scopes) in DSL or AML | verified |
| Every cross-SSDT symbol (41 GPRW sites, NBTI/NBST battery chain, STAS, ZPTS, XPRW, PMEE) resolves inside the single table | verified |

## What to change in your config.plist

1. Copy the new `DSDT.aml` into `EFI/OC/ACPI/`.
2. Delete the 13 SSDT `.aml` files from `EFI/OC/ACPI/` and remove their entries
   under `ACPI → Add` in config.plist.
3. If you carried any ACPI `Patch` (rename) entries that existed only to pair with
   these SSDTs, remove those too — the merged DSDT resolves everything by its real
   names. Keeping a stale rename (e.g. one that hides `_PTS` or `_CRS`) would now
   break the merged hooks.

## History

- Round 1: fixed the 7 original errors (WGBI/WSBC/BTIF/BTST disassembler artifacts,
  41 `_PRW` GPRW sites, HDAC._CRS mangle, stale External arg counts, DD1F `_HID`,
  PS2M `_HID` placement).
- Round 2: fixed the MaciASL/2016 re-test failures (redundant `External (PPL1)`,
  local `AINT` buffer-field renamed `AINH` to unmask the real `AINT` method call).
- Round 3: all 12 custom SSDTs merged inline.
