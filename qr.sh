
#!/bin/bash
read -p "Please enter the value: "  qr
echo "$qr" >> tmp.conf
qrencode -t ansiutf8 < ./tmp.conf
if [ $? -ne 0 ]; then
    apt install qrencode -y
qrencode -t ansiutf8 < ./tmp.conf

fi
rm -rv ./tmp.conf
