# Base image used.
FROM solita/centos-systemd 

# Updates Centos and installs a couple packages.
RUN yum -y update && yum -y install \    
	nano \   
	wget \   
	ethtool \   
	net-tools \   
	iptables      

# Installs Java8 JDK.
RUN cd ~
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.rpm"
RUN yum -y localinstall jdk-8u60-linux-x64.rpm

# Downloads elasticsearch 2.4.0 and Moloch 18.1.                     
RUN wget http://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/rpm/elasticsearch/2.4.0/elasticsearch-2.4.0.rpm \
	http://files.molo.ch/builds/centos-7/moloch-0.18.1-1.x86_64.rpm
RUN yum -y localinstall elasticsearch-2.4.0.rpm  \
	moloch-0.18.1-1.x86_64.rpm


