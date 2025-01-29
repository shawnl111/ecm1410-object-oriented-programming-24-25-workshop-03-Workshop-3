#!/bin/bash
passed=true

javac PrintPattern2.java

if [[ $? -eq 0 ]]; then
        echo "javac PrintPattern2.java ... ok" 
    else
        echo "javac PrintPattern2.java ... failed" 
        passed=false
fi

declare -A pairs=( ["3"]="""1 2 3 3 2 1 
2 3 4 4 3 2 
3 4 5 5 4 3 
3 4 5 5 4 3 
2 3 4 4 3 2 
1 2 3 3 2 1""" 

["1"]="""1 1 
1 1"""  )

for i in "${!pairs[@]}"; do
    j=${pairs[$i]}
    var=$(printf "$i" |java PrintPattern2)
    result=$(echo "$var" | tail -n $(($i + $i)))
    if [[ "$result" =~ "$j" ]]; then
        echo PrintPattern2 $i "... ok" 
    else
        echo PrintPattern2 $i "... failed" 
        passed=false
    fi
done

if [ "$passed" = "true" ]; then
    echo "PASSED: PrintPattern2.java"
    exit 0
else
    echo "FAILED: PrintPattern2.java"
    exit 1
fi
