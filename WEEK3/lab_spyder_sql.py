# -*- coding: utf-8 -*-
"""
Created on Mon Oct  8 14:12:12 2018

@author: kabachok
"""

import mysql.connector
from mysql.connector import errorcode

# Error Handling
conn_params = {
        "database":'k1895908_lab',
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
    

# Error Handling - 2
try:
    conn=mysql.connector.connect(**conn_params) 
except mysql.connector.Error as err:
    if err.errno==errorcode.ER_ACCESS_DENIED_ERROR:
        print("Wrong user name or password")
    elif err.errno==errorcode.ER_BAD_DB_ERROR:
        print("Database does not exist")
    else:
        print(err)
else:
    conn.close()




#Bring table from DATABASE
try:
    conn=mysql.connector.connect(user='k1895908',password='H5gCl41N',host='mysql2.nms.kcl.ac.uk',database='k1895908_lab',port='33306')
    
    cursor=conn.cursor()
    cursor.execute("SELECT * FROM limbs")
    rows=cursor.fetchall()
    
    print("Total Row(s):",cursor.rowcount)
    for row in rows:
        print(row)
    
except mysql.connector.Error as e:
    print(e)
    
finally:
    cursor.close()
    conn.close()
 
    
# fetchone()
conn=mysql.connector.connect(user='k1895908',password='H5gCl41N',host='mysql2.nms.kcl.ac.uk',database='k1895908_lab',port='33306')    
cursor = conn . cursor ()
cursor . execute (" SELECT thing , legs , arms FROM limbs " )
while True :
    row = cursor . fetchone ()
    if row is None :
        break
    print (" Thing : %s , legs : %s , arms : % s" % ( row [0] , row [1] , row [2]))
print (" Number of rows returned : %d" % cursor . rowcount )
cursor . close ()
conn.close()

# Cursor as iterator
conn=mysql.connector.connect(user='k1895908',password='H5gCl41N',host='mysql2.nms.kcl.ac.uk',database='k1895908_lab',port='33306')  

cursor = conn . cursor ()
cursor . execute (" SELECT thing , legs , arms FROM limbs " )
for ( thing , legs , arms ) in cursor :
    print (" Thing : %s , legs : %s , arms : % s" % ( thing , legs , arms ))
print (" Number of rows returned : %d" % cursor . rowcount )
cursor . close ()

# Fetchall()
cursor = conn . cursor ()
cursor . execute (" SELECT thing , legs , arms FROM limbs " )
rows = cursor . fetchall ()
for row in rows :
    print (" Thing : %s , legs : %s , arms : % s" % ( row [0] , row [1] , row [2]))
print (" Number of rows returned : %d" % cursor . rowcount )
cursor . close ()


#SPECIAL CHARACTERS
cursor = conn . cursor ()
cursor . execute (" SELECT thing , legs , arms FROM limbs WHERE arms = %s" , [2])
for ( thing , legs , arms ) in cursor :
    print (" thing : %s , leg : %s , arms : %s " % ( thing , legs , arms ))
cursor . close ()


cursor = conn . cursor ()
cursor . execute (" SELECT thing , legs , arms FROM limbs WHERE arms = %s AND legs = %s", [2,1])
for ( thing , legs , arms ) in cursor :
    print (" thing : %s , leg : %s , arms : %s " % ( thing , legs , arms ))
cursor . close ()


cursor = conn . cursor ()
cursor . execute (" SELECT thing , legs , arms FROM limbs WHERE thing='human'")
for ( thing , legs , arms ) in cursor :
    print (" thing : %s , leg : %s , arms : %s " % ( thing , legs , arms ))
cursor . close ()


#IDENTIFY NULL VALUES
cursor = conn . cursor ()
cursor . execute (" SELECT thing , arms , legs FROM limbs " )
for row in cursor :
    row = list ( row ) # convert nonmutable tuple to mutable list
    for i , value in enumerate ( row ):
        if value is None : # is the column value NULL ?
            row [i] = " NULL "
    print (" Thing : %s , arms : %s , legs : % s" % ( row [0] , row [1] , row [2]))
cursor . close ()

conn.close()


    
    