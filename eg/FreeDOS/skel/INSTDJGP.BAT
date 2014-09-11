CD C:\
IF EXIST C:\DJGPP\NUL GOTO AlreadyDJGPP
MKDIR DJGPP
CD DJGPP
UNZIP D:\djdev203.zip
UNZIP D:\faq230b.zip
UNZIP D:\bnu224b.zip
UNZIP D:\gcc473b.zip
UNZIP D:\mak3791b.zip
UNZIP D:\csdpmi7b.zip
UNZIP D:\perl588b.zip
UNZIP D:\tar112ab.zip
UNZIP D:\gzip16b.zip
UNZIP D:\fil41b.zip
COPY D:\COPYING.DJ .
COPY D:\README.1ST .

:AlreadyDJGPP
