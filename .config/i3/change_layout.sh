#!/usr/bin/fish

if [ (setxkbmap -print -verbose 10 | grep layout | string sub -s 8 | grep -o "[a-z][a-z]") != 'us' ]
	setxkbmap -layout us
    notify-send "Switched keyboard layout to US"
else
	setxkbmap -layout cz -variant qwerty
    notify-send "Switched keyboard layout to CZ"
end
