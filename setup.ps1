#the following command must be used to allow execution of the script
#Set-ExecutionPolicy RemoteSigned

Write-Host "If EXE's fail use $home\downloads\ This could happen depending on windows version and whether you are using powershell or CMD"

#install procmon
Write-Host "Installing ProcMon..."
Invoke-WebRequest -Uri "https://download.sysinternals.com/files/ProcessMonitor.zip" -OutFile "$home\downloads/procmon.zip" -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"
mkdir $home\Desktop\procmon
tar -xf $home\Downloads\procmon.zip -C $home\Desktop\procmon\
# Install Python
Write-Host "Installing Python..."
Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.12.0/python-3.12.0a5.exe" -OutFile "$home\downloads/python-3.12.0a5.exe" -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"
.\$home\downloads\python-3.12.0a5.exe
#$home\downloads\python-3.12.0a5.exe

Read-Host -Prompt "Press any key to continue..."
setx PATH "$home\AppData\Local\Programs\Python\Python312-32"
py -m pip install --upgrade pip setuptools wheel
py -m pip install pyautogui
py -m pip install keyboard
Read-Host -Prompt "Press any key to continue..."

# Install masscan for windows
git clone https://github.com/Arryboom/MasscanForWindows.git $home\desktop
Read-Host -Prompt "Press any key to continue..."

# Install Snort
Write-Host "Installing Snort..."
Invoke-WebRequest -Uri "https://www.snort.org/downloads/snort/Snort_2_9_20_Installer.x64.exe" -OutFile "$home\downloads/Snort_2_9_20_Installer.x64.exe" -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"
.\$home\downloads\Snort_2_9_20_Installer.x64.exe
#$home\downloads\Snort_2_9_20_Installer.x64.exe
Read-Host -Prompt "Press any key to continue..."

#install nmap
write-Host "Installing nmap..."
Invoke-WebRequest -Uri "https://nmap.org/dist/nmap-7.93-setup.exe" -OutFile "$home\downloads/nmap-7.93-setup.exe" -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"
.\$home\downloads\nmap-7.93-setup.exe
#$home\downloads\nmap-7.93-setup.exe
Read-Host -Prompt "Press any key to continue..."

#install npcap
write-Host "Installing npcap..."
Invoke-WebRequest -Uri "https://npcap.com/dist/npcap-1.72.exe" -OutFile "$home\downloads/npcap-1.72.exe" -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"
.\$home\downloads\npcap-1.72.exe
#$home\downloads\npcap-1.72.exe
Read-Host -Prompt "Press any key to continue..."

#install wireshark
write-Host "Installing wireshark..."
Invoke-WebRequest -Uri "https://2.na.dl.wireshark.org/win64/Wireshark-win64-4.0.4.exe" -OutFile "$home\downloads/Wireshark-win64-4.0.4.exe" -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"
.\$home\downloads\Wireshark-win64-4.0.4.exe
#$home\downloads\Wireshark-win64-4.0.4.exe
Read-Host -Prompt "Press any key to continue..."

# Cleanup
Write-Host "Cleaning up..."
Remove-Item "$home\downloads/Snort_2_9_20_Installer.x64.exe" -Force
Remove-Item "$home\downloads/python-3.12.0a5.exe" -Force
Remove-Item "$home\downloads/nmap-7.93-setup.exe" -Force
Remove-Item "$home\downloads/npcap-1.72.exe" -Force
Remove-Item "$home\downloads/Wireshark-win64-4.0.4.exe" -Force

#Running wide MassScan
Write-Host "Finding Competition IP's / Edron SaaS"
.\$home\desktop\masscan64.exe 10.65.0.0/16 --ports 0-65535 
#$home\desktop\masscan64.exe 10.65.0.0/16 --ports 0-65535
Read-Host -Prompt "Press any key to continue..."

Write-Host "Adjacent to Cloud private, this is firewall"
.\$home\desktop\masscan64.exe 172.16.32.254 --ports 0-65535
#$home\desktop\masscan64.exe 172.16.32.254 --ports 0-65535
Read-Host -Prompt "Press any key to continue..."

Write-Host "Cloud private"
.\$home\desktop\masscan64.exe 192.168.255.1 --ports 0-65535
#$home\desktop\masscan64.exe 192.168.255.1 --ports 0-65535
Read-Host -Prompt "Press any key to continue..."

Write-Host "Office Workstations"
.\$home\desktop\masscan64.exe 192.168.1.0/24 --ports 0-65535
#$home\desktop\masscan64.exe 192.168.1.0/24 --ports 0-65535
Read-Host -Prompt "Press any key to continue..."

Write-Host "Office Servers"
.\$home\desktop\masscan64.exe 192.168.100.0/24 --ports 0-65535
#$home\desktop\masscan64.exe 192.168.100.0/24 --ports 0-65535
Read-Host -Prompt "Press any key to continue..."

#Configuring Basic Firewall Rules
#netsh advfirewall firewall add rule name="All ICMP V4 BLOCK" dir=in action=block protocol=icmpv4
Write-Host "Configuring Firewall Rules"
#netsh advfirewall firewall set rule group="remote administration" new enable=No
netsh advfirewall firewall set rule group="remote desktop" new enable=No

netsh advfirewall set allprofiles state on

Write-Host "Dumping rules to Desktop"
netsh advfirewall firewall show rule name=all > $home\Desktop\firewallrules.txt

Write-Host "Enabling and Updating AV"
#Check if AV is enabled and Update
$avstate=Get-MpComputerStatus | findstr "AntivirusEnabled"
if [/I] $avstate == "AntivirusEnabled                 : False" Set-MpPreference -AntivirusEnabled $true
Update-MpSignature

#Configuring Basic Snort Rules
Write-Host "Configuring Snort Rules"


#Disabling script execution
Write-Host "Disabling script execution..."
Set-ExecutionPolicy Restricted