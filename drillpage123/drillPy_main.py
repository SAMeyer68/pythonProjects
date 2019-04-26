

from tkinter import messagebox
from tkinter import filedialog
from tkinter import *
import tkinter as tk
import sqlite3
import os
import datetime
import drillPy_gui
import drillPy_functions


class ParentWindow(Frame):

    def __init__ (self, master, *args, **kwargs):
        Frame.__init__ (self, master, *args, **kwargs)

        #  Window configuration
        self.master = master
        self.master.resizable(width=False,height=False)
        self.master.geometry("{}x{}".format(850,250))
        drillPy_functions.center_window(self,850,250)
        self.master.title("Move Text Files")
        self.master.config(bg="#9cccd6")

        # Delete Window 
        self.master.protocol("WM_DELETE_WINDOW", lambda: drillPy_functions.ask_quit(self))
        arg = self.master

        # GUI Widgets
        drillPy_gui.load_gui(self)

if __name__ == "__main__":
    root = Tk()
    App = ParentWindow(root) 
    root.mainloop()
