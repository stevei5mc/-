@echo off
setlocal enabledelayedexpansion
:: �ɱ༭������!!!
:: ���������ɵ���־���ֽ�ɶ������дɶ����Ȼ��û���õ� (latest.log �� server.log) �󲿷ֵķ���˶�����������־�ļ�
set log_name=server.log

cd .\logs
if exist %log_name% (
    echo �ҵ��ļ� %log_name%����ʼִ����־��������
    :: ��ȡ�ļ����޸�ʱ��
    for %%A in (%log_name%) do (
        set "file_name=%%~nA"
        set "file_extension=%%~xA"
        set "file_path=%%~dpA"
        set "file_size=%%~zA"
        set "file_date=%%~tA"
    )
) else (
    echo �޷��ҵ��ļ� %log_name%�������������
)
:: �����ͣ�Ƿ��㿪���õ�
pause