 :: yesterdays date
Set _Source=\\10.60.35.26\xxxx
Set _LocalDir=C:\Users\xxx\Desktop\FtpUpload
Set _File=Stocks_

@echo off
set day=-1

echo >"%temp%\%~n0.vbs" s=DateAdd("d",%day%,now) : d=weekday(s)
echo>>"%temp%\%~n0.vbs" WScript.Echo year(s)^& right(100+month(s),2)^& right(100+day(s),2)
for /f %%a in ('cscript /nologo "%temp%\%~n0.vbs"') do set "result=%%a"
del "%temp%\%~n0.vbs"
set "YYYY=%result:~0,4%"
set "MM=%result:~4,2%"
set "DD=%result:~6,2%"
:: set "data=%yyyy%-%mm%-%dd%"
set "data=%dd%.%mm%.%yyyy%"

echo Yesterday was "%data%"
Echo Month %mm%

Set _Source=%_Source%\%mm%
Set _Filep=%_Source%\%_File%%data%.xlsx
::net use x: "%_Source%"
Echo %_Source%
Echo %_Filep%
Copy %_Filep%
Del "Euromaster_Stock-App_standard pentru stoc.xlsx"
Ren  %_File%%data%.xlsx "_Stock-App_standard pentru stoc.xlsx"


ftp -i -s:ftpcommands.txt

