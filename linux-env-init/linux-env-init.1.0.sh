

## ========================================= ##
# 
#  ��׼Linux������ʼ���ĵ��ű�
#
#  @author: heiyeluren
#  @site: https://gibhub.com/heiyeluren
#  @version: v1.0
#  @created: 2017/7/10
#  @lastmodify: 2017/10/16
# 
## ========================================= ##


#˵���ĵ���

# 1.  ���ֲ��Ǵ�Shell���ʵ��ĵ� + Shell�ķ�ʽ�����ֽ����ʺ��Լ���������΢��һ��
# 2.  Ϊ�˷��㣬��Ĭ��Ϊѡ�����CentOS���Linuxϵͳ���汾�� 7.x ����
# 3.  Ϊ�˰�ȫĬ�϶��������룬�ο����룺
#
# Ϊ�˱�֤ϵͳ��ȫ�������root���������㹻��׳����Сд��ĸ+����+�����ַ���Ϊ�˷���ǣ���������һЩ����������롣(����passwd root ���޸�)
# ����1��Flzc3000c1sy&l9t ������ֱ����ǧ��������������죬&����ͣ�
# ����2��Yhs8jCfcys / YhsbjCfcys ��Ұ���ղ������紵������
# ����3��C*dlxYrjn^ / Cai*dlxYourjn^ ���ɾն�������Ȼ����ɽ��*����գ�^����ɽ��
# ����4��Mhxzkyh ��÷�����Կຮ����ƴ����

# 4.  �����Ҫ����ȫ���������������ǰ����ĵ��ĵ�һ����ʼ�𲽲������������ܹ������Ƚ�����Ļ�����
# 5.  �����������޷����أ������ǰ汾���⣬���鵥��������΢�����е�����







##########################################
#
#    ��ʼ��Linux������
#
#    @version: v1.0.0
#
###########################################


#####################
#     ����Ӳ��
#####################

# ��ʽ�����̺ͽ��й���,����ԭʼ���̶�����������̹��ص� /home Ŀ¼�� # 

## ע��: ucloud �� aws���������·����ͬ,ע���޸� VDISK ���� ##

