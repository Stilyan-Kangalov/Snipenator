@echo off

FOR /F "tokens=* USEBACKQ" %%F IN (`call git status`) DO (
SET var=%%F
)
ECHO %var%

timeout /T 500