#!/bin/bash
passed=true

javac SumSquares.java

if [[ $? -eq 0 ]]; then
        echo "javac SumSquares.java ... ok" 
    else
        echo "javac SumSquares.java ... failed" 
        passed=false
fi

declare -A pairs=( ["1\n3\n"]="14"  ["2\n7\n"]="139" ["3\n4\n"]="25"  )

for i in "${!pairs[@]}"; do
    j=${pairs[$i]}
    var=$(printf "$i" |java SumSquares)
    result=$(echo "$var" | tail -n 1)
    # echo result $result
    # echo target $j

    if [[ $result =~ $j ]]; then
        echo SumSquares "${i//\\n/ }" "... ok" 
    else
        echo SumSquares "${i//\\n/ }" "... failed" 
        passed=false
    fi
done

if [ "$passed" = "true" ]; then
    echo "PASSED: SumSquares.java"
    exit 0
else
    echo "FAILED: SumSquares.java"
    exit 1
fi
