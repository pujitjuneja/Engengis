#!/system/bin/sh
# Copyright© 2011 redmaner
# Engengis installer V5

clear
echo
echo " ------------------------"
echo "    Engengis.Installer   " 
echo " ------------------------"
echo 
wget -q http://dl.dropbox.com/u/26139869/engengis/currentversion -O /sdcard/currentversion
echo "Installer will install: `cat /sdcard/currentversion`"
sleep 2
echo
echo "Do you want to proceed?"
echo "[ y or n]"
read option

case "$option" in 
  "y" | "Y")
  echo
  echo "This will take a moment..."
  mount -o remount,rw /system
  rm -rf /system/etc/engengis
  rm -f /system/bin/engengis
  rm -f /system/bin/engengisa
  rm -f /system/bin/engengissettings
  rm -f /system/bin/engengisg
  rm -f /system/bin/engengishss
  rm -f /system/bin/engengisr
  rm -f /system/bin/engengiss
  rm -f /system/xbin/sqlite3
  rm -f /system/xbin/zipalign
  rm -f /system/etc/init.d/S07hsstweak
  rm -f /system/etc/init.d/S14zipalign
  rm -f /system/etc/init.d/S21sqlite
  rm -f /system/etc/init.d/S28scheduler
  rm -f /system/etc/init.d/S35sdreadspeed
  rm -f /system/etc/init.d/S42cpugovernor
  rm -f /system/etc/init.d/S49dropcaches
  rm -f /system/etc/init.d/S56internet
  rm -f /data/engengis.log
  echo "Installing new files..."
  mkdir /system/etc/engengis
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/bin/engengis -O /system/bin/engengis
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/etc/engengis/S07hsstweak -O /system/etc/engengis/S07hsstweak
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/etc/engengis/S14zipalign -O /system/etc/engengis/S14zipalign
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/etc/engengis/S21hsstweak -O /system/etc/engengis/S21hsstweak
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/etc/engengis/S28bfqscheduler -O /system/etc/engengis/S28bfqscheduler
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/etc/engengis/S28cfqscheduler -O /system/etc/engengis/S28cfqscheduler
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/etc/engengis/S28deadlinescheduler -O /system/etc/engengis/S28deadlinescheduler
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/etc/engengis/S28noopscheduler -O /system/etc/engengis/S28noopscheduler
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/etc/engengis/S28sioscheduler -O /system/etc/engengis/S28sioscheduler
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/etc/engengis/S28vrscheduler -O /system/etc/engengis/S28vrscheduler
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/etc/engengis/S35sd256 -O /system/etc/engengis/S35sd256
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/etc/engengis/S35sd512 -O /system/etc/engengis/S35sd512
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/etc/engengis/S35sd1024 -O /system/etc/engengis/S35sd1024
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/etc/engengis/S35sd2048 -O /system/etc/engengis/S35sd2048
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/etc/engengis/S35sd3072 -O /system/etc/engengis/S35sd3072
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/etc/engengis/S35sd4096 -O /system/etc/engengis/S35sd4096
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/etc/engengis/S42cpuconservative -O /system/etc/engengis/S42cpuconservative
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/etc/engengis/S42cpululzactive -O /system/etc/engengis/S42cpululzactive
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/etc/engengis/S42cpuinteractive -O /system/etc/engengis/S42cpuinteractive
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/etc/engengis/S42cpuondemand -O /system/etc/engengis/S42cpuondemand
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/etc/engengis/S42cpusmartassv2 -O /system/etc/engengis/S42cpusmartassv2
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/etc/engengis/S49dropcaches -O /system/etc/engengis/S49dropcaches
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/etc/engengis/S56internet -O /system/etc/engengis/S56internet
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/etc/engengis/version -O /system/etc/engengis/version
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/xbin/sqlite3 -O /system/xbin/sqlite3
  wget -q http://dl.dropbox.com/u/26139869/engengis/system/xbin/zipalign -O /system/xbin/zipalign
  echo "Setting permissions..."
  chmod 777 /system/bin/engengis
  chmod 777 /system/xbin/sqlite3
  chmod 777 /system/xbin/zipalign
  if [ -e /data/settings.conf ]; then
      sed -i '/status=*/ d' /data/engengis.conf;
      echo "status=updated" >> /data/engengis.conf;
  fi;
  echo
  echo "Installation complete!"
  sleep 5
  clear 
  engengis
  ;;
  "n" | "N")
  clear
  exit
  ;;
esac
