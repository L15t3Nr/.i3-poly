#!/bin/bash

clear
echo -e "\n\n\n\n\n\n\n"
echo "[-] Installing repository update:"
sudo apt update -y > /dev/null 2>&1
echo -e "\t [+]Update Complete"
echo "[-]Installing Packages"
sudo apt install i3 polybar nitrogen picom redshift terminator rofi -y > /dev/null 2>&1
echo -e "\t [+] Install Complete"
rm -r ~/Documents ~/Public ~/Templates ~/Music ~/Videos > /dev/null 2>&1
echo "[+] Removed Directories"
mkdir ~/.config/i3 > /dev/null 2>&1
echo "[+] Creating .config/i3"
mkdir ~/.config/polybar > /dev/null  2>&1
echo "[+] Creating .config/polybar"
cp ~/OSCP/.i3-poly/i3-config ~/.config/i3/config > /dev/null 2>&1
echo "[+] Copied i3-config --> ~/.config/i3/config"
cp ~/OSCP/.i3-poly/poly-config ~/.config/polybar/config.ini > /dev/null 2>&1
echo "[+] Copied poly-config --> ~/.config/polybar/config.ini"
cp ~/OSCP/.i3-poly/term-config ~/.config/terminator/config > /dev/null 2>&1
echo "[+] Copied term-config --> ~/.config/terminator/config"
git config --global user.name "L15t3Nr" > /dev/null 2>&1
echo "[+] Set Global Git Username"
git config --global user.email "l15t3nr@gmail.com" > /dev/null 2>&1
echo "[+] Set global Git Email"
echo "[-] Downloading and Installing Sliver C2"
curl https://sliver.sh/install > /dev/null 2>&1 | sudo bash > /dev/null 2>&1
echo -e "\t [+] Sliver Install Complete"
sudo systemctl enable sliver > /dev/null 2>&1
echo -e "\t [+] Enabled Sliver C2"
echo "[-] Downloading SecLists --> /opt/SecLists"
sudo git clone https://github.com/danielmiessler/SecLists.git /opt/SecLists > /dev/null 2>&1
echo -e "\t [+] Seclists Download Finished"
echo "[-] Download Obsidian AppImage"
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.4.16/Obsidian-1.4.16.AppImage 2>&1
chmod +x Obsidian-1.4.16.AppImage 2>&1
echo -e "\t [+]Dowload Finished"
echo "[-] Creating Obsidian .desktop"
touch Obsidian.desktop
cat > Obsidian.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Obsidian
Exec="/home/l15t3nr/.local/bin/Obsidian-1.4.16.AppImage"
Terminal=false
EOF
sudo mv Obsidian.desktop /usr/share/applications/Obsidian.desktop
mv Obsidian-1.4.16.AppImage ~/.local/bin/Obsidian-1.4.16.AppImage
chmod +x ~/.local/bin/Obsidian-1.4.16.AppImage
sudo sed -i 's/socks4       127.0.0.1 9050/socks5   127.0.0.1 9050/g' /etc/proxychains4.conf
echo "[+] Fixed /etc/proxychains4.conf"
echo "DONE"
