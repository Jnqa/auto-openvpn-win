@echo off
If "%PROCESSOR_ARCHITECTURE%"=="x86" (
  powershell -Command "Invoke-WebRequest https://build.openvpn.net/downloads/releases/openvpn-install-2.3.18-I602-i686.exe -OutFile Ovpn64.exe"
) Else (
  powershell -Command "Invoke-WebRequest https://build.openvpn.net/downloads/releases/openvpn-install-2.3.18-I602-x86_64.exe -OutFile Ovpn64.exe"
)
set "dir=C:\Program Files\OpenVPN"
Ovpn64.exe /S /V"/qn" /D=%dir%
FOR %%f in (*.ovpn) DO @set cert=%%f
xcopy "%cd%\%cert%" "%dir%\config\" /f /i /y /s
start "" "https://webmail.dengabank.ru/"
echo Start "" "https://webmail.dengabank.ru/"> Start.bat
echo "%dir%\bin\openvpn-gui" --connect %cert%>> Start.bat
del "%cd%\Ovpn64.exe"
"%dir%\bin\openvpn-gui" --connect %cert%
exit/b 0

