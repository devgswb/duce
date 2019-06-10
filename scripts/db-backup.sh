#!/bin/bash
current="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
parent="$(dirname "$current")"
ID=$1
PWD=$2

{
	cd $parent
	mkdir -p ./backup
	mysqldump -u $ID -p$PWD duce > ./backup/database-backup.sql
} > /dev/null
if [ $? -eq 0 ]; then
	echo "데이터 백업에 성공. duce/backup/database-backup.sql"
else
	echo "데이터 백업 실패. 첫번째 인자는 id, 두번째 인자는 비밀번호입니다."
fi
