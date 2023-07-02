#!/usr/bin/fish

if [ (setxkbmap -print -verbose 10 | grep layout | string sub -s 8 | grep -o "[a-z][a-z]") != 'us' ]
	setxkbmap -layout us
else
	setxkbmap -layout cz -variant qwerty
end
