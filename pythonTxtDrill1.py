
#import the library to work with sql

import sqlite3 

conn = sqlite3.connect('drill.db')


fileList = ('information.docx','Hello.txt','myImage.png', \

            'myMovie.mpg','World.txt','data.pdf','myPhoto.jpg')

txtList = []
       

with conn:
    cur = conn.cursor()
    cur.execute("CREATE TABLE IF NOT EXISTS tblFiles( \
    ID INTEGER PRIMARY KEY AUTOINCREMENT, \
    fileName TEXT)")
conn.close()

conn = sqlite3.connect('drill.db')

with conn:
    cur=conn.cursor()
    for item in fileList:
        itemExt = item.split('.')[1]
        if(itemExt=="txt"):
            cur.execute("INSERT INTO tblFiles(fileName) VALUES (?)", \
                        (item,))
            conn.commit()

conn.close()

conn = sqlite3.connect('drill.db')

with conn:
    cur=conn.cursor()
    cur.execute("SELECT * FROM tblFiles")
    varFiles = cur.fetchall()
    for item in varFiles:
        print(item)
