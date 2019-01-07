sudo update-grub
sudo useradd -m -s /bin/bash S3CEB
sudo passwd S3CEB
sudo useradd -m -s /bin/bash S3CEA
sudo passwd S3CEA
sudo useradd -m -s /bin/bash S1CSEBM
sudo passwd S1CSEBM
sudo useradd -m -s /bin/bash S1CSEBT
sudo passwd S1CSEBT
sudo useradd -m -s /bin/bash S1CSEAT
sudo passwd S1CSEAT
sudo useradd -m -s /bin/bash S1CSEAF
sudo passwd S1CSEAF
sudo useradd -m -s /bin/bash S3ECEA
sudo passwd S3ECEA
sudo useradd -m -s /bin/bash S3ECEB
sudo passwd S3ECEB
sudo sh -c 'echo "greeter-show-manual-login=true" >> /etc/lightdm/lightdm.conf'
