TODAY=`date -I`
EXPIRE=`date -d -7day +"%Y-%m-%d"`

WEB_HOME=/data/zino/webapp
WEB_BACKUP_DIR="./uploads"
DROPBOX_SH=/root/dropbox_uploader.sh
BACKUP_DIR=/data/backup/
BACKUP_LOG=/data/backup/${TODAY}.log

MYSQL_USER="root"
MYSQL_PASS="root"
MYSQL_DB="zino"

Dropbox=/${TODAY}
#Create Today BackupDirectory
if [ ! -d $BACKUP_DIR/$TODAY ];then
    mkdir -p $BACKUP_DIR/$TODAY
fi

echo "--- ${TODAY} ---" > $BACKUP_LOG
#Backup Mysql DB
echo "Backup Mysql DB." >> $BACKUP_LOG
echo "Start Time : `date +%F" "%H:%M:%S`" >> $BACKUP_LOG
/usr/bin/mysqldump -u$MYSQL_USER -p$MYSQL_PASS --skip-opt --add-drop-table --create-options -q -e --set-charset --routines --single-transaction --master-data=2 $MYSQL_DB > ${TODAY}_db.sql --log-error=$BACKUP_LOG
tar zcf ${TODAY}_db.tar.gz *.sql
rm -f *.sql
mv ${TODAY}_db.tar.gz ${BACKUP_DIR}/${TODAY}/
echo "Stop Time : `date +%F" "%H:%M:%S`" >> $BACKUP_LOG

#Backup Website Data
echo "Backup Website Data." >> $BACKUP_LOG
echo "Start Time : `date +%F" "%H:%M:%S`" >> $BACKUP_LOG
cd $WEB_HOME
tar zcf ${TODAY}_uploads.tar.gz $WEB_BACKUP_DIR
mv ${WEB_HOME}/${TODAY}_uploads.tar.gz ${BACKUP_DIR}/${TODAY}/
echo "Stop Time : `date +%F" "%H:%M:%S`" >> $BACKUP_LOG


#Upload Dropbox
echo "Upload backup." >> $BACKUP_LOG
echo "Start Time : `date +%F" "%H:%M:%S`" >> $BACKUP_LOG
$DROPBOX_SH upload ${BACKUP_DIR}/${TODAY}/${TODAY}_db.tar.gz ${Dropbox}/${TODAY}_db.tar.gz >> $BACKUP_LOG
$DROPBOX_SH upload ${BACKUP_DIR}/${TODAY}/${TODAY}_uploads.tar.gz ${Dropbox}/${TODAY}_uploads.tar.gz >> $BACKUP_LOG
echo "Stop Time : `date +%F" "%H:%M:%S`" >> $BACKUP_LOG

#Delete old data
echo "Delete Expire data." >> $BACKUP_LOG
echo "Start Time : `date +%F" "%H:%M:%S`" >> $BACKUP_LOG
find ${BACKUP_DIR} -mtime +3 | xargs rm -rf 
$DROPBOX_SH delete /$EXPIRE/ >> $BACKUP_LOG
echo "Stop Time : `date +%F" "%H:%M:%S`" >> $BACKUP_LOG
