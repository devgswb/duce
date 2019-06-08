#!/bin/bash

ID=$1
PWD=$2
DB=$3
{
	mysqldump -u $ID -p$PWD duce < $3
} > /dev/null
if [ $? -eq 0 ]; then
	echo "데이터 재생에 성공했습니다."
else
	echo "데이터 재생 실패. 첫번째 인자는 mysql ID, 두번째는 비밀번호, 세번째는 백업된 SQL파일 이름입니다."
fi