VDISK=/dev/vdb
QVDISK=${VDISK//\//\\/}
umount $VDISK
mkfs.ext4 $VDISK
mount $VDISK /home
sed -i "s/$QVDISK/#\/dev\/vdb/g" /etc/fstab
echo "$VDISK  /home ext4  defaults,noatime  0  0" >> /etc/fstab



# /home �����Ǻ��ĵĴ��밲װ����Ŀ¼�����ԣ�������Ҫ�Ѻ��Ĵ���̹��ڵ� /home Ŀ¼��
# ��������Ŀǰ�����Ĭ�Ϲ����ڣ�/data Ŀ¼���棬�������� /dev/xvdb1��������Ҫ��umount������ء�
# ȥ�����أ�umount /home/
# ���¹��أ�mount -t ext4 /dev/xvdb1 /home/
# ��Ҫ������Ч(reboot������Ȼ��Ч)����Ҫ�޸� /etc/fstab �ļ����޸ĺ�ֱ��rootȨ�� mount -a ��Ч����
# �ѣ�    /dev/xvdb1  /data ext4    defaults    0  0
# �޸�Ϊ��/dev/xvdb1  /home ext4    defaults    0  0
# ��ֱ�ӣ�echo "/dev/xvdb1  /home ext4    defaults    0  0" >> /etc/fstab

## ������/��Ѷ�Ƶȷ��������������ǣ�
# (1) ��������
# (2) �ڷ����������ʹ�� 
#     a)fdisk -l  #�鿴�¼������ (�������� xvdb����Ѷ����vdb)
#     b)������fdisk  /dev/vdb ��������ʾ���������롰n������p����1�������λس�����wq���������Ϳ�ʼ�ˣ��ܿ�ͻ���ɡ�
#     c)�鿴���������ʹ�á�fdisk -l��������Կ������µķ���/dev/vdb1�Ѿ���������ˡ���ע�⣺/dev/vdb1�����vdb���̵ķ���1����������/dev/vdb2��������/dev/vdb ������Ӳ�̣�
#     d)��ʽ�������� mkfs.ext4 /dev/vdb1�����Ҫ��ʽ���������̾��ǣ�mkfs.ext4 /dev/vdb�������Ҫ�����ļ���ʽ����ʹ��mkfs.ext3 ��.��
#     e)���ϼ��ط�����mount /dev/vdb  /home/ ����/dev/vdb����Ӳ�̹�����/homeĿ¼�£�Ҳ���Թ���һ��������mount /dev/vdb1 /home/work��
#     f)���ù��أ�
#     echo '/dev/vdb  /home ext4    defaults    0  0' >> /etc/fstab
#     cat /etc/fstab�������Ƿ�д���ˣ������ã�mount -a ȫ��ִ�� /etc/fstab �е����ã�����������Ч�����ơ�

## ucloud Ĭ�ϻ������غ�,��Ϊ���Ǳ�׼������Ҫ,������Ҫ ��
# unmount /data
# mount /dev/vdb /home

## aws ����Ҫ�Լ����и�ʽ���� mount ���̵� /home Ŀ¼



#####################
#  �޸�root����
#####################
#
# Ϊ�˱�֤ϵͳ��ȫ�������root���������㹻��׳����Сд��ĸ+����+�����ַ���Ϊ�˷���ǣ���������һЩ����������롣(����passwd root ���޸�)
# ����1��Flzc3000c1sy&l9t ������ֱ����ǧ��������������죬&����ͣ�
# ����2��Yhs8jCfcys / YhsbjCfcys ��Ұ���ղ������紵������
# ����3��C*dlxYrjn^ / Cai*dlxYourjn^ ���ɾն�������Ȼ����ɽ��*����գ�^����ɽ��

# passwd root 


#####################
#  �رն���ϵͳ����
#####################
for i in irqbalance.service acpid.service auditd.service kdump.service ntpd.service postfix.service ; do
    systemctl disable $i
done


#####################
#  LDAP�й�Ȩ���޸�
#####################



#####################
#  ntpʱ�������ͬ��
#####################

## ˵����һ�㰢����/��Ѷ�Ƶȶ������Լ���ntpʱ����������������,��Ҫ��Լ���ntp������
##
# ntpʱ��������б�asia.pool.ntp.org / cn.pool.ntp.org / cn.ntp.org.cn ���Ƽ� ntp.org �����Ŀ���Щ

# ���뵽crontab��
# sudo crontab -e
#
# �����������ݣ�(ÿ��15���Ӵ�ntp������ͬ��һ��ʱ��)
# */15 * * * * /usr/sbin/ntpdate asia.pool.ntp.org >> /var/log/ntpdate.log
#



#####################
#  �޸�ssh��½��ʽ
#####################
#
# ˵��: �޸ĳ�Ϊ������Կ��ʽ��¼,�ر��û������½
#

# Ĭ�������Ϻܶ�ڿͺ�ScriptKids��û�¾�ɨ���������������ֿ�����22�˿ڵĻ����ȥ���֣�Ϊ�˰�ȫ�������һ�²���ʡһ��ԭ���޸�ssh�ķ���˿�
#
# �޸�ssh/sshd�˿�Ϊ 8822�����������޸�
# SPORT=9922
# sudo sed -i 's/^[ ]*Port/#    Port/' /etc/ssh/ssh_config
#sudo sed -i 's/^Port/#Port/'         /etc/ssh/sshd_config
#sudo echo "    Port $SPORT"       >> /etc/ssh/ssh_config
#sudo echo "Port $SPORT"           >> /etc/ssh/sshd_config
#unset SPORT

# ����������Ч���ǵ����µ�½��ʱ����Ҫ�޸�ssh�˿ڣ�
#service sshd restart
#/bin/systemctl restart  sshd.service


#####################
#  ����hostname
#####################

## Ϊ�˷�����ʾ�����������޸�hostname����ʾ��Ϣ�������ն�������ʾ����
# hostname �洢�� /etc/hostnmae �ļ��ֱ���޸���������Ч��

## �������� ##
# ����˵��: ҵ��ģ��-������;-�����������к�.��������.�����Ʒ����̻�����������������.ҵ������������
#
# ʾ������:

# php-web00.bj.aliyun    #php��ҳ00.��������.������
# go-app01.bj.yizhuan    #goӦ��01.��������.��ׯ����
# db-mysql02.tj.qcloud   #���ݿ�mysql.������.������
# 

HNAME="linux-new-env00.bj"    #�����Ŀ�ʶ������
LIP="10.9.149.238"     #������IP(һ���ǰ�eth0������IP��ַ)

echo $HNAME > /etc/hostname
sed -i 's/HOSTNAME/#HOSTNAME/g ' /etc/sysconfig/network
echo "HOSTNAME=$HNAME" >> /etc/sysconfig/network
echo "$LIP $HNAME" >> /etc/hosts



#####################
#  ����yumԴ
#####################

## ����Լ�������yumԴ,��Ҫ�� /etc/yum.repos.d/ ��������޸ĳ��Լ���,��������ٵİ�װ�� #





##########################################
#
#    ������Linux���������ýű�
# 
#   @version: v1.0.0
#
#   @desc: ִ����ɺ���Ҫ����������
#
###########################################


#####################
#     ��ʱ��Ч
#####################

## ����
sudo sysctl -w "net.core.somaxconn=2048"
sudo sysctl -w "net.core.rmem_default=262144"
sudo sysctl -w "net.core.wmem_default=262144"
sudo sysctl -w "net.core.rmem_max=16777216"
sudo sysctl -w "net.core.wmem_max=16777216"
sudo sysctl -w "net.core.netdev_max_backlog=20000"
sudo sysctl -w "net.ipv4.tcp_rmem=4096 4096 16777216"
sudo sysctl -w "net.ipv4.tcp_wmem=4096 4096 16777216"
sudo sysctl -w "net.ipv4.tcp_mem=786432 2097152 3145728"
sudo sysctl -w "net.ipv4.tcp_max_syn_backlog=16384"
sudo sysctl -w "net.ipv4.tcp_fin_timeout=30"
sudo sysctl -w "net.ipv4.tcp_keepalive_time=300"
sudo sysctl -w "net.ipv4.tcp_max_tw_buckets=5000"
sudo sysctl -w "net.ipv4.tcp_tw_reuse=1"
sudo sysctl -w "net.ipv4.tcp_tw_recycle=0"
sudo sysctl -w "net.ipv4.tcp_syncookies=1"
sudo sysctl -w "net.ipv4.tcp_max_orphans=131072"
sudo sysctl -w "net.ipv4.ip_local_port_range=1024 65535"


## �ļ�������
sudo sysctl -w "fs.nr_open=5000000"
sudo sysctl -w "fs.file-max=2000000"
sudo sysctl -w "fs.inotify.max_user_watches=16384"

## ����
sudo sysctl -w "vm.max_map_count=655360"


#####################
#     ������Ч
#####################

## ����
sudo echo "net.core.somaxconn=2048"                 >> /etc/sysctl.conf
sudo echo "net.core.rmem_default=262144"            >> /etc/sysctl.conf
sudo echo "net.core.wmem_default=262144"            >> /etc/sysctl.conf
sudo echo "net.core.rmem_max=16777216"              >> /etc/sysctl.conf
sudo echo "net.core.wmem_max=16777216"              >> /etc/sysctl.conf
sudo echo "net.core.netdev_max_backlog=20000"       >> /etc/sysctl.conf
sudo echo "net.ipv4.tcp_rmem=4096 4096 16777216"    >> /etc/sysctl.conf
sudo echo "net.ipv4.tcp_wmem=4096 4096 16777216"    >> /etc/sysctl.conf
sudo echo "net.ipv4.tcp_mem=786432 2097152 3145728" >> /etc/sysctl.conf
sudo echo "net.ipv4.tcp_max_syn_backlog=16384"      >> /etc/sysctl.conf
sudo echo "net.ipv4.tcp_fin_timeout=30"             >> /etc/sysctl.conf
sudo echo "net.ipv4.tcp_keepalive_time=300"         >> /etc/sysctl.conf
sudo echo "net.ipv4.tcp_max_tw_buckets=5000"        >> /etc/sysctl.conf
sudo echo "net.ipv4.tcp_tw_reuse=1"                 >> /etc/sysctl.conf
sudo echo "net.ipv4.tcp_tw_recycle=0"               >> /etc/sysctl.conf
sudo echo "net.ipv4.tcp_syncookies=1"               >> /etc/sysctl.conf
sudo echo "net.ipv4.tcp_max_orphans=131072"         >> /etc/sysctl.conf
sudo echo "net.ipv4.ip_local_port_range=1024 65535" >> /etc/sysctl.conf


## �ļ�������
sudo echo "fs.nr_open=5000000"                      >> /etc/sysctl.conf
sudo echo "fs.file-max=2000000"                     >> /etc/sysctl.conf
sudo echo "fs.inotify.max_user_watches=16384"       >> /etc/sysctl.conf

## ����
sudo echo "vm.max_map_count=655360"                 >> /etc/sysctl.conf

## ��Ч
sudo sysctl -p


#####################
#     �޸�Ӳ����
#####################

## �޸�limits.conf����������������Ч����

cd /etc/security/limits.d && for file in  `ls`; do mv $file $file.bak; done

sudo sed -i 's/^@users/#@users/'              /etc/security/limits.conf
sudo sed -i 's/^@root/#@root/'                /etc/security/limits.conf
sudo sed -i 's/^\*/#\*/'                      /etc/security/limits.conf
sudo sed -i 's/^root/#root/'                  /etc/security/limits.conf

sudo echo "@users soft  nofile  2000001"   >> /etc/security/limits.conf
sudo echo "@users hard  nofile  2000001"   >> /etc/security/limits.conf
sudo echo "@root  soft  nofile  2000002"   >> /etc/security/limits.conf
sudo echo "@root  hard  nofile  2000002"   >> /etc/security/limits.conf
sudo echo "*      soft  nofile  2000003"   >> /etc/security/limits.conf
sudo echo "*      hard  nofile  2000003"   >> /etc/security/limits.conf
sudo echo " "                              >> /etc/security/limits.conf

sudo echo "*      soft  nproc   10240"     >> /etc/security/limits.conf
sudo echo "root   soft  nproc   unlimited" >> /etc/security/limits.conf
sudo echo " "                              >> /etc/security/limits.conf

sudo echo "*      soft  core    unlimited" >> /etc/security/limits.conf
sudo echo "*      hard  core    unlimited" >> /etc/security/limits.conf


## ����½session�����ļ���������
## ����ȫ��ÿ���û���½�������(100w)����Ҫ����ִ��ulimit�޸�
# sed -i 's/^ulimit/#ulimit/'     /etc/bashrc
# echo "ulimit -n 1000001"     >> /etc/bashrc
# echo "ulimit -u 10240"       >> /etc/bashrc
# echo "ulimit -c unlimited"   >> /etc/bashrc

sudo sed -i 's/^ulimit/#ulimit/'     /etc/profile
sudo echo "ulimit -n 1000001"     >> /etc/profile
sudo echo "ulimit -u 10240"       >> /etc/profile
sudo echo "ulimit -c unlimited"   >> /etc/profile







##########################################
#
#    ��װLinux���������������
# 
#   @author: heiyeluren
#   @created: 2017/3/21
#   @lasttime: 2017/3/21
#   @version: v1.0.3
#
#   @desc: ִ����ɺ󣬽�������������
#
###########################################

# 1. ��װ������ϵͳ֧�ֿ�Ͱ�ȫ����

if [ $USER != "root" ]; then  su root; fi

# ϵͳ��ȫ����
sudo yum -y install yum-security
sudo yum -y --security check-update
sudo yum -y update --security

## ��װ��������Ͱ����� (���밲װ) ##
sudo yum -y install epel-release
sudo yum -y update

sudo yum -y install gcc gcc-c++ gdb make cmake automake autoconf nasm libtool imake binutils flex bison telnet wget curl libcurl libcurl-devel zip unzip gzip unzip bzip2 screen iftop iotop sysbench nload iperf iptraf mpfr tcpdump dstat mtr iptraf* strace sysstat htop gmp bzip2-devel gmp-devel glibc libgomp libmudflap ncurses ncurses-libs ncurses-devel boost boost-devel libgsasl libgsasl-devel cyrus-sasl* jemalloc jemalloc-devel gperf gperftools-libs gperftools-devel systemtap-sdt-devel openssl openssl-devel pcre-devel libevent libevent-devel libev libev-devel libuv libuv-devel libuv-static libgcrypt libgcrypt-devel libpng libpng-devel libjpeg-turbo libjpeg-turbo-devel openjpeg openjpeg-devel openjpeg-libs giflib giflib-devel giflib-utils gd gd-devel ImageMagick ImageMagick-devel ImageMagick-c++ ImageMagick-c++-devel GraphicsMagick GraphicsMagick-devel GraphicsMagick-c++ GraphicsMagick-c++-devel gettext gettext-devel freetype freetype-devel libtiff libtiff-devel libwebp libwebp-devel libwebp-tools libxml2 libxml2-devel libxslt libxslt-devel libuuid libmemcached libmemcached-devel libuuid-devel expat expat-devel  expat-static boost boost-devel leveldb-devel leveldb gdbm-devel gdbm sqlite-devel sqlite sqlite2 sqlite2-devel postgresql-devel postgresql-libs GeoIP-update GeoIP GeoIP-devel GeoIP-data snappy snappy-devel csnappy csnappy-devel librabbitmq librabbitmq-tools librabbitmq-devel libffi libffi-devel lz4 lz4-devel lz4-static lzo lzo-devel lzma-sdk457 lzma-sdk457-devel zstd libzstd libzstd-devel zlib-devel zlib-static libzip libzip-devel lrzip lrzip-libs lrzip-static p7zip xz xz-devel xz-compat-libs python python-pip python-devel perl perl-devel vim git subversion subversion-devel libdb libdb-cxx libdb-devel libdb-cxx-devel libdb4 libdb4-cxx libdb4-devel libdb4-cxx-devel libtool-ltdl libtool-ltdl-devel ntpdate psmisc lrzsz lsof bind-util* doxygen supervisor libnghttp2 libnghttp2-devel nghttp2 hiredis-devel hiredis mariadb* libsodium libsodium-devel nacl nacl-devel  nacl-static libunwind libunwind-devel tree java-1.8.0-openjdk java-1.8.0-openjdk-devel java-1.8.0-openjdk-headless java-1.8.0-openjdk-accessibility  java-1.8.0-openjdk-demo ruby ruby-devel ruby-libs zbar zbar-devel protobuf protobuf-static protobuf-devel glog glog-devel  axel  graphviz graphviz-devel graphviz-gd


## ��װ fastdfs ������ ##
## # ע��:������Ϊ����ṹ����ԭ�򣬱�����ã�����˻���װ�������ر��עһ�� ##
cd /tmp && if [ ! -f fastdfs-5.08.zip ]; then  wget https://github.com/happyfish100/fastdfs/archive/V5.08.zip && mv V5.08.zip fastdfs-5.08.zip; fi
cd /tmp && if [ ! -f libfastcommon-1.0.35.zip ]; then wget https://github.com/happyfish100/libfastcommon/archive/V1.0.35.zip && mv V1.0.35.zip libfastcommon-1.0.35.zip; fi
cd /tmp && unzip -o libfastcommon-1.0.35.zip && cd libfastcommon-1.0.35
sudo ./make.sh && sudo ./make.sh install
cd .. && rm -rf libfastcommon-1.0.35
cd /tmp && unzip -o fastdfs-5.08.zip && cd fastdfs-5.08
sudo ./make.sh && sudo ./make.sh install
cd .. && rm -rf fastdfs-5.08




## ��װ�������л�����ر������Ժ͹��ߣ���ѡ���Ƽ���װ�� ##
# sudo yum -y install golang  golang-docs nodejs luajit luajit-devel lua-static;

## ���MySQL/Mongo/Redis/PostgreSQL�������԰�װ��ع���(��ѡ,�Ƽ���װ) ##
# sudo yum -y install mytop innotop percona-xtrabackup* holland-xtrabackup sysbench mariadb* redis mongodb mongodb-mms-backup-agent mongodb-mms-monitoring-agent mongodb-server mongodb-test postgresql postgresql-devel postgresql-pgpool* postgresql-server postgresql-test postgresql-upgrade
# sudo yum -y install perl perl-devel perl-DBI perl-DBD-MySQL perl-Time-HiRes perl-IO-Socket-SSL perl-TermReadKey perl-Digest-MD5 perl-Digest-Perl-MD5 perl-Digest-MD5-File python-redis perl-Redis python-pymongo postgresql-pl*
# cd /tmp
# if [ ! -f percona-toolkit-3.0.3-1.el7.x86_64.rpm ]; then wget https://www.percona.com/downloads/percona-toolkit/3.0.3/binary/redhat/7/x86_64/percona-toolkit-3.0.3-1.el7.x86_64.rpm; fi 
# if [ ! -f percona-toolkit-debuginfo-3.0.3-1.el7.x86_64.rpm ]; then wget https://www.percona.com/downloads/percona-toolkit/3.0.3/binary/redhat/7/x86_64/percona-toolkit-debuginfo-3.0.3-1.el7.x86_64.rpm; fi
# if [ ! -f percona-xtrabackup-24-2.4.8-1.el7.x86_64.rpm ]; then wget https://www.percona.com/downloads/XtraBackup/Percona-XtraBackup-2.4.8/binary/redhat/7/x86_64/percona-xtrabackup-24-2.4.8-1.el7.x86_64.rpm; fi
# if [ ! -f percona-xtrabackup-24-debuginfo-2.4.8-1.el7.x86_64.rpm ]; then wget https://www.percona.com/downloads/XtraBackup/Percona-XtraBackup-2.4.8/binary/redhat/7/x86_64/percona-xtrabackup-24-debuginfo-2.4.8-1.el7.x86_64.rpm; fi
# if [ ! -f percona-xtrabackup-test-24-2.4.8-1.el7.x86_64.rpm ]; then wget https://www.percona.com/downloads/XtraBackup/Percona-XtraBackup-2.4.8/binary/redhat/7/x86_64/percona-xtrabackup-test-24-2.4.8-1.el7.x86_64.rpm; fi
# sudo rpm -Uvh --force --nodeps  percona-toolkit-3.0.3-1.el7.x86_64.rpm  percona-toolkit-debuginfo-3.0.3-1.el7.x86_64.rpm  percona-xtrabackup-24-2.4.8-1.el7.x86_64.rpm  percona-xtrabackup-24-debuginfo-2.4.8-1.el7.x86_64.rpm  percona-xtrabackup-test-24-2.4.8-1.el7.x86_64.rpm



## ���RHEL 7.x+ϵͳ�����������
if [ `uname -r | grep -i el7` == "" ]; then 
  ## ע�⣺�����CentOS/RHEL 7.0+ϵͳ�������Ҫ��װ���¼���������Ҫʹ������ָ�������ᱨ��Error: Protected multilib versions: xxxxx�� ##
  ## Ҳ����ִ�У�package-cleanup --cleandupes  �Ѿɰ汾��ж�غ���ִ�������yum ��װ���� ## 
  ## �� RHEL/CentOS 7.x+�汾�⼸������ᱨ��libstdc++/pcre/zlib/xz-libs  ##
  ## ��ذ���װָ�
  ## yum -y install libstdc++ pcre zlib xz-libs --setopt=protected_multilib=false
  ##
fi;



# 2. �����û���Ŀ¼ (�����ֿ����йܵ�LDAP,Ҳ����ֱ�Ӵ���)
if [ $USER != "root" ]; then  su root; fi
mkdir -pv /home/coresave

#�����˻�����Ŀ¼
groupadd  work -g 500 ; useradd work -u 500 -g 500 -d /home/work  # -p Flzc3000c1sy&l9t
groupadd  rd   -g 501 ; useradd rd   -u 501 -g 501 -d /home/rd  # -p YhsbjCfcys

mkdir -p /home/work/lib
mkdir -p /home/work/soft
mkdir -p /home/work/logs
mkdir -p /home/work/data
mkdir -p /home/work/opbin
mkdir -p /home/work/tmp
chmod 755 /home/work/  /home/rd /home/coresave
chown 500.500 /home/work -R


## ˵��:����Ŀ¼�����Լ������װ�����ٴ��� ##



##########################################
#
#    ������ά���߲���
#
##########################################


# ��ع���
# ��ά����
# ���߹���





##########################################
#
#   @desc: ִ����ɺ���Ҫ����������
#
##########################################

sudo reboot











