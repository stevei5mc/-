@echo off
setlocal enabledelayedexpansion
:: �ɱ༭������!!!
:: ���������ɵ���־���ֽ�ɶ������дɶ����Ȼ��û���õ� (latest.log �� server.log) �󲿷ֵķ���˶�����������־�ļ�
set logName=server.log
:: 7-Zip�İ�װ·��������ʵ������޸�
set winrarPath="D:\Program Files\WinRAR\rar.exe"
::���ɱ༭����
cd .\logs
if exist %logName% (
    echo �ҵ��ļ� %logName%����ʼִ����־��������
    :: ��ȡ�ļ����޸�ʱ��
    for %%A in (%logName%) do (
        set "fileDate=%%~tA"
    )
    set "fileDate=!fileDate:/=-!"
    set "logTimeFile=!fileDate:~0,10!"
) else (
    echo �޷��ҵ��ļ� %log_name%�������������
    exit
)
set countThis=1
set countMax=2
:loop
if exist %logTimeFile%-%countThis%.log.zip (
    set /a countThis+=1
    set /a countMax+=1
    goto loop
) else (
    echo ��־����Ϊ %logTimeFile%-%countThis%.log.zip
    ren %logName% %logTimeFile%-%countThis%.log
    %winrarPath% a -afzip "%logTimeFile%-%countThis%.log.zip" "%logTimeFile%-%countThis%.log"
    del "%logTimeFile%-%countThis%.log"
    exit
)