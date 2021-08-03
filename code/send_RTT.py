#!/usr/bin/python3


import sys
import os
from scapy.all import *
from scapy.layers import all
from pythonping import ping
from datetime import datetime
import time

def get_RTT(target):
    result_ping = ping(target) #perform ping against target
    return result_ping.rtt_avg_ms #return rtt_avg

def log_rtt(rtt_avg, timestamp):
    log_str = str(timestamp) + ',' + str(rtt_avg) #join timestamp and rtt_avg to write into a log file
    with open('logs/log_rtt.txt','a+') as file:
        file.write(log_str + '\n') #write log into a log file

def main():
    #Usage sudo ./send_RTT.py IP_dst
    
    ip = sys.argv[1] #get target IP from STDIN to compute RTT_avg

    with open('logs/log_rtt.txt','w+') as file:
        file.write( 'timestamp, rtt_avg' + '\n')

    #loop while using. This function send one ping(four ICMP echo pkts) to target and one packet per second to the Sink. 
    while True:
        time.sleep(1) #wait 1 sec
        rtt_avg = get_RTT(ip) #call get_RTT function, to compute RTT_avg. This function return rtt_avg_ms.
        ts = int(time.time())
        log_rtt(rtt_avg, ts)

main()