#!/bin/bash
passed=true

javac PrintPattern1.java

if [[ $? -eq 0 ]]; then
        echo "javac PrintPattern1.java ... ok" 
    else
        echo "javac PrintPattern1.java ... failed" 
        passed=false
fi

declare -A pairs=( ["3"]="""1
12
123"""
                   ["7"]="""1
12
123
1234
12345
123456
1234567"""
                   ["1"]="1"  )

for i in "${!pairs[@]}"; do
    j=${pairs[$i]}
    var=$(printf "$i" |java PrintPattern1)
    result=$(echo "$var" | tail -n $i)
    if [[ "$result" =~ "$j" ]]; then
        echo PrintPattern1 $i "... ok" 
    else
        echo PrintPattern1 $i "... failed" 
        passed=false
    fi
done

if [ "$passed" = "true" ]; then
    echo "PASSED: PrintPattern1.java"
    exit 0
else
    echo "FAILED: PrintPattern1.java"
    exit 1
fi
