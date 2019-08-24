# -*- coding: utf-8 -*-
"""
Created on Mon Oct 15 14:36:24 2018

@author: kabachok
"""
import pandas as pd

import mysql.connector
from mysql.connector import errorcode

try:
    conn=mysql.connector.connect(user='k1895908',password='H5gCl41N',host='mysql2.nms.kcl.ac.uk',database='k1895908_lab',port='33306')
    
    cursor=conn.cursor()
    cursor.execute("SELECT * FROM module")
    rows=cursor.fetchall()
    
    print("Total Row(s):",cursor.rowcount)
    for row in rows:
        print(row)
    
except mysql.connector.Error as e:
    print(e)
    
finally:
    cursor.close()
    conn.close()
    

# Q1 - List all students
student_list=[]   
try:
    conn=mysql.connector.connect(user='k1895908',password='H5gCl41N',host='mysql2.nms.kcl.ac.uk',database='k1895908_lab',port='33306')
    
    cursor=conn.cursor()
    cursor.execute("SELECT * FROM student")
    rows=cursor.fetchall()
    
    for row in rows:
        student_list.append(row)
    
except mysql.connector.Error as e:
    print(e)  
finally:
    cursor.close()
    conn.close()
    
print(pd.DataFrame(student_list).head())