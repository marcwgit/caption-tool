#!/bin/bash
for f in "$1"*.mp3
#for f in cap_Wed-Apr13*.mp3
do
	echo $f
#	$(echo  sox $f -n stat)
	sox "$f" -n stat 2> tmp.txt; grep  'Maximum amplitude:' tmp.txt  | awk '{ print $3, $4 }'
	ffprobe -i "$f" -v quiet -show_format -sexagesimal | sed -n 's/duration=//p'
#	$(echo playtimehms $f)
	echo "--------------------------------------"

done