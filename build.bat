@echo off

asm68k /k /p /o ae- sonic.asm, ReadySonic.bin >errors.txt, , sonic.lst
fixheadr.exe ReadySonic.bin