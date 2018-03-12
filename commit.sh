#!/bin/sh

FILE=testfile

if [ -f "$FILE" ]; then

	rm "$FILE"
	MSG="RM $FILE"

else

	printf "RAND = " > "$FILE"
	openssl rand -hex 32 >> "$FILE"
	MSG="ADD $FILE"

fi

git add .
git commit -m "$MSG"
git push origin `git rev-parse --abbrev-ref HEAD`
