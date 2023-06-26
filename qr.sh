#!/bin/bash
read -p $'1 Terminal \n2 PNG File\nPlease select the QR code type:\n' type
while [ $type -ne 1 ] && [ $type -ne 2 ]
do
read -p $'Please select the QR code type:\n1 Terminal \n2 PNG File\n' type
done
if [ $type -eq 1 ]; then
read -p "Please enter the value: "  qr
if [ -z "$qr" ]; then
echo "The Value cannot be empty! "
exec "$0"
else
qrencode -t ansiutf8 '$qr'
if [ $? -ne 0 ]; then
    apt install qrencode -y
qrencode -t ansiutf8 '$qr'
fi
fi
else
read -p "Please enter the value: "  qr
if [ -z "$qr" ]; then
echo "The Value cannot be empty! "
exec "$0"
else
echo "$qr" >> tmp.conf
read -p "Please enter the size In Pixels (Default=10): " size
if [ -z "$size" ]; then
qrencode -s 10 -o qr_code.png '$qr'
else
qrencode -s $size -o qr_code.png '$qr'
fi
fi
echo "your png file saved as qr_code.png!"
fi
