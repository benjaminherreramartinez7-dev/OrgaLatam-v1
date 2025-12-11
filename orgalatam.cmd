@echo off
title Instalador OrgaLatam CAVERNICOLA
color 0a

set "DATADIR=%USERPROFILE%\OrgaLatamData"
set "APPDIR=%USERPROFILE%\OrgaLatam"
set "SHORTCUT=%USERPROFILE%\Desktop\OrgaLatam.url"

if not exist "%DATADIR%" mkdir "%DATADIR%"
if not exist "%APPDIR%" mkdir "%APPDIR%"

echo Creando main.py (modo cavernicola)...

echo import os> "%APPDIR%\main.py"
echo import json>> "%APPDIR%\main.py"
echo import time>> "%APPDIR%\main.py"
echo data_path = r"%DATADIR%\datos.json">> "%APPDIR%\main.py"
echo if not os.path.exists(data_path):>> "%APPDIR%\main.py"
echo     f=open(data_path,"w");f.write("{}");f.close()>> "%APPDIR%\main.py"
echo while True:>> "%APPDIR%\main.py"
echo     print("===== ORGA LATAM =====")>> "%APPDIR%\main.py"
echo     print("1 - Nueva tarea")>> "%APPDIR%\main.py"
echo     print("2 - Ver tareas")>> "%APPDIR%\main.py"
echo     print("3 - Salir")>> "%APPDIR%\main.py"
echo     op = input("> ")>> "%APPDIR%\main.py"
echo     if op=="1":>> "%APPDIR%\main.py"
echo         t=input("Tarea: ")>> "%APPDIR%\main.py"
echo         f=open(data_path,"r+");d=json.load(f)>> "%APPDIR%\main.py"
echo         d[str(int(time.time()))]=t>> "%APPDIR%\main.py"
echo         f.seek(0);json.dump(d,f);f.close()>> "%APPDIR%\main.py"
echo         print("Guardado.")>> "%APPDIR%\main.py"
echo     elif op=="2":>> "%APPDIR%\main.py"
echo         d=json.load(open(data_path))>> "%APPDIR%\main.py"
echo         print("-- TAREAS --")>> "%APPDIR%\main.py"
echo         [print("* "+d[k]) for k in d]>> "%APPDIR%\main.py"
echo     elif op=="3":>> "%APPDIR%\main.py"
echo         break>> "%APPDIR%\main.py"

echo Creando launcher...
echo @echo off> "%APPDIR%\Iniciar_OrgaLatam.bat"
echo python "%APPDIR%\main.py">> "%APPDIR%\Iniciar_OrgaLatam.bat"

echo Creando acceso directo...
echo [InternetShortcut]> "%SHORTCUT%"
echo URL=file:///%APPDIR:\=/%/Iniciar_OrgaLatam.bat>> "%SHORTCUT%"

echo Listo.
pause
exit
