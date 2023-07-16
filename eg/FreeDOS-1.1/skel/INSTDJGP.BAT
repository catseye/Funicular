CD C:\
IF EXIST C:\DJGPP\NUL GOTO AlreadyDJGPP
MKDIR DJGPP
CD DJGPP
UNZIP D:\djdev205.zip
UNZIP D:\faq230b.zip
UNZIP D:\bnu2351b.zip
UNZIP D:\gcc830b.zip
UNZIP D:\gpp830b.zip
UNZIP D:\mak44b.zip
UNZIP D:\csdpmi7b.zip
UNZIP D:\perl588b.zip
UNZIP D:\tar112abr2.zip
UNZIP D:\gzip110b.zip
UNZIP D:\fil41br3.zip
COPY D:\COPYING.DJ .
COPY D:\README.1ST .

:AlreadyDJGPP
