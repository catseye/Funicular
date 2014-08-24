@ECHO OFF
REM Usage: PUTFLOPY cwsdpmi default src dest
REM cwsdpmi should be 'y' to install cwsdpmi as a dependency

SET /P confirm=Install %3 on the floppy? [y/n, default=n]: 
IF NOT "%confirm%"=="y" GOTO SkipInstall
IF "%1"=="y" COPY C:\DJGPP\BIN\CWSDPMI.EXE A:\FDOS\
COPY %3 %4
:SkipInstall
