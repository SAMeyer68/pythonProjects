
import os.path, time
import datetime

dirToCheck = 'c:/Users/Steven/Desktop/PythonDrills/drill1text'

for  file in os.listdir(dirToCheck):
    if file.endswith("txt"): 
        fileToCheck = os.path.join(dirToCheck,file)
        ts = os.path.getmtime(fileToCheck) 
        readable = time.ctime(ts)
       
        print (readable)
