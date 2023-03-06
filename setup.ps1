#the following command must be used to allow execution of the script
#Set-ExecutionPolicy RemoteSigned
#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

# Install Python
Write-Host "Installing Python..."
#Start-Process -FilePath "https://www.python.org/ftp/python/3.12.0/python-3.12.0a5.exe" -ArgumentList "/quiet", "InstallAllUsers=1", "PrependPath=1" -Wait
Read-Host -Prompt "Press any key to continue..."

#install make 
Write-Host "Installing Make..."
#~\Desktop\bashscripts\make.exe
Read-Host -Prompt "Press any key to continue..."

# Install Snort
Write-Host "Installing Snort..."
Invoke-WebRequest -Uri "https://www.snort.org/downloads/snort/daq-2.0.7.tar.gz" -OutFile "daq-2.0.7.tar.gz" -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"
tar -xf "daq-2.0.7.tar.gz"
cd daq-2.0.7
.\make install
cd ..

Invoke-WebRequest -Uri "https://www.snort.org/downloads/snort/snort-2.9.20.tar.gz" -OutFile "snort-2.9.20.tar.gz" -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"
tar -xf "snort-2.9.20.tar.gz"
cd .\snort-2.9.20
.\make install
cd ..

# Cleanup
Write-Host "Cleaning up..."
#Remove-Item "daq-2.0.7.tar.gz" -Force
#Remove-Item "snort-2.9.20.tar.gz" -Force
#Remove-Item -Recurse ".\Snort" -Force
#Remove-Item "gzip_installer" -Force

#disabling script execution
#Set-ExecutionPolicy Restricted