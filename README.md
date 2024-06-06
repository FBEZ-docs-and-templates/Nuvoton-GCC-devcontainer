# Cortex-M-gcc-devcontainer

Devcontainer for assembler on a Cortex M MCU based on [Martin Hubacek example](https://www.martinhubacek.cz/blog/arm-cortex-bare-metal-gcc-assembly-tutorial/).

This examples is tested on a Nuvoton M031 but it will work on other Cortex MCUs. In the Makefile, change the `-Ttext 0x0000000` option depending on your MCU.


## Compilation

To compile run `make`.

## Debugging with Nulink

Nuvoton requires a modified version of openOCD which is running on a windows machine. The `.bat` file containes the default path to run Nuvoton's openocd in its default path. 

Once openocd is running on your windows host machine, you need to renemae `.gdbinit.nulink` to `.gdbinit` and then you can connect your devcontainer using `make debug`

## Debugging with J-Link

J-Link can be used by openocd, but it also comes with an optimized gdb. To use J-Link, directly start the `JLinkGDBServerCL.exe` with the appropriate flags, which will open a gdb server listening to port `2331`. You can use the .bat file in the repo, if the version matches. 

Once gdbserver is running on your windows host machine, you need to renemae `.gdbinit.jlink` to `.gdbinit`
Connect to the gdb client with `make debug`.
Alternatively you can connect with `gdb-multiarch ./main.elf` and then connect to the JLinkGDBServer using `target extended-remote host.docker.internal:2331`.

Once connected, you can flash the program via `load main.elf` and restart the debugging session with `monitor reset halt`.

### Detailed operation

Once openocd is running on your windows host machine, you can connect your devcontainer gdb-multiarch in this way

```
gdb-multiarch ./main.elf
```
and you'll get something like
```
Copyright (C) 2022 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<https://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.

For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from main.elf...
```

To access openocd on your windows machine, you need to send the command
```
target extended-remote host.docker.internal:3333
```
and you'll be inside gdb
```
Remote debugging using host.docker.internal:3333
_start () at main.S:9
9           ADD R0, R0, #1
(gdb) 
```