#!/bin/bash
passed=true

javac PrintPattern2.java

if [[ $? -eq 0 ]]; then
        echo "javac PrintPattern2.java ... ok" 
    else
        echo "javac PrintPattern2.java ... failed" 
        passed=false
fi



var=$(printf "0\n1\n" |java PrintPattern2)
result=$(echo "$var" | head -n 1 )
if [[ "$result" =~ "oo small" ]]; then
    echo PrintPattern2 "too small! ... ok" 
else
    echo PrintPattern2 "too small! ... failed" 
    passed=false
fi
    
var=$(printf "9\n1\n" |java PrintPattern2)
result=$(echo "$var" | head -n 1)
if [[ "$result" =~ "oo big" ]]; then
    echo PrintPattern2 "too big! ... ok" 
else
    echo PrintPattern2 "too big! ... failed" 
    passed=false
fi

declare -A pairs=( ["1\n"]="""11
11""" )

for i in "${!pairs[@]}"; do
    j=${pairs[$i]}
    var=$(printf "$i" |java PrintPattern2)
    result=$(echo "$var" | tail -n 2)
    if [[ "$result" =~ "$j" ]]; then
        echo PrintPattern2 "${i//\\n/ }" "... ok" 
    else
        echo PrintPattern2 "${i//\\n/ }" "... failed"
        passed=false
    fi
done


declare -A pairs=( ["3\n"]="""123321
234432
345543
345543
234432
123321""" )

for i in "${!pairs[@]}"; do
    j=${pairs[$i]}
    var=$(printf "$i" |java PrintPattern2)

    result=$(echo "$var" | tail -n 6)
    if [[ "$result" =~ "$j" ]]; then
        echo PrintPattern2 "${i//\\n/ }" "... ok" 
    else
        echo PrintPattern2 "${i//\\n/ }" "... failed" 
        passed=false
    fi
done


declare -A pairs=( ["5\n"]="""1234554321
2345665432
3456776543
4567887654
5678998765
5678998765
4567887654
3456776543
2345665432
1234554321""" )

for i in "${!pairs[@]}"; do
    j=${pairs[$i]}
    var=$(printf "$i" |java PrintPattern2)
    result=$(echo "$var" | tail -n 10)
    if [[ "$result" =~ "$j" ]]; then
        echo PrintPattern2 "${i//\\n/ }" "... ok" 
    else
        echo PrintPattern2 "${i//\\n/ }" "... failed"
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
