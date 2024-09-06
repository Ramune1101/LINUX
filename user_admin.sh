#!/bin/bash
#Variable Definitions
TMP1=/tmp/tmp1

#Fuc
MENU () {

cat << EOF
------------------------------------
1) 사용자 추가
2) 사용자 확인
3) 사용자 삭제
4) 종료
------------------------------------
EOF

}

USERADD() {
    echo "(사용자 추가)"
    echo "추가할 사용자 이름 : "
    read ADDUSER

    useradd $ADDUSER >/dev/null 2>&1
    echo $ADDUSER | passwd --stdin $ADDUSER

       [ $? -eq 0 ] \
         && echo "성공적으로 추가 되었습니다."\
         || echo "비정상 오류 , 추가 하지 못했습니다."
} 

USERLIST() {
    cat << EOF
    (사용자 확인)
------------------------------------
$(awk -F: '$3 >=1001 && $3 <=60000 {print $1}' /etc/passwd | sort | tee $TMP1 | nl)
------------------------------------
EOF
}

USERDEL() {
    echo "(사용자 삭제)"
    echo "삭제할 사용자 이름? : "
    read DELUSER
    
    userdel -r $DELUSER >/dev/null 2>&1

    [ $? -eq 0 ] \
         && echo "성공적으로 삭제 되었습니다."\
         || echo "비정상 오류 , 삭제 하지 못했습니다."



}

while true
do
    MENU
    echo -n "선택번호 : "
    read NUM
    echo $NUM


    case $NUM in
        1) USERADD ;;
        2) USERLIST ;;
        3) USERDEL ;;
        4) break ;;
        *)echo "[WARN] 잘못된 지정" ;;
    esac
    echo

done