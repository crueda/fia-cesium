#!/usr/bin/env python
#-*- coding: UTF-8 -*-

# autor: Carlos Rueda
# fecha: 2013-04-03
# mail: carlos.rueda@deimos-space.com

import datetime
import time
import os
import sys
import csv

import httplib
import urllib
import urllib2
 

fichero_stadistics = sys.argv[1]
fichero_salida = sys.argv[2]

fichero = open(fichero_stadistics, 'rb')
fichero_salida = open(fichero_salida, 'w')
#fichero_salida2 = open('./salida2.txt', 'w')
time_relative = 0.0
for line in fichero:
    if line.find('TRAMA WMX YOK')>0 :
        index_separador = line.find(">")
        trama = line[index_separador+1:len(line)]

        indice_lat = trama.find("2013101")
        indice_lon = trama.find(",-")        
        lat = trama[indice_lat+7:indice_lon]
        lon = trama[indice_lon+1:indice_lon+10]

        fichero_salida.writelines( '%.2f,%s,%s,%s,\r\n' % (time_relative,lon,lat,'0.0'))
        #fichero_salida2.writelines( '%s,%s,0 ' % (lon,lat))
        time_relative += 10.0
       
fichero.close
fichero_salida.close
#fichero_salida2.close

