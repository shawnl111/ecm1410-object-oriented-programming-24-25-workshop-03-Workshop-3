#!/bin/bash
passed=true

javac DemoIncrement.java

if [[ $? -eq 0 ]]; then
        echo "javac DemoIncrement.java ... ok" 
    else
        echo "javac DemoIncrement.java ... failed" 
        passed=false
fi

var="$(java DemoIncrement)"


if [[ $? -eq 0 ]]; then
        echo "java DemoIncrement ... ok" 
    else
        echo "java DemoIncrement ... failed" 
        passed=false
fi

l1=$(echo "$var" | head -n 1)
l2=$(echo "$var" | head -n 2 | tail -n 1)
l3=$(echo "$var" | tail -n 1  )

m1="a\: 4, b\: 8, x\: 4, y\: 9, p\: 4, q\: 9"
m2="i\+\+ means post"
m3="\+\+i means pre"

if [[ $l1 =~ $m1 ]]; then
    echo "Line 1 variable values ... ok" 
else
    echo "Line 1 variable values ... failed" 
    echo "Expected output:"
    echo $l1
    passed=false
fi


if [[ $l2 =~ $m2 ]]; then
    echo "Line 2 i++ means ... ok" 
else
    echo "Line 2 i++ ... failed" $l2
    echo "${var}" | head -2 | tail -n 1
    passed=false
fi

if [[ $l3 =~ $m3 ]]; then
    echo "Line 3 ++i means ... ok" 
else
    echo "Line 3 ++i ... failed"  $l3
    echo "${var}" | head -2 | tail -n 1
    passed=false
fi

if [ "$passed" = "true" ]; then
    echo "PASSED: DemoIncrement.java"
    exit 0
else
    echo "FAILED: DemoIncrement.java"
    exit 1
fi




