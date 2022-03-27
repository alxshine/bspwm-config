#!/usr/bin/bash

Clock(){
	TIME=$(date "+%H:%M")
	echo -e -n "${TIME}"
}

Cal() {
    DATE=$(date "+%a, %Y-%m-%d")
    echo -e -n "${DATE}"
}

Language(){
  xkb-switch
}

while true; do
	echo -e "%{c}$(Cal)  $(Clock)" "%{r}$(Language)"
	sleep 0.5s
done
