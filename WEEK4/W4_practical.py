# -*- coding: utf-8 -*-
"""
Created on Mon Oct 15 14:36:24 2018

@author: kabachok
"""

try:
    conn=mysql.connector.connect(user='k1895908',password='H5gCl41N',host='mysql2.nms.kcl.ac.uk',database='k1895908_db4',port='33306')
    
#    cursor=conn.cursor()
#    cursor.execute("SELECT * FROM limbs")
#    rows=cursor.fetchall()
#    
#    print("Total Row(s):",cursor.rowcount)
#    for row in rows:
#        print(row)
    
except mysql.connector.Error as e:
    print(e)
    
finally:
    cursor.close()
    conn.close()