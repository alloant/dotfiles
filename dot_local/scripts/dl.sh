#!/bin/sh
PATH=$PATH:/sbin:/usr/sbin
export PATH

	if [[ $1 == *"youtube.com"* ]]; 
	then
		youtube-dl $1
	else
		uget-gtk --quiet $1
	fi


