set base_path=C:\Program Files (x86)\Nuvoton Tools
set "open_path=%base_path%\OpenOCD\bin\openocd.exe"
set "nulink_path=%base_path%\OpenOCD\scripts\interface\nulink.cfg"
set "numicro_path=%base_path%\OpenOCD\scripts\target\numicroM0.cfg"

"%open_path%" -f "%nulink_path%" -f "%numicro_path%"