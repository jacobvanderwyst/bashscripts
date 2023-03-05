# Install Python
Write-Host "Installing Python..."
Start-Process -FilePath "https://www.python.org/ftp/python/3.10.0/python-3.10.0-amd64.exe" -ArgumentList "/quiet", "InstallAllUsers=1", "PrependPath=1" -Wait

# Install Git
Write-Host "Installing Git..."
Start-Process -FilePath "https://github.com/git-for-windows/git/releases/download/v2.34.1.windows.1/Git-2.34.1-64-bit.exe" -ArgumentList "/VERYSILENT", "/NORESTART", "/NOCANCEL", "/SP-", "/CLOSEAPPLICATIONS", "/RESTARTAPPLICATIONS" -Wait

# Install Snort
Write-Host "Installing Snort..."
Invoke-WebRequest -Uri "https://www.snort.org/downloads/snort/daq-2.0.7.tar.gz" -OutFile "daq-2.0.7.tar.gz"
Expand-Archive -Path "daq-2.0.7.tar.gz" -DestinationPath ".\Snort"
cd .\Snort\daq-2.0.7
./configure
make
make install
cd ..
Invoke-WebRequest -Uri "https://www.snort.org/downloads/snort/snort-2.9.18.1.tar.gz" -OutFile "snort-2.9.20.tar.gz"
Expand-Archive -Path "snort-2.9.20.tar.gz" -DestinationPath ".\Snort"
cd .\Snort\snort-2.9.18.1
./configure --enable-sourcefire --enable-inline --prefix=/usr/local/snort
make
make install
cd ..

# Cleanup
Write-Host "Cleaning up..."
Remove-Item "daq-2.0.7.tar.gz" -Force
Remove-Item "snort-2.9.20.tar.gz" -Force
Remove-Item -Recurse ".\Snort" -Force