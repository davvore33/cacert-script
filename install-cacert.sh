primof=`cat nome1.txt`
secondf=`cat nome2.txt`

echo attenzione se adb sta gia girando, va chiuso, ora lo farò partire con i permessi di root

adb root

echo rimonto la partizione /system
adb remount

echo push dei file

chmod 644 $primof
chmod 644 $secondf

adb push $primof /system/etc/security/cacerts/
adb push $secondf /system/etc/security/cacerts/

echo ricorda di riavviare il cellulare \[adb reboot \]
