#!/usr/bin/env python3
import argparse
import sys
import socket
import random
import struct

from scapy.all import sendp, get_if_hwaddr,sendpfast
from scapy.all import Packet
from scapy.all import Ether, IP, UDP, TCP
from time import sleep

def main():

    addr = '192.168.50.57'
    iface = 'enp0s8'

    payload = "1"*466    
    pkt = Ether(src=get_if_hwaddr(iface), dst='08:00:27:00:00:07') / IP(dst=addr) / UDP(dport=1234, sport=random.randint(49152,65535)) / payload 
    
    while True:
        Mbps = (random.randint(50,80))
        Sleep = random.uniform(0.01,1)
        print(Mbps, Sleep)
        sendpfast(pkt, iface=iface, mbps=Mbps)
        #sleep(Sleep)

if __name__ == '__main__':
    main()