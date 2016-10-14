#!/usr/bin/env python

## 
## http://quotes.natune.net/quoteservice/rss2/zitat-des-tages.xml
##

import urllib3
import xml.etree.ElementTree as ET
import sys

def onlinezitat():
    http = urllib3.PoolManager()
    r = http.request('GET', 'http://quotes.natune.net/quoteservice/rss2/zitat-des-tages.xml')
    ### status 200 is OK
    #print ("%s" % r.status)
    if(r.status != 200):
        print("[!!] Webseite kann nicht aufgerufen werden: %s" % r.status)
        sys.exit(0)

    ### output in utf8
    #print ("%s" % r.data.decode('utf-8'))
    urltext = r.data.decode('utf-8')
    
    root =  ET.fromstring(urltext)
    root.findall('.')
    for xline in root.findall('./channel/item'):
        zitat = xline.find('description').text
        author = xline.find('author').text
        print ('\x1b[4;33;40m[*] Online Zitat des Tages:\x1b[0m\n\n\x1b[4;34;40m"%s"\x1b[0m \n\t\t\t\t -- %s' % (zitat, author))

def main():
    onlinezitat()
    

if __name__ == "__main__":
    main()
