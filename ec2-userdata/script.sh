
#!/bin/bash
yum install httpd -y
service httpd start
chkconfig httpd on
mkdir /var/www/html
echo 'sankeerthi and keerthi and pavan' > /var/www/html/index.html
