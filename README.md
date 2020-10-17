# homeboy-emu

This repo contains a disassembly of the N64 Emulator ELF executable intended for use with the Gamecube releases of The Legend of Zelda Majora's Mask, specifically the version shipped with the Japanese Zelda Collector's Edition disk as symbols and other debugging information was left unstripped.
The repo's name derives from file paths found in the debugging symbols such as
`c:\HOMEBOY\STEPHEN\Emulator\Fire\_frameGCN.c:5804`

It builds the following ELF executables:

SIM.elf   : `md5: 4B7D59E6954FED2B43031EB0D22A058F`
SIM_S.elf : `md5: 08EDB0EAB9E46DAF18374985CA6991D0`

SIM_S is a version of the build with stripped symbols which when diffed against a similarly stripped original matches byte for byte if assembled and linked, which is the most realistic goal for verifying the accuracy of this disassembly.

## Building

### Required tools

* [devkitPro](https://devkitpro.org/wiki/Getting_Started)
* python3

### Instructions

1. Obtain the original ELF executable found in the `120903_majora.tgc` file on the Japanese Collector's Edition disk and place it in the base working directory and name it `SIM_original.elf`
2. Obtain a copy of the MWCC for embedded PowerPC and place it in the `tools/mwcc_compiler/1.1/` folder.
(NOTE: This compiler's executables [mwcceppc.exe mwasmeppc.exe and mwldeppc.exe] can be installed with Codewarrior 1.1 for Gamecube, but no license or crack is provided with this project. Please obtain access to the compiler on your own.)
3. Run make setup and make
