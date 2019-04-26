

from tkinter import *
from tkinter import filedialog
import tkinter as tk
import sqlite3
import shutil
import os
import datetime
import drillPy_gui
import drillPy_main

#Window Functions

def center_window(self, w, h):
    screen_width = self.master.winfo_screenwidth()
    screen_height = self.master.winfo_screenheight()
    x = int((screen_width/2) - (w/2))
    y = int((screen_height/2) - (h/2))
    centerGeo = self.master.geometry('{}x{}+{}+{}'.format(w, h, x, y))
    return centerGeo

def ask_quit(self):
    if messagebox.askokcancel("Exit program", "Okay to exit application?"):
        self.master.destroy()
        os._exit(0)

#Database Functions

def create_db(self):
    conn = sqlite3.connect('db_files.db')
    with conn:
        cur = conn.cursor()
        cur.execute("CREATE TABLE IF NOT EXISTS tbl_files( \
            ID INTEGER PRIMARY KEY AUTOINCREMENT, \
            col_fname VARCHAR(255), \
            col_mdate TEXT \
            );")
        conn.commit()
    conn.close()


def count_records(cur):
    count = ""
    cur.execute("""SELECT COUNT(*) FROM tbl_files""")
    count = cur.fetchone()[0]
    return cur,count    

#Source Button Function
#select folder

def onBrowse1(self):
    dir1 = filedialog.askdirectory(initialdir=os.getcwd())
    if len(dir1) > 0:
        source = self.txt_source.insert(0,dir1)

#Destination Button Function


def onBrowse2(self):
    dir2 = filedialog.askdirectory(initialdir=os.getcwd())
    if len(dir2) > 0:
        destination = self.txt_destination.insert(0,dir2)

#Move Files Button Functions
# Search directory for .txt files 

def onMove(self):
    var_source = self.txt_source.get()
    var_destination = self.txt_destination.get()
    if (len(var_source) > 0) and (len(var_destination) > 0):
        for filename in os.listdir(var_source):
            if filename.endswith(".txt"):
                shutil.move(os.path.join(var_source,filename),var_destination)
    else:
        messagebox.showerror("Directory missing", "Please select a Source or Destination directory.")
    addFile(self)

# Clears text boxes

def onClear(self):
    self.txt_source.delete(0,END)
    self.txt_destination.delete(0,END)

# Adding time stamp, print and put into db
def addFile(self):
    var_destination = self.txt_destination.get()
    modTime = datetime.datetime.fromtimestamp(os.path.getmtime(var_destination))
    files = os.listdir(var_destination)
    conn = sqlite3.connect('db_files.db')

    with conn:
        cursor = conn.cursor()
        for i in files:
            cursor.execute("""INSERT INTO tbl_files (col_fname,col_mdate) VALUES (?,?)""",(i,modTime))
            print("File name: {}".format(i))
            print("Modification date: {}".format(modTime))
            onClear(self)
    conn.commit()
    conn.close()

if __name__ == "__main__":
    pass

