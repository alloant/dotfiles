#!/bin/python

from bs4 import BeautifulSoup
import json
import requests
import os
import datetime

def scrapUrl(url):
    page = requests.get(url)
    soup = BeautifulSoup(page.content, 'html.parser')

    try:
        td_vars = soup.find_all('td',class_ = 'td_var') 
        td_vals = soup.find_all('td',class_ = 'td_val') 
        
        cont = 0

        for i,tvr in enumerate(td_vars):
            if tvr.text == 'LATITUDE':
                lat = td_vals[i].text
                cont += 1
            if tvr.text == 'LONGITUDE':
                lon = td_vals[i].text
                cont += 1
        
        f = open("/home/antonio/.local/location","w")
        f.writelines([f"{float(lat)}",f"\n{float(lon)}"])
    
    except:
        td_vars = []
        td_vals = []
        lat = ''
        lon = ''
    
    

def main():
    url = "http://my-addr.com/geo"
    scrapUrl(url)


if __name__ == '__main__':
    main()


