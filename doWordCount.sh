#!/bin/bash
wc=`perl wordCount/texcount.pl -sum -merge -q -0 thesis.tex`
t=`date +%s`
FILE=wordCountHistory
printf "%u %u\n" "${t}" "${wc}" >> $FILE
root makeWordCountPlot.C -b -q -l
