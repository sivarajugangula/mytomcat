sudo apt update 
sudo apt install unzip -y
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.76/bin/apache-tomcat-9.0.76.tar.gz
sudo tar -xvzf apache-tomcat-9.0.76.tar.gz
sudo mv apache-tomcat-9.0.76 /opt/tomcat9/
sudo useradd -M -d /opt/tomcat9/ tomcat
sudo  chown -R tomcat.tomcat /opt/tomcat9/ 
sudo apt install default-jdk -y
sudo cd /opt/tomcat9/bin/./startup.sh
sudo sed -i '/<\/tomcat-users>/i \                                                     
<role rolename="manager-gui"/>\
<role rolename="admin-gui"/>\
<user username="manager" password="abcd1234" roles="manager-gui"/>\
<user username="admin" password="abcd1234" roles="admin-gui"/> /opt/tomcat9/conf/tomcat-users.xml
sudo sed -i '21,22 s/^/<!-- /; 21,22 s/$/ -->/' /opt/tomcat9/webapps/manager/META-INF//context.xml
sudo sed -i '21,22 s/^/<!-- /; 21,22 s/$/ -->/' /opt/tomcat9/webapps/host-manager/META-INF/context.xml
./opt/tomcat9/bin/catalina.sh
./opt/tomcat9/bin/shutdown.sh
./opt/tomcat9/bin/startup.sh
