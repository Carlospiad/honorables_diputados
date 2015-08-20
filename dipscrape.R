library(XML)

asambleaUrl <- "http://www.asamblea.gob.pa/dip"
asambleaRaw <- htmlTreeParse(asambleaUrl,useInternalNode =T,encoding="utf8")

diputados_names <- xpathSApply(asambleaRaw, "//span[@class='dnombre']", xmlValue)
diputados_provincia <- xpathSApply(asambleaRaw, "//span[@class='dprov']", xmlValue)
dip_partido <- xpathSApply(asambleaRaw, "//span[@class='dpartido']", xmlValue)
dip_pic_url <- xpathSApply(asambleaRaw, "//span[@class='durl']", xmlValue)
dip_circuito <- xpathSApply(asambleaRaw, "//span[@class='dcircuito']", xmlValue)
dip_suplente <- xpathSApply(asambleaRaw, "//span[@class='dsuplente']", xmlValue)
dip_email <- xpathSApply(asambleaRaw, "//span[@class='dcorreo']", xmlValue)

dip_db <- data.frame(diputados_names,diputados_provincia,dip_partido,dip_circuito,dip_suplente,dip_email,dip_pic_url)

names(dip_db)<-c("Nombre","Provincia","Partido", "Circuito", "Suplente", "Email", "Url de imagen")
write.csv(dip_db, file = "MyData.csv")
