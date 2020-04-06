#!/bin/bash
MOONAME=${MOONAME:=flamecoast}
DBNAME=${DBNAME:=flamecore}
DBPATH=${DBPATH:=/data}
if [ -r ${DBPATH}/${DBNAME}.db.new ]; then
  DATE=`date +%Y_%m_%d_%T`
  echo "Saving prior DB as ${DBNAME}.db.${DATE}"
  mv ${DBPATH}/${DBNAME}.db ${DBPATH}/${DBNAME}.db.${DATE}
  echo "Putting new DB into place"
  mv ${DBPATH}/${DBNAME}.db.new ${DBPATH}/${DBNAME}.db
  echo "Compressing old DB"
  gzip ${DBPATH}/${DBNAME}.db.${DATE} &
fi
if [ -r ${DBPATH}/${MOONAME}.log ]; then
  cat ${DBPATH}/${MOONAME}.log | tee -a ${DBPATH}/${MOONAME}.log.old >/dev/null
  rm ${DBPATH}/${MOONAME}.log
fi
/app/moo -l ${DBPATH}/$MOONAME.log ${DBPATH}/${DBNAME}.db ${DBPATH}/${DBNAME}.db.new ${PORT}
