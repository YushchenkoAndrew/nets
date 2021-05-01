# Simple Local Network with Docker

### Create subnet in Docker

```
docker network create --subnet=172.16.100.0/24 --gateway=172.16.100.1 -d bridge subnet
docker network create --subnet=172.16.25.0/24 --gateway=172.16.25.1 -d bridge subnet2
docker network create --subnet=11.1.1.0/29 --gateway=11.1.1.1 -d bridge hidenet
```

### Start DNS Server

```
$ docker run -d -t --cap-add NET_ADMIN --net=subnet ubuntu_dns
; Inside docker container start named service
$ service named start
```

### Start HTTP Server

```
$ docker run -d -t --cap-add NET_ADMIN --net=subnet --dns=172.16.100.2 ubuntu_http
; Inside docker container start nginx service
$ service nginx start
```

### Start FTP Server

```
$ docker run -d -t --cap-add NET_ADMIN --net=subnet --dns=172.16.100.2 ubuntu_ftp
; Inside docker container start vsftpd service
$ service vsftpd start
```

### Start ROUTE Server

```
$ docker run -d -t --cap-add NET_ADMIN --net=subnet --privileged ubuntu_route
$ docker run -d -t --cap-add NET_ADMIN --net=subnet2 --privileged ubuntu_route
$ docker ps
$ docker network connect hidenet <Container 1 ID>
$ docker network connect hidenet <Container 2 ID>

; Inside docker container start such services
$ service zebra start
$ service bgpd start
; For starting ospfd routing
$ service ospfd start
; For starting ripd routing
$ service ripd start

;; OSPF Configuration in Docker container 1 (subnet = 172.16.100.0/24)
$ vtysh
$ conf t
$ router ospf
$ network 11.1.1.0/29 area 0
$ network 172.16.100.0/24 area 0
$ end

;; OSPF Configuration in Docker container 2 (subnet = 172.16.25.0/24) is the same as in Docker container 1 but with different network
$ network 172.16.25.0/24 area 0

; Check the routing table (after configuring Docker container 2)
$ show ip ospf neighbor
$ show ip route
$ ping 172.16.25.2


;; RIP Configuration in Docker container 1 (subnet = 172.16.100.0/24)
$ vtysh
$ conf t
$ router rip
$ network 11.1.1.0/29
$ network 172.16.100.0/24
$ end

; Check the routing table (after configuring Docker container 2)
$ show ip route
$ ping 172.16.25.2


; In Docker container 1
$ iptables -t nat -A POSTROUTING -s 11.1.1.0/29 -j MASQUERADE
$ iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
```

### Building Containers

```
$ docker build -t ubuntu_dns ./DNS
$ docker build -t ubuntu_http ./HTTP
$ docker build -t ubuntu_ftp ./FTP
$ docker build -t ubuntu_route ./ROUTE
$ docker build -t ubuntu_net .
```
