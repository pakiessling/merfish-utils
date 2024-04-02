@echo off

for /f "tokens=1-4 delims=/ " %%i in ("%date%") do (
     set dow=%%h
     set month=%%i
     set day=%%j
     set year=%%k
   )
SET datestr=%month%_%day%_%year%
SET path=C:\Users\Merscope3\Desktop\upload_logs\
SET outputfilename=%path%log-%datestr%_output.txt
SET rawfilename=%path%log-%datestr%_raw.txt

echo =========== LOG FILE %datestr% =========== >> %outputfilename%

rclone move Z:\merfish_output merfish_output:/32f10225-14ab-4283-b557-d54e8fc96ac3/ -P --s3-upload-cutoff 200M --s3-chunk-size 64M --fast-list  --transfers 8 --checkers 16 --retries-sleep 300s --log-level INFO --min-age 6h  --delete-empty-src-dirs >> %outputfilename%

echo =========== OUTPUT SCRIPT FINISHED CHECK FOR ERRORS ABOVE ============== >> %outputfilename%

echo ===========  LOG FILE %datestr% =========== >> %rawfilename%

rclone copy Z:\merfish_raw_data merfish_raw:/41a929c3-89fd-4272-a828-4290bfc43f0b/ -P --s3-upload-cutoff 200M --s3-chunk-size 64M --fast-list  --transfers 8 --checkers 16 --retries-sleep 300s --log-level INFO >> %rawfilename%

echo =========== RAW SCRIPT FINISHED CHECK FOR ERRORS ABOVE ============== >>  %rawfilename%