#!/bin/python

from bs4 import BeautifulSoup
import json
import requests
import os
import datetime

icons = {
        "clear-day":"",
        "clear-night":"",
        "cloudy":"",
        "mostly-cloudy-day":"",
        "mostly-cloudy-night":"",
        "partly-cloudy-day":"",
        "partly-cloudy-night":"",
        "rain":""
        }

"""









"""

def scrapUrl(url):
    page = requests.get(url)
    soup = BeautifulSoup(page.content, 'html.parser')

    try:
        feels_like = soup.find_all('span',class_ = 'feels-like-text')[0].text 
        low = soup.find_all('span',class_ = 'low-temp-text')[0].text
        high = soup.find_all('span',class_ = 'high-temp-text')[0].text
        throughout = soup.find_all('span',class_ = 'currently__summary')[0].text.strip()

    except:
        feels_like = ""
        low = ""
        high = ""
        throughout = ""
    
    dt = soup.select('script')[2].text
    for line in dt.split("\n"):
        if line.strip()[:11] == 'currently =':
            current = json.loads(line.strip()[12:-1])
            break
    
    icon = icons[current['icon']]
    temp = int(float(current["temperature"]))

    tooltip_text = str.format(
        '{}\n{}\n{}\n{}',
        f'<span size="xx-large">{icon} {temp}˚</span>',
        f'Feels like {feels_like}',
        f'Low: {low}  High: {high}',
        f'{throughout}'
    )


    out_data = {
        'text': f'{icon} {temp}˚',
        'alt': current['summary'],
        'tooltip': tooltip_text,
        'class': ""
    }
    
    print(json.dumps(out_data))
    

def main():
    f = open("/home/antonio/.local/location","r")
    lines = f.readlines()
    lat = lines[0].strip()
    lon = lines[1].strip()
    url_mumbai = "https://darksky.net/forecast/18.9401,72.8347/ca24/en"
    url_delhi = "https://darksky.net/forecast/28.627,77.2154/ca24/en"
    url = f"https://darksky.net/forecast/{lat},{lon}/ca24/en"

    scrapUrl(url)


if __name__ == '__main__':
    main()


