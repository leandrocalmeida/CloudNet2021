#Start clientVlc
nohup vagrant ssh clientVlc -c 'export DISPLAY=:1 && /vagrant/host-setup/clientVlc/client.sh' > /dev/null &

#Start loadGens
#nohup vagrant ssh loadGen1 -c 'export DISPLAY=:1 && /vagrant/code/loadGen/loadGen1/mix_periodic_dash1.sh' > /dev/null &
nohup vagrant ssh loadGen2 -c 'export DISPLAY=:1 && /vagrant/code/loadGen/loadGen2/mix_periodic_dash2.sh' > /dev/null &
#nohup vagrant ssh loadGen3 -c 'export DISPLAY=:1 && /vagrant/code/loadGen/loadGen3/mix_periodic_dash3.sh' > /dev/null &
nohup vagrant ssh loadGen4 -c 'export DISPLAY=:1 && /vagrant/code/loadGen/loadGen2/mix_periodic_dash2.sh' > /dev/null &
