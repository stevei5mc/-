@echo off
::��һ�к�����һ�б�;��һ�к�����һ�б�;��һ�к�����һ�б�
set cq=0
set stop_server_time=��������
echo -------------------------------------------------------------------------------------------
echo.
echo ���������������Ӳ鿴�����������ű�
echo https://github.com/stevei5mc/McStartServer
echo.
echo -------------------------------------------------------------------------------------------
:mc
:: ��server.properties��ò�����Ϣ
for /f "tokens=1,* delims==" %%a in ('find "server-port="^<server.properties') do ( set server_port=%%b)
for /f "tokens=1,* delims==" %%a in ('find "max-players="^<server.properties') do ( set max-players=%%b)
for /f "tokens=1,* delims==" %%a in ('find "server-ip="^<server.properties') do ( set server_ip=%%b)
::��������������java�汾 (Ĭ���� java����Ȼ��Ҳ������java�İ�װ·��)
set java_version=java
::����������ʾ
set server_name=test
::������С�ڴ�
set ram_Xms=512m
::��������ڴ�
set ram_Xmx=1024m
::���ÿ���������(�������������ü�.jar�ĺ�׺��)
set server_jar_name=server
::���������ȴ�ʱ��
set restart_time=20
title [%server_name%] [%server_IP%:%server_port%] ����[%cq%]�� �������[%max-players%]�� ����ڴ�[%ram_Xmx%] �ϴιط�����ʱ��[%stop_server_time%]
echo.
echo -------------------------------------------------------------------------------------------
echo.
echo ��ǰ��������Ϣ: 
echo ��������[%server_name%] ��������[%cq%��] �ϴιط�����ʱ��[%stop_server_time%]
echo ��С�ڴ�[%ram_Xms%] ����ڴ�[%ram_Xmx%]
echo iP�˿�[%server_IP%:%server_port%] �������[%max-players%]��
echo.
echo Tips:�������Ҫ�رշ����������stop�����رձ����ڣ��Է����ݶ�ʧ,���»ص���
echo.
echo -------------------------------------------------------------------------------------------
echo ����������ʱ�� %date:~0,4%/%date:~5,2%/%date:~8,2%-%time:~0,2%:%time:~3,2%:%time:~6,2%
echo -------------------------------------------------------------------------------------------
echo.
%java_version% -XX:+UseCompressedOops -XX:+AggressiveOpts -Xms%ram_Xms% -Xmx%ram_Xmx% -jar %server_jar_name%.jar
echo.
echo -------------------------------------------------------------------------------------------
echo.
echo ����˳����쳣���ֶ��ر� ��ȴ� %restart_time% ����Զ�����������
echo �������ر�ʱ���Ѽ�¼ &set stop_server_time=%date:~0,4%/%date:~5,2%/%date:~8,2%-%time:~0,2%:%time:~3,2%:%time:~6,2%
echo.
echo -------------------------------------------------------------------------------------------
echo.
ping 127.0.0.1 -n %restart_time% >nul
set /a cq=%cq%+1
goto mc
pause