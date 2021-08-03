# PoC_CloudNet2021
Public repository with all infrastructure used in a Proof-of-Concept (PoC) of the paper "Using Machine Learning and In-band Network Telemetry for Service Metrics Estimation", submitted of CloudNet Conference 2021.

## Licence: 
Creative Commons ![alt text](https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Cc-by-nc_icon.svg/88px-Cc-by-nc_icon.svg.png)

## Requirements: 
- Hardware
    - 200 GB of HD
    - 32 GB of RAM
    - Processors intel Xeon E5-2630 2.60GHz (or similar)
- Software
    - Operating System Linux ou OSX.
    - Virtualbox
    - Vagrant
    - Ansible

## Topology:
![alt text](https://raw.githubusercontent.com/leandrocalmeida/PoCSBRC2021/main/pictures/Cenario.jpeg)

## Steps for run PoC
1. Clone git repository

``` 
git clone https://github.com/leandrocalmeida/CloudNet2021.git
```

2. Start with vagrant
```
cd CloudNet2021/ 
vagrant up --provision
```
3. Start collect script in SinkServer
```
vagrant ssh sinkServer
cd /vagrant/code/
sudo ./receive_int.py
```
4. Start INT sender packets in a dashServer
```
vagrant ssh dashServer
cd /vagrant/code/
sudo ./send_int.py 192.168.50.52
```
6. Start vlc player in clientVlc (Obs: use GUI interface with RDP protocol)
```
cd /vagrant/host-setup/clientVlc/
./client.sh
```
8. Start load generators for sinusoid pattern (IF SINUSOID)
```
cd code/
./run_experiment_sinusoid.sh
```
10. Start load generators for flashcrowd pattern (IF FLASHCROWD)
```
cd code/
./run_experiment_flashcrowd.sh
```

## Steps for build the dataset
1. INT metrics (X) in the sinkServer
```
cd /vagrant/code/logs/
```
File ```log_INT.txt```

2. Extract QoS metrics (Y) from clientVlc
```
cd /home/p4/logs/
```
File with name ```dash_exp_"DATE".log```
# PoC_CloudNet2021
