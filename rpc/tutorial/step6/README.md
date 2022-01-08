# Example RPC application on 2 CentOS 7.7 nodes

```sh
------------------------------------------------|----------------------------------------------
    192.168.0.117                               |   192.168.0.131 (firewalld is ON)
------------------------------------------------|----------------------------------------------
                                                |
                                                | ./add_server
                                                |
rpcinfo -p 192.168.0.131                        | sudo systemctl status firewalld or 
rpcinfo: cannot contact portmapper:             | 
    RPC: Remote system error - No route to host | sudo firewall-cmd --state
                                                | sudo firewall-cmd --permanent --add-service=rpc-bind
                                                | sudo firewall-cmd --reload
                                                | sudo firewall-cmd --list-all
rpcinfo -p 192.168.0.131
   program vers proto   port  service
    100000    4   tcp    111  portmapper
    100000    3   tcp    111  portmapper
    100000    2   tcp    111  portmapper
    100000    4   udp    111  portmapper
    100000    3   udp    111  portmapper
    100000    2   udp    111  portmapper
 591728913    1   udp  36049                    | Note: 591728913 = 0x23451111 
 591728913    1   tcp  50044                    |       #define ADD_PROG 0x23451111 from add.x
                                                |
                                                | sudo firewall-cmd --permanent --add-port=36049/udp
                                                | sudo firewall-cmd --permanent --add-port=50044/tcp
                                                | sudo firewall-cmd --reload
                                                |
                                                | sudo firewall-cmd --list-all
./add_client 192.168.0.131 1 2
3
```

## Changes needed on remote node which has firewall active

```sh
sudo firewall-cmd --permanent --add-service=rpc-bind

# Open the ports for RPC ADD_PROG  0x23451111 = 591728913
sudo firewall-cmd --permanent --add-port=36049/udp
sudo firewall-cmd --permanent --add-port=50044/tcp
sudo firewall-cmd --reload
```
