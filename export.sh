#!/bin/bash
#Works only on debian-based machines!
#sudo apt install dbf2mysql before run
indir="./"
dblogin="root"
dbpass="yourpassword"
db="fias"
host="localhost"
postfix=".DBF"
prefix="./"
cd $indir
for file in `find ./ -type f -name "*$postfix"`
do
    table_tmp=${file%$postfix}
    table_tmp=${table_tmp#$prefix}
            table=${table_tmp,,}
    echo "WORK WITH :$table"
        dbf2mysql -vvv -d $db -t $table -c -h $host -P $dbpass -U $dblogin $file
    mysqldump -u$dblogin -p$dbpass --default-character-set=latin1 $db $table>/tmp/$table.sql
            iconv -f cp866 -t utf-8 /tmp/$table.sql>/tmp/$table.outtmp.sql
    more /tmp/$table.outtmp.sql|sed 's/latin1/utf8/'>/tmp/$table.out.sql
            mysql -u$dblogin -p$dbpass -T --show-warning -e "delete from $table" $db
    mysql -u$dblogin -p$dbpass -T --show-warning $db</tmp/$table.out.sql
        #   break
rm /tmp/$table.out.sql&rm /tmp/$table.outtmp.sql&rm $file
done
