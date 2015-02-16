wget https://www.cacert.org/certs/root.crt
wget https://www.cacert.org/certs/class3.crt

rootname=`openssl x509 -inform PEM -subject_hash_old -in root.crt | head -1`
class3name=`openssl x509 -inform PEM -subject_hash_old -in class3.crt | head -1`

rootname="${rootname}.0"
class3name="${class3name}.0"

cat root.crt > $rootname
cat class3.crt > $class3name

openssl x509 -inform PEM -text -in root.crt -out /dev/null >> $rootname
openssl x509 -inform PEM -text -in class3.crt -out /dev/null >> $class3name

echo $rootname > nome1.txt
echo $class3name > nome2.txt

rm root.crt
rm class3.crt
