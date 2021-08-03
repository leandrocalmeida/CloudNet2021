# PoCSBRC2021

Repositório público contendo a infraestrutura utilizada na Prova de Conceito (PoC) do artigo "Estimando métricas de serviço através de In-band Network Telemetry", submetido ao XXXIX Simpósio Brasileiro de Redes de Computadores e Sistemas Distribuídos.

## Licença: 
Creative Commons ![alt text](https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Cc-by-nc_icon.svg/88px-Cc-by-nc_icon.svg.png)

## Requisitos: 
- Hardware
    - 200 GB de espaço em disco
    - 32 GB de memória RAM
    - Processadores intel Xeon E5-2630 2.60GHz (ou similar)
- Software
    - Sistema operacional Linux (testado no ubuntu) ou OSX.
    - Virtualbox
    - Vagrant
    - Ansible

## Topologia:
![alt text](https://raw.githubusercontent.com/leandrocalmeida/PoCSBRC2021/main/pictures/Cenario.jpeg)

## Passos para executar a PoC
1. Clonar o repositório git

``` 
git clone https://github.com/leandrocalmeida/PoCSBRC2021.git
```

2. Iniciar a infraestrutura com o vagrant
```
cd PoCSBRC2021/ 
vagrant up
```
3. Iniciar as coletas INT no sinkServer
```
vagrant ssh sinkServer
cd /vagrant/code/
sudo ./receive_int.py
```
4. Iniciar o envio de pacotes INT no dashServer
```
vagrant ssh dashServer
cd /vagrant/code/
sudo ./send_int.py 192.168.50.52
```
6. Iniciar o VLC no clientVlc (Obs: utilizar a interface gráfica via protocolo RDP)
```
cd /vagrant/host-setup/clientVlc/
./client.sh
```
8. Iniciar a carga no loadGen1 (Obs: utilizar a interface gráfica via protocolo RDP)
```
cd /vagrant/code/loadGen/loadGen1/
./mix_periodic_dash1.sh
```
9. Iniciar a carga no loadGen2 (Obs: utilizar a interface gráfica via protocolo RDP)
```
cd /vagrant/code/loadGen/loadGen2/
./mix_periodic_dash2.sh
```
10. Iniciar a carga no loadGen3 (Obs: utilizar a interface gráfica via protocolo RDP)
```
cd /vagrant/code/loadGen/loadGen3/
./mix_periodic_dash3.sh
```
## Passos para construir o dataset
1. Métricas INT (X) no sinkServer
```
cd /vagrant/code/logs/
```
O arquivo é o ```log_INT.txt```

2. Coletar as métricas de QoS (Y) no clientVlc
```
cd /home/p4/logs/
```
O arquivo possui formato com o nome ```dash_exp_"DATE".log```
# PoCTNSM
