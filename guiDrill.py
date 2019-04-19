

import tkinter

from tkinter import *



class ParentWindow(Frame):

    def __init__(self,master):

        Frame.__init__(self,master)



        self.master = master

        self.master.resizable(width=False, height=False)

        self.master.geometry('{}x{}'.format(400,220))

        self.master.title('Check files')

        self.master.config(bg='lightgray')



        self.varBrowse1 = StringVar() 

        self.varBrowse2 = StringVar() 



        self.btnBrowse1 = Button(self.master,text='Browse...',width=12)

        self.btnBrowse1.grid(row=0,column=0, padx=(30,0),pady=(60,0))

        self.btnBrowse2 = Button(self.master,text='Browse...',width=12)

        self.btnBrowse2.grid(row=1,column=0,padx=(30,0),pady=(30,0))



        self.txtBrowse1 = Entry(self.master,text=self.varBrowse1, width=30)

        self.txtBrowse1.grid(row=0,column=1, columnspan=2, padx=(30,10),pady=(60,0))

        self.txtBrowse2 = Entry(self.master,text=self.varBrowse2, width=30)

        self.txtBrowse2.grid(row=1,column=1,columnspan=2, padx=(30,10),pady=(30,0))



        self.btnCheck = Button(self.master,text='Check for files...',command=self.Check,width=12)

        self.btnCheck.grid(row=2,column=0, padx=(30,0),pady=(30,0))

        self.btnClose = Button(self.master,text='Close Program ',command=self.Close)

        self.btnClose.grid(row=2,column=2, padx=(0,10),pady=(30,0),sticky=E)



    def Check(self):

        fn = self.varFname.get()

        ln = self.varLname.get()

        self.lblDisplay.config(text='Hello {} {}!'.format(fn,ln))



    def Close(self):

        self.master.destroy()





if __name__ =="__main__":

    root = Tk()

    App = ParentWindow(root)

    root.mainloop()
