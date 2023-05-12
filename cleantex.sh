#!/bin/bash

for file in thesis.{bbl,blg,cb,cb2,lof,log,lot,out,toc}; do
    [ -f $file ] && mv $file logs/
done

for file in {*,chapters/*/*}.aux; do
    [ -f $file ] && rm $file
done
