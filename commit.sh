#!/bin/sh

FILE=testfile

if [ -f "$FILE" ]; then

	rm "$FILE"
	git add .
	git commit -m "RM $FILE"

else

	date +%s | sha256sum | base64 | head -c 32 ; echo > "$FILE"
	git add .
	git commit -m "ADD $FILE"

fi

git push origin `git rev-parse --abbrev-ref HEAD`
