@echo off
setlocal enabledelayedexpansion
:: �ɱ༭������!!!
:: ���������ɵ���־���ֽ�ɶ������дɶ����Ȼ��û���õ� (latest.log �� server.log) �󲿷ֵķ���˶�����������־�ļ�
set logName=server.log
:: 7-Zip�İ�װ·��������ʵ������޸�
set sevenZipPath="C:\Program Files\7-Zip\7z.exe"
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
if exist %logTimeFile%-%countThis%.log.gz (
    set /a countMax+=1
    set /a countThis+=1
    set /a countMax+=1
    goto loop
) else (
    echo ��־����Ϊ %logTimeFile%-%countThis%.log.7z
    ren %logName% %logTimeFile%-%countThis%.log
    %sevenZipPath% a -tgzip "%logTimeFile%-%countThis%.log.gz" "%logTimeFile%-%countThis%.log"
    del "%logTimeFile%-%countThis%.log"
)
exit