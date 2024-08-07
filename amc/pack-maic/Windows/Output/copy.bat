:: 此文件为 windows 原生系统运行支持
:: Code Type: GBK2312
echo off
setlocal
title "[qcr] copy - windows"
@echo.

set date=%date:~0,4%%date:~5,2%%date:~8,2%
echo %0 正在运行中...
@echo.
echo ****************

::实验测试内容，占予保留
::echo ..\\.vscode,..\\.runtime >> tmp.qcr

set sourceFile=tmp.qcr
set tmpdir=runtime

mkdir ..\\.%tmpdir%
@echo off
if exist %sourceFile% ( 
    for %%A in (%sourceFile%) do (
        if %%~zA==0 (
            echo 审查文件出了一些问题！请重新尝试！！！
            echo "[qcr][%time%](copy) > 复查文件参数时发生了错误，请检查 tmp.qcr 文件！" >> ..\\.runtime\%date%.log
        ) else (
            setlocal enabledelayedexpansion
            for /f "tokens=1-3 delims=," %%i in (%sourceFile%) do (
                set from=%%i
                set to=%%j

                echo 复制 !from! 到 !to!
                xcopy !from! !to! /E /H /C /I /Y
            )
        )
    )

) else (
    echo 诶...你不应该跳过代码安全审查而单独打开此文件的~!
    echo "[qcr][%time%](copy) > 用户试图单独运行命令！已阻止无参数的运行！" >> ..\\.runtime\%date%.log
)
del %sourceFile%
pause
endlocal