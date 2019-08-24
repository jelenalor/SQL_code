# -*- coding: utf-8 -*-
"""
Created on Sat Oct 13 22:30:14 2018

@author: kabachok
"""

import mysql.connector
from mysql.connector import errorcode

# Error Handling
conn_params = {
        "database":'k1895908_dbcw1',
        "host":'mysql2.nms.kcl.ac.uk',
        "user":'k1895908',
        "password": 'H5gCl41N',
        "port":'33306'        
}

try:
    conn=mysql.connector.connect(**conn_params)   
    print("Connected")
    
    
except mysql.connector.Error as e:
    print("Cannot connect to server")
    print("Error code: %s"% e.errno)
    print("Error message: %s" %e.msg)
    print("Error SQLSTATE: %s" %e.sqlstate)
    
    
    

    
import base64
import paramiko

client = paramiko.SSHClient()

client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
client.connect('bastion.nms.kcl.ac.uk', username='k1895908', password='Jel6033697')
print("Connected")

stdin, stdout, stderr = client.exec_command('ls -l')
for line in stdout:
    print('... ' + line.strip('\n'))


client.close()



from sshtunnel import SSHTunnelForwarder
import mysql.connector

with SSHTunnelForwarder(
         ("bastion.nms.kcl.ac.uk", 22),
         ssh_password="Jel6033697",
         ssh_username="k1895908",
         remote_bind_address=('mysql2.nms.kcl.ac.uk', 33306)) as server:

#    conn_params = {
#        "database":'k1895908_dbcw1',
#        "host":'mysql2.nms.kcl.ac.uk',
#        "user":'k1895908',
#        "password": 'H5gCl41N',
#        "port": server.local_bind_port        
#    }
    
    
    conn=mysql.connector.connect(user='k1895908',password='H5gCl41N',database='k1895908_lab',host='mysql2.nms.kcl.ac.uk',port=server.local_bind_port)   
    print("Connected")
    cursor = conn.cursor()
    cursor.execute (" SELECT thing , legs , arms FROM limbs " )
    while True :
        row = cursor.fetchone()
        if row is None :
            break
        print (" Thing : %s , legs : %s , arms : % s" % ( row [0] , row [1] , row [2]))
    print (" Number of rows returned : %d" % cursor . rowcount )
    
    cursor . close ()
    conn.close()
    
    
    
from sshtunnel import SSHTunnelForwarder

server = SSHTunnelForwarder(
    "bastion.nms.kcl.ac.uk",
    ssh_username="k1895908",
    ssh_password="Jel6033697",
    remote_bind_address=('mysql2.nms.kcl.ac.uk', 33306)
)

server.start()

print(server.local_bind_port)  # show assigned local port
# work with `SECRET SERVICE` through `server.local_bind_port`.

server.stop()
                
        
        
        
        
        
        
        
        