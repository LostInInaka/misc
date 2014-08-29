#!/bin/sh
echo "\033[1m\033[4mEarthquake Report\033[0m"

#Give data on most recent earthquake and location
curl --silent "http://www.jma.go.jp/en/quake/quake_local_index.html" | curl --silent "http://www.jma.go.jp/en/quake/quake_local_index.html" | grep -a "<tr><td nowrap><a href=./" | head -1 | sed -e 's/<a href.*html>//' -e 's/.*<tr><td nowrap>//' -e 's/.*<\/a><\/td><td nowrap>//' -e 's/<\/td><td>/ - /' -e 's/<\/td><td nowrap>/ - /' -e 's/<\/td><td nowrap style="text-align:center">/ - S/' -e 's/<\/td><\/tr>//'

#Change "Iwate" to whatever prefecture you are interested in - this line gives the maximum strength of the earthquake in the prefecture
curl --silent "http://www.jma.go.jp/en/quake/index.html" | grep -a "Iwate" | head -1 | sed -e 's/<tr><td rowspan=".*">/Iwate - S/' -e 's/<.*//'

#Gives warning of any tsunami risks
curl --silent "http://www.jma.go.jp/en/quake/index.html" | tail -23 | grep -v '<\/table><br>' | head -2 | sed 's/.*<.*">//' | sed 's/<\/.*>//' | sed 's/.*<p>//' | sed 's/.*<br>//' | sed 's/.*<tr>//' | sed 's/Region Name//' | sed '/^$/d'
