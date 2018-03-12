
#Doc thu muc hien tai

#tao mang de duyet cac thu trong tuan.
    array_var[0]="Mon"
    array_var[1]="Tue"
    array_var[2]="Web"
    array_var[3]="Thud"
    array_var[4]="Fri"
    array_var[5]="Sta"
    array_var[6]="Sun"

#Ham tao folder lay ten la thu trong tuan va download anh theo vi tri anh tren trinh duyet.
function createFolder(){
dayNow=$(date +%a)
    for((i=0;i<7;i++))
    do
        note=$i
        if [[ $dayNow = ${array_var[$i]} ]]
        then
            count=2

#Vong lap tao folder lay ngay tro ve truoc
            for((j=$note;j>=0;j--))
                do
                    date=$(date -d"now -$j day" "+%Y-%m-%d")
		    deleteFolderExists
                    sudo mkdir -p /home/huong1/$date/
                    cd /home/huong1/$date/
       		    sudo chmod 777 .
        	    getLinkDownLoadImageFromGogle
                    ((count++))

            done
#vong lap tao folder lay ngay tra ve sau
            for((k=$note;k<7;k++))
                do
                    date=$(date -d"now +$k day" "+%Y-%m-%d")
		    deleteFolderExists
                    sudo mkdir -p /home/huong1/$date/
                    cd /home/huong1/$date/
                    sudo chmod 777 .
                    getLinkDownLoadImageFromGogle
                    ((count++))
                done
        fi
    done
}

#Ham nhan link de download anh
function getLinkDownLoadImageFromGogle(){
	imagelink=$(wget --user-agent 'Mozilla/5.0' -qO - "https://www.google.com.vn/search?q=huong\&tbm=isch" | sed 's/</\n</g' | grep '<img' | head -	n"$count" | tail -n1 | sed 's/.*src="\([^"]*\)".*/\1/g')
        wget $imagelink
}

#Neu folder o duong dan tao da ton tai thi tien hanh xoa .
function deleteFolderExists(){
	if [ -d /home/huong1 ]
	then
	sudo rm -r /home/huong1
	fi
}
createFolder

#//Nam trong funtion va moi funtion k dai qua 4 dong.
#//Moi bien la cac tu tieng anh (co nghia ro rang).
#refactory.
#Dinh nghia: Tai sao lai phai dung git, no su dung nhu the nao.

