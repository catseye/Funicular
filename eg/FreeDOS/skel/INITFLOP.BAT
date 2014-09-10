@ECHO OFF
CLS
SET /P size=Enter size of floppy (360, 720, or 1440): 
IF "%size%"=="360" GOTO OK
IF "%size%"=="720" GOTO OK
IF "%size%"=="1440" GOTO OK
ECHO You must enter either 360, 720, or 1440.
GOTO End
:OK
ECHO -----
ECHO About to format your %size%K floppy disk in drive A:.
ECHO Just press Enter at the prompts.
ECHO If your disk image has never been used used, this process may fail
ECHO (in which case, just run this script again, and it should work the
ECHO second time.)
ECHO -----
PAUSE
FORMAT A: /F:%size% /S /D
PAUSE
CLS
DIR A:
SET /P looksgood=Does the above look ok? [y/n, default=y]: 
IF NOT "%looksgood%"=="n" GOTO FloppyOK
ECHO Please run this script again.  It should work better the second time.
GOTO End
:FloppyOK
CLS

REM MKDIR A:\FDOS
REM MOVE A:\COMMAND.COM A:\FDOS\
REM COPY C:\SKEL\FLOPPY\FDCONFIG.SYS A:\FDCONFIG.SYS
REM ATTRIB -R A:\FDCONFIG.SYS
REM COPY C:\SKEL\FLOPPY\FDOS\AUTOEXEC.BAT A:\FDOS\AUTOEXEC.BAT
REM ATTRIB -R A:\FDOS\AUTOEXEC.BAT

ECHO -----
ECHO Done!  You now have a basic bootable floppy.
ECHO -----

REM CALL D:\PUTFLOPY.BAT n y C:\FDOS\BIN\MORE.EXE A:\FDOS\MORE.EXE
REM CALL D:\PUTFLOPY.BAT n y C:\FDOS\BIN\DEBUG.COM A:\FDOS\DEBUG.COM
REM CALL D:\PUTFLOPY.BAT n y C:\FDOS\BIN\NANSI.SYS A:\FDOS\NANSI.SYS
REM CALL D:\PUTFLOPY.BAT n y C:\FDOS\BIN\TED3.COM A:\FDOS\TED3.COM
REM CALL D:\PUTFLOPY.BAT y n C:\FDOS\BIN\YASM.EXE A:\FDOS\YASM.EXE
REM CALL D:\PUTFLOPY.BAT y n C:\DJGPP\BIN\PERL.EXE A:\FDOS\PERL.EXE

:End
ECHO End of script.
