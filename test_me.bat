@echo off

FOR /F "tokens=* USEBACKQ" %%F IN (`call git status`) DO (
IF NOT "%%F" == "nothing to commit, working directory clean" (
FOR /f "delims=" %%a in ('date/t') do @set mydate=%%a
FOR /f "delims=" %%a in ('time/t') do @set mytime=%%a
set currentTime=%mydate%%mytime%
REM add all new files with auto-commit
call git add .
call git commit -a -m "Automated commit by Speedy_Git on %currentTime%"
call git push origin master
) ELSE (
ECHO %var%
)
)


timeout /T 500