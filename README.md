# merfish-utils
Some example scripts for handling data generated by Vizgen Merscope

## Supervised upload to S3 with MinIO client
Install  [MinIO S3 client](https://github.com/minio/mc) and make sure it is in the windows PATH.

Configure your S3 server with ```mc alias set```.

Enter your configured server in the .bat.

Double click .bat and paste folder path for upload.


## Watchdog example
Make sure the watchdog package is installed.

As long as the example .py is running it will monitor the configured directory for the creation of ```EXPERIMENT_FINISHED``` and ```MERLIN_FINISHED```, which indicate the end of the Merscope experiment and Merscope analysis respectively.

## Metadata upload example
Uploads supplied Metadata to Coscine, our S3 storage server
