@ECHO OFF

echo ##############################################################################
echo                           ##### Speedy Git #####
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
color F
REM get date and time
for /f "delims=" %%a in ('date/t') do @set mydate=%%a
for /f "delims=" %%a in ('time/t') do @set mytime=%%a
set currentTime=%mydate%%mytime%
call git status
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
echo.
REM add all new files with auto-commit
call git add .
call git commit -a -m "Automated commit by Speedy_Git.bat on %currentTime%"
call git push origin master
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
echo.
echo ### Great, everything went well!
timeout /t 15
exit