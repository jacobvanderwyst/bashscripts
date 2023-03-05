import os
import platform as plt
import random as rand
import pyautogui as pyag
from keyboard import press
import time

opsys=plt.system()
oprelease=plt.release()

try:
    pwfile=open("pwfile.txt",'w')
except FileNotFoundError:
    if opsys=="Linux" or opsys=="Ubuntu":
        os.system("touch pwfile.txt")
    else:
        os.system("fsutil file createnew pwfile.txt 0")
    try:
        pwfile=open("pwfile.txt",'w')
    except FileNotFoundError:
        print("file could not be found or created")
    except Exception as e:
        print(e)
except Exception as e:
    print(e)
def getLineNum(filename):
    fr=open(filename,"r")
    num=0
    while True:
        fr.readline()
        if fr.readline() =="":
            break
        num+=1
    return num
def getUser():
    i=0
    print("getting users...")
    try:
        userFile=open("user.txt",'r')
    except FileNotFoundError:
        print("file not found")
    except Exception as e:
        print(e)
    users=[]
    linum=getLineNum("user.txt")
    while i<linum:
        users.append(userFile.readline())
        print(f"found {users[i]}")  
        i+=1  
    userFile.close()
    return users
def randCharac():
    txt="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz012345!@#$%&()*+-./"
    charac=txt[rand.randint(0,len(txt))]
    return charac
def createPW(length, username):
    i=0
    password=""
    while i<length:
        character=randCharac()
        password=password+character
        i+=1
    pwfile.write(f"{username} {password}\n")
    print(f"{username} {password}")
    
    return password
def win():
    pwfile=open("pwfile.txt",'r')
    users=getUser()
    
    while users:
        passWD=createPW(12,users)
        os.system(f"net user {users} {passWD}")
        press("enter")
    pwfile.close()
def lin():
    pwfile=open("pwfile.txt",'r')
    users=getUser()
    
    while users:
        passWD=createPW(12,users)
        os.system(f"sudo passwd {users}")
        press("enter")
        print("10 seconds to enter sudo password")
        time.sleep(10)
        pyag.write(passWD)
        press("enter")
    pwfile.close()
def ubun():
    pwfile=open("pwfile.txt",'r')
    users=getUser()
    
    while users:
        passWD=createPW(12,users)
        os.system(f"sudo passwd {users}")
        press("enter")
        print("10 seconds to enter sudo password")
        time.sleep(10)
        pyag.write(passWD)
        press("enter")
    pwfile.close()

#DO
if opsys =="Linux":
    lin()
elif opsys=="Windows":
    win()
elif opsys=="Ubuntu":
    ubun()
