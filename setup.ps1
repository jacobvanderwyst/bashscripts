#the following command must be used to allow execution of the script
#Set-ExecutionPolicy RemoteSigned
#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

# Install Python
Write-Host "Installing Python..."
#Start-Process -FilePath "https://www.python.org/ftp/python/3.12.0/python-3.12.0a5.exe" -ArgumentList "/quiet", "InstallAllUsers=1", "PrependPath=1" -Wait
#~\downloads\python-3.12.0a5.exe
Read-Host -Prompt "Press any key to continue..."

# Install Snort
Write-Host "Installing Snort..."
Invoke-WebRequest -Uri "https://www.snort.org/downloads/snort/Snort_2_9_20_Installer.x64.exe" -OutFile "~/downloads/Snort_2_9_20_Installer.x64.exe" -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"
#Start-Process -FilePath "https://www.snort.org/downloads/snort/Snort_2_9_20_Installer.x64.exe" -ArgumentList "/quiet", "InstallAllUsers=1", "PrependPath=1" -Wait
~\downloads\Snort_2_9_20_Installer.x64.exe
Read-Host -Prompt "Press any key to continue..."

# Cleanup
Write-Host "Cleaning up..."
#Remove-Item "~/downloads/Snort_2_9_20_Installer.x64.exe" -Force
#Remove-Item "~/downloads/python-3.12.0a5.exe" -Force
#Remove-Item "" -Force

#disabling script execution
#Set-ExecutionPolicy Restricted