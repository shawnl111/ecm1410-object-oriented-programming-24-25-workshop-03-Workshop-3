#!/bin/bash
passed=true

javac AverageSquares.java

if [[ $? -eq 0 ]]; then
        echo "javac AverageSquares.java ... ok" 
    else
        echo "javac AverageSquares.java ... failed" 
        passed=false
fi


declare -A pairs=( ["1\n3\n"]="4.66"  ["2\n7\n"]="23.16" ["3\n4\n"]="12.5"  )

for i in "${!pairs[@]}"; do
    j=${pairs[$i]}
    var=$(printf "$i" |java AverageSquares)
    result=$(echo "$var" | tail -n 1)
    # echo result $result
    # echo target $j
    if [[ $result =~ $j ]]; then
        echo AverageSquares "${i//\\n/ }" "... ok" 
    else
        echo AverageSquares "${i//\\n/ }" "... failed" 
        passed=false
    fi
done

if [ "$passed" = "true" ]; then
    echo "PASSED: AverageSquares.java"
    exit 0
else
    echo "FAILED: AverageSquares.java"
    exit 1
fi