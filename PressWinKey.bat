@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
PROMPT $
cls
ECHO ####################################################################
ECHO # �@�\����  :�w�莞�Ԃ��Ƃ�Windows�L�[���J��Ԃ�������������B     #
ECHO # �N�����@  :PressWinKey.bat ���_�u���N���b�N����B                #
ECHO # �ݒ莞��  :���P�� (�����^�F��K�{)  ---�����l[4]��---            #
ECHO # ��~���@  :[CTRL + C ] �L�[�����ɉ�������ƁA�����I������B      #
ECHO ####################################################################

REM ��������
SET BASE_DIR=%~dp0
REM SET JAVA_EXE=%BASE_DIR%\JDK\bin\java

ECHO.
ECHO -----�J��Ԃ������̒P�ʎ��Ԃ���́i�ȗ��j-----
SET /P MIN=-----�ݒ莞�ԁi���j:

REM ���͒l�������_�ȉ��؂�̂�
SET /a MIN=%MIN%*1000/1000
IF %MIN% EQU 0 (
 SET MIN=4
)

REM java�R�}���h�����s����
ECHO %DATE% %TIME% �����J�n [%MIN%]�����ƂɌJ��Ԃ�
ECHO\

ECHO %PATH% | find "jdk" >nul
IF %errorlevel% NEQ 0 (
	echo �� �V�X�e�����Java���C���X�g�[�����Ă��Ȃ����߁A�����I�����܂��B
REM	%JAVA_EXE%  %BASE_DIR%PressWinKey.java %MIN%
) else (
	JAVA %BASE_DIR%PressWinKey.java %MIN%
)

ECHO\
ECHO %DATE% %TIME% �����I��
ECHO\

PAUSE
