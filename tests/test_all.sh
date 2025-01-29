#!/bin/zsh

score=0
if ./tests/test_01_DemoIncrement.sh; then ((score+=1)); fi
echo ----
if ./tests/test_02_AgeToGroup.sh; then ((score+=1)); fi
echo ----
if ./tests/test_03_NumbersInSpanish.sh; then ((score+=1)); fi
echo ----
if ./tests/test_04_PrintSquares.sh; then ((score+=1)); fi
echo ----
if ./tests/test_05_SumSquares.sh; then ((score+=1)); fi
echo ----
if ./tests/test_06_AverageSquares.sh; then ((score+=1)); fi
echo ----
if ./tests/test_07_PrintPattern1.sh; then ((score+=1)); fi
echo ----
if ./tests/test_08_PrintPattern2.sh; then ((score+=0.5)); fi
echo ----
echo --- RESULT: ---
echo Your score is $score / 7.5