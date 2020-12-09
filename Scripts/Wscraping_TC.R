library(xml2)  #Para leer html.
library(rvest)
library(RSelenium)  #Pra trabajar con páginas dinámicas
library(wdman)    #Navegador fantasma, permite usar rsDriver
library(robotstxt)
library(tidyverse)


#CREAREMOS LA BASE DE DATOS DE LEYES INCONSTITUCIONALES
base_leyes<-data.frame("LEY DEMANDADA")
base_leyes

for (i in 1:15){
  UrlMadre<-paste0("http://181.177.234.7/buscarRes/public/resolucionjur?filtro=A&search=Inconstitucional%2C+Ley&demandante=&demandado=ley&numexpediente=&anoingreso=&idtipoproceso=0&anopublica=&pg=",i)
  html<-read_html(UrlMadre)
  pag_text<-html%>%
    html_nodes(xpath='//*[@class="date"]')%>% 
    html_text()
  pag_text
  for (i in 1:20) {
    if (i %% 2== 0){    #Condición par (demandado: Leyes)
      demandado<-pag_text[i]
      base_leyes[ nrow(base_leyes) + 1,] <- demandado     #appendeamos
      
    }}
    
}


  

# pag_text[2] 
# 
# 
# UrlMadre<-paste0("http://181.177.234.7/buscarRes/public/resolucionjur?filtro=A&search=Inconstitucional%2C+Ley&demandante=&demandado=ley&numexpediente=&anoingreso=&idtipoproceso=0&anopublica=&pg=1",num)
# html<-read_html(UrlMadre)
# 
# # paths_allowed(paths = c(UrlMadre)) # TRUE
# # options(encoding = "utf-8")
# # server<-phantomjs(port=5015L) 
# 
# pag_text<-html%>%
#   html_nodes(xpath='//*[@class="date"]')%>% 
#   html_text()
# pag_text
