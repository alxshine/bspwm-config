#!/usr/bin/zsh

Desktops(){
  monitors=$(bspc query -D -m "$1" --names)
  current_monitor=$(bspc query -D -d newest.focused -m "$1" --names)
  printf "%s" "$monitors" | tr -s '\n' ' ' | sed "s/$current_monitor/ +$current_monitor+ /"
}

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

Batteries(){
  printf "BAT: %s %s" $(cat /sys/class/power_supply/BAT0/capacity) `cat /sys/class/power_supply/BAT1/capacity 2>/dev/null`
}

desktop=$1

while true; do
	echo -e "%{l}$(Desktops $desktop)" "%{c}$(Cal)  $(Clock)" "%{r}$(Batteries) | $(Language)"
	sleep 0.1s
done
