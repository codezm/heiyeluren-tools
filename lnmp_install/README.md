lnmp install
=============


������: 2012/3/4 v0.0.3<br />
���ص�ַ: <a href="http://heiyeluren.googlecode.com/files/lnmp-install-0.0.3.tar.bz2">Download</a>


<b>��������</b>
  * LNMP�Զ���װShell�ű�
  * �ܹ��Զ�����Ҫ��Linuxϵͳ�� MySQL/PHP/Nginx/Memcached ����ȫ�����˹���Ԥ


<b>��Ҫ�ص�</b>
  * �ܹ��Զ�����������Ҫ��װ������Ϳ��ļ�
  * �����Զ�����Ҫ��װ��·���Ϳ�·��


<b>��װҪ��</b>
  * ������������������Ϊ��Ҫ������Ӧ��װ��
  * ��Ҫϵͳ֧��bash�� gcc/make �Ȼ������빤��
  * Ŀǰֻ��֧��root�˻����������װ
  * ȱʡ������ᰲװ�� /usr/local/
  * ��ʱֻ֧��Linuxϵͳ����һЩ������SELinux ��ϵͳ����Ҫ�ر� selinux ����������װ


<b>�������</b>

<pre>
==============================================
 LNMP Soft Install Shell Script  Help Usage
==============================================
Option              Help
----------------------------------------------
help            - Print Help
dl              - Download LNMP soft
mysql           - Install MySQL Server
rm_mysql        - Remove MySQL Server
php             - Install PHP & PHP-FPM
php_ext         - Remove PHP Extensions
rm_php          - Remove PHP All File
nginx           - Install Nginx
rm_nginx        - Remove Nginx
memcached       - Install Memcached
rm_memcached    - Remove Memcached
all             - Install all server
rm_all          - Remove all server

===============================================
Usage Example: 

lnmp_install.sh dl
lnmp_install.sh all
lnmp_install.sh mysql
lnmp_install.sh php
lnmp_install.sh php_ext
lnmp_install.sh nginx   
===============================================

</pre>

