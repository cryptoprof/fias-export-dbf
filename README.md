# fias-export-dbf
Экспорт адресов из fias.nalog.ru в формате dbf в mysql  
Скрипт работает только в Ubuntu и проверялся на ней. Для работы скрипта требуется пакет dbf2mysql
```bash
sudo apt install dbf2mysql
```
Перед экспортом создайте загрузите данные в формате dbf с сайта https://fias.nalog.ru/Updates  
Разархивируйте только нужные файлы - например addrob62 - адреса Рязанской области  
Пропишите необходимые данные для доступа к mysql и путь до загруженных файлов:
```bash
#Путь до файла
indir="../"
#Логин mysql
dblogin="root"
#Пароль
dbpass="yourpassword"
#Название БД
db="fias"
#Адрес сервера mysql
host="localhost"
```
Запустите экспорт:
```bash
chmod +x export.sh
./export.sh
```
