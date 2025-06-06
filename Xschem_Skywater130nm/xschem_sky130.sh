cd ~
sudo apt -qq update
sudo apt -qq install git make xschem magic ngspice netgen
## check version of xschem by, xschem --version
## if less than 3.4.xx remove and compile from source 
echo -e "\e[32mInstall xschem magic ngspice done\e[0m"
## make sure to have git, python3-pip installed
git clone https://github.com/RTimothyEdwards/open_pdks
cd open_pdks
./configure --enable-sky130-pdk
make
sudo make install
##refer to install xschem for older ubuntu release
##https://github.com/rajdeep66/edaBundle_whyRD/blob/main/whyrd_eda_bundle.sh