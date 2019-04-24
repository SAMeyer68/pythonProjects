from tkinter import *
from tkinter import filedialog
import tkinter as tk

def askDirectory():
    dirname = filedialog.askdirectory()
    if dirname:
        var.set(dirname)


def userInput(status, name):
    optionFrame = Frame(root)
    optionLabel = Label(optionFrame)

    text = status
    var = StringVar(root)
    var.set(text)
    selection = Entry(optionFrame, textvariable=var)
    selection.grid(row=0, column=2, padx=(20,20), pady=(30,30))
    optionFrame.grid(row=0, column=2, padx=(0,0), pady=(0,0))
    return selection, var

if __name__ == '__main__':

    
    root = Tk()
    # start here with browse box
    root.title("Find Files")
    btnBrowse = Button(root, text='Browse:', command=askDirectory, width=10)
    btnBrowse.grid(row=0, column=1, padx=(20,20), pady=(30,30))

    selection, var = userInput("", "Directory")

    root.mainloop()

