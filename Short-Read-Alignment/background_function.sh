#!/usr/bin/env bash
# background_function.sh

# Run a function in the background
# can still run when disconnect from the server
# can disconnect, login periodically to check the status using top
# sleep command to delay each pass through the loop 30s
# when run a scripts in the background wait until it finishes before starting it again
# can tell when a script finishes when no longer see it listed in top or htop

# Specify the input path as an absolute path.
fastqPath="/scratch/AiptasiaMiSeq/fastq/"

# Specify the desired file suffix
leftSuffix="*R1.fastq"

function listFiles {
    for fastqFile in $fastqPath$leftSuffix
    do 
        echo $fastqFile
        # the sleep command bellow is just to slow this down
        # enough for you to see in top
        sleep 30
    done
}
# send success output to listFiles.log and 
# error output to listFiles.err.
listfiles 1>list.log 2>list.err
