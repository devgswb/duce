#!/bin/bash
current="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
parent="$(dirname "$current")"
echo "게시판에서 삭제처리된 파일을 서버에서 삭제합니다."
echo "삭제된 파일은 복구 불가능합니다. 계속 하시겠습니까?"
select yn in "네" "아니오" "삭제될-파일-보기"; do
    case $yn in
        네 )
		find $parent -name "*.del" -type f -delete > /dev/null
if [ $? -eq 0 ]; then
	echo "파일 삭제에 성공하였습니다."
else
	echo "삭제중 오류가 발생하였습니다."
fi
		break;;
        아니오 ) exit;;
	삭제될-파일-보기 ) 
		find $parent -type f -name "*.del"
		break;
    esac
done
