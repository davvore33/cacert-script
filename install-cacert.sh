primof=`cat nome1.txt`
secondf=`cat nome2.txt`


#termino ogni adb server preesistente, necessario a causa di incompatibilità per il comando remount
adb kill-server
#faccio partire adb con i permessi di root, necessario sempre per remount
adb root

state=`adb get-state`

if [ $state != "device" ]
then
	echo non hai un cellulare collegato
	exit 1
fi

#necessario rimontare /system con i permessi di scrittura, se la procedura non va a buon fine
#adb shell; su; mount -o remount, rw /system
adb remount

echo push dei file

#copio i file .0 dei due certificati su /sdcard, dopodiche ne cambio i permessi e infine li sposto nella
#cartella di sistema

chmod 644 $primof
chmod 644 $secondf

adb push $primof /system/etc/security/cacerts/
adb push $secondf /system/etc/security/cacerts/

echo ricorda di riavviare il cellulare \[adb reboot \], al termine della procedura dovresti poter\
vedere \"CaCert\" fra i certificati utenti validi \[Impostazioni -\> Sicurezza\]
