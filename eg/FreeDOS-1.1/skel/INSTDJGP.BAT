CD C:\
IF EXIST C:\DJGPP\NUL GOTO AlreadyDJGPP
MKDIR DJGPP
CD DJGPP
UNZIP D:\djdev205.zip
UNZIP D:\faq230b.zip
UNZIP D:\bnu230b.zip
UNZIP D:\gcc810b.zip
UNZIP D:\gpp810b.zip
UNZIP D:\mak421b.zip
UNZIP D:\csdpmi7b.zip
UNZIP D:\perl588b.zip
UNZIP D:\tar112ab.zip
UNZIP D:\gzip18b.zip
UNZIP D:\fil41br2.zip
COPY D:\COPYING.DJ .
COPY D:\README.1ST .

:AlreadyDJGPP
