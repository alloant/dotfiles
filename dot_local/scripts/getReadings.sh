#!/bin/bash

args=$(fuzzel -d)

first=$(echo $args | awk '{ print $1 }')

~/Documents/Projects/Doing/scrap/gcatholic/gospel.py $args
