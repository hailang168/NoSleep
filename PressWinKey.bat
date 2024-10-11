@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
PROMPT $
cls
ECHO ####################################################################
ECHO # 機能説明  :指定時間ごとにWindowsキーを繰り返し自動押下する。     #
ECHO # 起動方法  :PressWinKey.bat をダブルクリックする。                #
ECHO # 設定時間  :分単位 (整数型：非必須)  ---初期値[4]分---            #
ECHO # 停止方法  :[CTRL + C ] キー同時に押下すると、処理終了する。      #
ECHO ####################################################################

REM 初期処理
SET BASE_DIR=%~dp0
REM SET JAVA_EXE=%BASE_DIR%\JDK\bin\java

ECHO.
ECHO -----繰り返し処理の単位時間を入力（省略可）-----
SET /P MIN=-----設定時間（分）:

REM 入力値が小数点以下切り捨て
SET /a MIN=%MIN%*1000/1000
IF %MIN% EQU 0 (
 SET MIN=4
)

REM javaコマンドを実行する
ECHO %DATE% %TIME% 処理開始 [%MIN%]分ごとに繰り返す
ECHO\

ECHO %PATH% | find "jdk" >nul
IF %errorlevel% NEQ 0 (
	echo ※ システム上でJavaがインストールしていないため、処理終了します。
REM	%JAVA_EXE%  %BASE_DIR%PressWinKey.java %MIN%
) else (
	JAVA %BASE_DIR%PressWinKey.java %MIN%
)

ECHO\
ECHO %DATE% %TIME% 処理終了
ECHO\

PAUSE
