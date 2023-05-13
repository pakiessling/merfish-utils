@echo Enter archived experiment path. This will upload the folder to Coscine.
@set /p input=""

mc cp --recursive -md5 %input% CONFIGURED/S3SERVER
@pause
