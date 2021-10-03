@echo off

rem Download
curl -kLO https://github.com/obsproject/obs-studio/archive/27.1.1.zip -f --retry 5 -C -
curl -kLO https://github.com/obsproject/obs-studio/releases/download/27.1.1/OBS-Studio-27.1.1-Full-x86.zip -f --retry 5 -C -
curl -kLO https://github.com/obsproject/obs-studio/releases/download/27.1.1/OBS-Studio-27.1.1-Full-x64.zip -f --retry 5 -C -
curl -kLO "https://ja.osdn.net/frs/redir.php?m=jaist&f=mingw/72300/pexports-0.48-mingw32-bin.tar.xz" -f --retry 5 -C -
curl -kLO "https://ja.osdn.net/frs/redir.php?m=jaist&f=sevenzip/64455/7za920.zip" -f --retry 5 -C -
curl -kLO https://cdn-fastly.obsproject.com/downloads/Qt_5.15.2.7z -f --retry 5 -C -

rem Extraact
md tools
md obs-bin
tar xf 7za920.zip -C tools
tools\7za x Qt_5.15.2.7z
tools\7za x pexports-0.48-mingw32-bin.tar.xz
tar xf pexports-0.48-mingw32-bin.tar
tar xf 27.1.1.zip
tar xf OBS-Studio-27.1.1-Full-x86.zip -C obs-bin
tar xf OBS-Studio-27.1.1-Full-x64.zip -C obs-bin
move bin\pexports.exe tools
move obs-studio-27.1.1 obs-src
move 5.15.2 qt

rem Clean up
rd /s /q bin
del tools\7za.exe
del tools\7-zip.chm
del tools\license.txt
del tools\readme.txt
del *.zip
del *.tar
del *.tar.xz
del *.7z
