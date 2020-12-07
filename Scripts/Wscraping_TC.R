library(xml2)  #Para leer html.
library(rvest)
library(RSelenium)  #Pra trabajar con páginas dinámicas
library(wdman)    #Navegador fantasma, permite usar rsDriver
library(robotstxt)
library(tidyverse)

#num=c(1:15)
num=1
UrlMadre<-paste0("http://181.177.234.7/buscarRes/public/resolucionjur?filtro=A&search=Inconstitucional%2C+Ejecutivo&demandante=&demandado=&numexpediente=&anoingreso=&idtipoproceso=0&anopublica=&pg=",num)
html<-read_html(UrlMadre)

# paths_allowed(paths = c(UrlMadre)) # TRUE
# options(encoding = "utf-8")
# server<-phantomjs(port=5015L) 

pag_text<-html%>%
  html_nodes(xpath='//*[@class="date"]')%>% 
  html_text()
pag_text
