sed -e "s/#.*//" -e "s/ (/(/g" -e "s/ )/)/g" -e "s/ }/}/g" -e "s/ {/{/g" -e "s/^ *//g" | tr "\n" " "
