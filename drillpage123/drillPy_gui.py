

from tkinter import *
import tkinter as tk
import drillPy_main
import drillPy_functions

def load_gui(self):

    #Labels
    self.lbl_source = tk.Label(self.master,text='Source Directory:',bg="#9cccd6")
    self.lbl_source.grid(row=1,column=0,padx=(57,0),pady=(65,20),sticky=N+W)
    self.lbl_destination = tk.Label(self.master,text='Destination Directory:',bg="#9cccd6")
    self.lbl_destination.grid(row=3,column=0,padx=(27,0),pady=(10,0),sticky=N+W)

    #Text boxes
    self.txt_source = tk.Entry(self.master,text='',width=60)
    self.txt_source.grid(row=1,column=1,columnspan=4,padx=(10,0),pady=(65,10),sticky='NSEW')
    self.txt_destination = tk.Entry(self.master,text='',width=60)
    self.txt_destination.grid(row=3,column=1,columnspan=4,padx=(10,0),pady=(5,5),sticky='NSEW')

    #Buttons

    self.btn_source = tk.Button(self.master,width=15,height=1,text='Browse...',command=lambda: drillPy_functions.onBrowse1(self))
    self.btn_source.grid(row=1,column=6,padx=(10,0),pady=(60,5),sticky=E)
    self.btn_destination = tk.Button(self.master,width=15,height=1,text='Browse...',command=lambda: drillPy_functions.onBrowse2(self))
    self.btn_destination.grid(row=3,column=6,padx=(10,0),pady=(5,5),sticky=E)
    self.btn_move = tk.Button(self.master,width=15,height=1,text='Move files',command=lambda: drillPy_functions.onMove(self))
    self.btn_move.grid(row=5,column=6,padx=(10,0),pady=(20,5),sticky=E)


    #Create db
    drillPy_functions.create_db(self)



if __name__ == "__main__":

    pass
