#!/bin/bash
passed=true

javac NumbersInSpanish.java

if [[ $? -eq 0 ]]; then
        echo "javac NumbersInSpanish.java ... ok" 
    else
        echo "javac NumbersInSpanish.java ... failed" 
        passed=false
fi


declare -A pairs=( [0]="Sorry I do not know that!" 
                    [1]=uno [2]=dos [3]=tres [4]=cuatro 
                    [5]=cinco [6]="Sorry I do not know that!"  )

for i in $(seq 0 6); do
  j=${pairs[$i]}
  var="$(java NumbersInSpanish ${i})"
    if [[ $var =~ $j ]]; then
        echo $i $j "... ok" 
    else
        echo $i $j "... failed" 
        passed=false
    fi
done

if [ "$passed" = "true" ]; then
    echo "PASSED: NumbersInSpanish.java"
    exit 0
else
    echo "FAILED: NumbersInSpanish.java"
    exit 1
fi


