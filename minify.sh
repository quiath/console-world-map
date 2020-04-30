printf "awk -v W=`tput cols` -v H=`tput lines` '" && sed -e "s/#.*//" -e "s/ *( */(/g" -e "s/ *) */)/g" -e "s/ *} */}/g" -e "s/ *{ */{/g" -e "s/^ *//g" -e "s/, /,/g" | tr -d "\n" && printf "'\n"
