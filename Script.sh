wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip -o ngrok-stable-linux-amd64.zip > /dev/null 2>&1
clear
read -p "Paste authtoken here (Copy and Ctrl+V to paste then press Enter): " CRP
./ngrok authtoken $CRP 
nohup ./ngrok tcp 3389 &>/dev/null &
echo Updating packages...
sudo apt update -y > /dev/null 2>&1
echo "Installing Ubuntu Desktop and XRdp"
sudo apt install ubuntu-desktop xrdp curl -y > /dev/null 2>&1
sudo service xrdp start
echo Please add a password..
sudo adduser ubuntu
sudo usermod -aG sudo ubuntu
echo Your RDP IP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "Note: Use Right-Click To Copy"
echo "Keep this tab open"
