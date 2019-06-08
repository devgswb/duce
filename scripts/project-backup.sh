#!/bin/bash
current="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
parent="$(dirname "$current")"
{
	cd $parent
	mkdir -p ./backup
	sudo tar -cvpzf ./backup/duce.tar.gz --exclude=./target/* --exclude=./backup/* ./
} > /dev/null
if [ $? -eq 0 ]; then
	echo "백업 성공. duce/backup/duce.tar.gz"
else
	echo "백업 실패"
fi
