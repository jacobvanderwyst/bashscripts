#the following command must be used to allow execution of the script
#Set-ExecutionPolicy RemoteSigned
#Token for repo if needed can be found elsewhere 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

Write-Host "If EXE's fail use ~\downloads\"

# Install Python
Write-Host "Installing Python..."
Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.12.0/python-3.12.0a5.exe" -OutFile "~/downloads/python-3.12.0a5.exe" -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"
.\~\downloads\python-3.12.0a5.exe
#~\downloads\python-3.12.0a5.exe

Read-Host -Prompt "Press any key to continue..."
setx PATH "~\AppData\Local\Programs\Python\Python312-32"
py -m pip install --upgrade pip setuptools wheel
py -m pip install pyautogui
py -m pip install keyboard

# Install masscan for windows
git clone https://github.com/Arryboom/MasscanForWindows.git ~/desktop

# Install Snort
Write-Host "Installing Snort..."
Invoke-WebRequest -Uri "https://www.snort.org/downloads/snort/Snort_2_9_20_Installer.x64.exe" -OutFile "~/downloads/Snort_2_9_20_Installer.x64.exe" -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"
.\~\downloads\Snort_2_9_20_Installer.x64.exe
#~\downloads\Snort_2_9_20_Installer.x64.exe
Read-Host -Prompt "Press any key to continue..."

#install nmap
write-Host "Installing nmap..."
Invoke-WebRequest -Uri "https://nmap.org/dist/nmap-7.93-setup.exe" -OutFile "~/downloads/nmap-7.93-setup.exe" -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"
.\~\downloads\nmap-7.93-setup.exe
#~\downloads\nmap-7.93-setup.exe
Read-Host -Prompt "Press any key to continue..."

#install npcap
write-Host "Installing npcap..."
Invoke-WebRequest -Uri "https://npcap.com/dist/npcap-1.72.exe" -OutFile "~/downloads/npcap-1.72.exe" -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"
.\~\downloads\npcap-1.72.exe
#~\downloads\npcap-1.72.exe
Read-Host -Prompt "Press any key to continue..."

#install wireshark
write-Host "Installing wireshark..."
Invoke-WebRequest -Uri "https://2.na.dl.wireshark.org/win64/Wireshark-win64-4.0.4.exe" -OutFile "~/downloads/Wireshark-win64-4.0.4.exe" -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"
.\~\downloads\Wireshark-win64-4.0.4.exe
#~\downloads\Wireshark-win64-4.0.4.exe
Read-Host -Prompt "Press any key to continue..."

# Cleanup
Write-Host "Cleaning up..."
Remove-Item "~/downloads/Snort_2_9_20_Installer.x64.exe" -Force
Remove-Item "~/downloads/python-3.12.0a5.exe" -Force
Remove-Item "~/downloads/nmap-7.93-setup.exe" -Force
Remove-Item "~/downloads/npcap-1.72.exe" -Force
Remove-Item "~/downloads/Wireshark-win64-4.0.4.exe" -Force

#Running wide MassScan
Write-Host "Finding Competition IP's / Edron SaaS"
.\~\desktop\masscan64.exe 10.65.0.0/16 --ports 0-65535 
Write-Host "Adjacent to Cloud private"
.\~\desktop\masscan64.exe 172.16.32.254 --ports 0-65535
Write-Host "Cloud private"
.\~\desktop\masscan64.exe 192.168.255.1 --ports 0-65535
Write-Host "Office Workstations"
.\~\desktop\masscan64.exe 192.168.1.0/24 --ports 0-65535
Write-Host "Office Servers"
.\~\desktop\masscan64.exe 192.168.100.0/24 --ports 0-65535

#Disabling script execution
Write-Host "Disabling script execution..."
Set-ExecutionPolicy Restricted