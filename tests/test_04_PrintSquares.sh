#!/bin/bash
passed=true

javac PrintSquares.java
echo here
if [[ $? -eq 0 ]]; then
        echo "javac PrintSquares.java ... ok" 
    else
        echo "javac PrintSquares.java ... failed" 
        passed=false
fi


declare -A pairs=( ["1\n3\n"]="1 4 9"  ["2\n7\n"]="4 9 16 25 36 49" ["3\n4\n"]="9 16"  )

for i in "${!pairs[@]}"; do
    j=${pairs[$i]}
    var=$(printf "$i" |java PrintSquares)
    result=$(echo "$var" | tail -n 1)
    if [[ $result =~ $j ]]; then
        echo PrintSquares "${i//\\n/ }" "... ok" 
    else
        echo PrintSquares "${i//\\n/ }" "... failed" 
        passed=false
    fi
done

if [ "$passed" = "true" ]; then
    echo "PASSED: PrintSquares.java"
    exit 0
else
    echo "FAILED: PrintSquares.java"
    exit 1
fi
