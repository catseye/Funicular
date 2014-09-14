@ECHO OFF
CLS
SET /P size=Enter size of floppy (360, 720, or 1440): 
IF "%size%"=="360" GOTO Start
IF "%size%"=="720" GOTO Start
IF "%size%"=="1440" GOTO Start
ECHO You must enter either 360, 720, or 1440.
GOTO End

:Start
ECHO -----
ECHO About to format your %size%K floppy disk in drive A:.
ECHO Just press Enter at the prompts.
ECHO If your disk image has never been used used, this process may fail
ECHO (in which case, you will be given the opportunity to try formatting
ECHO it again, and it should work the second time around.)
ECHO -----
PAUSE
FORMAT A: /F:%size% /S /D
PAUSE
CLS
DIR A:
SET /P looksgood=Does the above look ok? [y/n, default=y]: 
IF NOT "%looksgood%"=="n" GOTO FloppyOK
ECHO Trying again...
GOTO Start

:FloppyOK
ECHO -----
ECHO Done!  You now have a basic bootable floppy.
ECHO -----

:End
ECHO End of script.
