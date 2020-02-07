#!/bin/bash

web="acbda062149cf11eaa6a80266d00d191-1299013300.us-west-2.elb.amazonaws.com:80"

if curl -s "$web" | grep blue &> /dev/null
then  
	echo -e "This is a \e[34mblue\e[0m deployment"
elif curl -s "$web" | grep green &> /dev/null
then
	echo -e "This is a \e[32mgreen\e[0m deployment"
else
	echo "Not reachable"
fi

