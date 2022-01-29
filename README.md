#  Network Security Monitoring

Scripts used to collect, detect and analyze network traffic.


In a typical analysis session the scripts will be executed in the following
order:

## Decompress and aggregate logs

1.  `decompress_logs.sh   [LOGS_DIRECTORY]`
1.  `concatenate_logs.sh  [LOGS_DIRECTORY]`

At this point a set of files with names `master_*.log` should have been created
in the current directory.

## Inspect logs

Run these scripts from the directory where you executed the concatenation
script. The `master_*.log` files are the expected input to the following
scripts.

1.  `dns_queries_summary.sh`
1.  `files_summary.sh`
1.  `http_passwords.sh`
1.  `http_summary.sh`
1.  `software_summary.sh`
1.  `ssl_summary.sh`
1.  `ssl_versions.sh`
1.  `x509_summary.sh`


## Full run

Alternatively you can call the full set of the scripts by running the overall
script:

`process_all.sh  [LOGS_DIRECTORY]`

