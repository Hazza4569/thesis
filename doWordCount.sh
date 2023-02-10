#!/bin/bash
let wc=0
# Add wordcount for all source files (main root and section files that aren't
# picked up by default due to custom input commands)
for file in {thesis,chapters/*/*/*}.tex; do
    count=`perl wordCount/texcount.pl -sum -merge -q -0 $file`
    echo ${count%%[^0-9]*}
    let wc+=${count%%[^0-9]*}
done
# subtract of acronym file (counted in thesis.tex but contains only commands)
acro=`perl wordCount/texcount.pl -sum -merge -q -0 acronym.tex`
let wc-=${acro%%[^0-9]*}
t=`date +%s`
FILE=wordCountHistory
printf "%u %u\n" "${t}" "${wc}" >> $FILE
#root makeWordCountPlot.C -b -q -l
python wordCountPlot.py
