#!/bin/bash
passed=true

javac AgeToGroup.java

if [[ $? -eq 0 ]]; then
        echo "javac AgeToGroup.java ... ok" 
    else
        echo "javac AgeToGroup.java ... failed" 
        passed=false
fi


declare -A pairs=( [12]="0" [50]="1" [18]="0" [65]="2" [100]="2" )

for i in "${!pairs[@]}"; do
    j=${pairs[$i]}
    var="$(java AgeToGroup ${i})"
    if [[ $var =~ $j ]]; then
        echo $i $j "... ok" 
    else
        echo $i $j "... failed" 
        passed=false
    fi
done

if [ "$passed" = "true" ]; then
    echo "PASSED: AgeToGroup.java"
    exit 0
else
    echo "FAILED: AgeToGroup.java"
    exit 1
fi


