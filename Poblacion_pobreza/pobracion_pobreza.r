# -*- coding: utf-8 -*-
#"""Para este proyecto utilizamos los datos de la poblacion en situacion de pobreza para aplicarlos en todos los metodos vistos durante la clase de estadistica

getwd() 
#setwd("/home/user/Documents/etc") <--Agregar la direccion donde esta el archivo .csv
Datos <- read.table("Poblacion_pobreza.CSV", header = TRUE, sep = ",", nrows = 33)

#"""**Total de datos**"""

n <- length(Datos$X2010)
n

#"""**Determinar el numero de clases**"""

Numero_Clases <- sqrt(n)
Numero_Clases

#"""**Media, mediana, moda y maximo**"""

Media <- mean(Datos$X2010)
Mediana <- median(Datos$X2010)
Moda <- table(Datos$X2010)
max(Moda)
Media
Mediana
Moda

#"""**Rango, varianza, desviacion estandar, coeficiente de variacion**"""

Rango <- max(Datos$X2010) - min(Datos$X2010)
Varianza <- var(Datos$X2010)
Desviacion_Estandar <- sd(Datos$X2010)
Coeficiente_Variacion <- (Desviacion_Estandar/Media)*100
Rango
Varianza
Desviacion_Estandar
Coeficiente_Variacion

#"""**Regla empirica**"""

install.packages("e1071")
library(e1071) 
Sesgo <- skewness(Datos$X2010)
Sesgo

Regla_Empirica68.1 <- (Media+Desviacion_Estandar)
Regla_Empirica68.2 <- (Media-Desviacion_Estandar)
Regla_Empirica68.1
Regla_Empirica68.2
Regla_Empirica95.1 <- (Media+(2*Desviacion_Estandar))
Regla_Empirica95.2 <- (Media-(2*Desviacion_Estandar))
Regla_Empirica95.1
Regla_Empirica95.2

Regla_Empirica99.1 <- (Media+(3*Desviacion_Estandar))
Regla_Empirica99.2 <- (Media-(3*Desviacion_Estandar))
Regla_Empirica99.1
Regla_Empirica99.2

#"""**Grafica**"""

n <- length(Datos$X2010)
media <- mean(Datos$X2010)
table(Datos$X2010)
x1 <- (Media-Desviacion_Estandar)
x2 <- (Media+Desviacion_Estandar)
x3 <- (Media-(2*Desviacion_Estandar))
x4 <- (Media+(2*Desviacion_Estandar))
x5 <- (Media-(3*Desviacion_Estandar))
x6 <- (Media+(3*Desviacion_Estandar))
Desviacion_Estandar <- sd(Datos$X2010)
x <- Datos$X2010
ymax <- max(dnorm(x, media, Desviacion_Estandar))
max <- max(Datos$X2010)
min <- min(Datos$X2010)

regionX <- seq(x1, x2, 0.01)
xP <- c(x1, regionX, x2)
yP <- c(0, dnorm(regionX, media, Desviacion_Estandar),0)

regionY <- seq(x3, x4, 0.01)
aP <- c(x3, regionY, x4)
bP <- c(0, dnorm(regionY, media, Desviacion_Estandar),0)

regionZ <- seq(x5, x6, 0.01)
cP <- c(x5, regionZ, x6)
dP <- c(0, dnorm(regionZ, media, Desviacion_Estandar),0)

curve(dnorm(x, media, Desviacion_Estandar), xlim = c(min, max), yaxs = "i", ylim = c(0, ymax), ylab = "f(x)",
      main = "Distribucion normal")
polygon(cP, dP, col = "royalblue3")
polygon(aP, bP, col = "mediumpurple2")
polygon(xP, yP, col = "orchid3")
box()

#"""**Sesgo**"""

Sesgo <- skewness(Datos$X2010)
Sesgo

#"""**Histograma y Poligono de frecuencias**"""

histograma <- hist(Datos$X2010, col = "Gray", nclass = Numero_Clases, labels = TRUE,
                   main = "Porcentaje de poblaci?n en situaci?n de pobreza (2010)", ylab = "Frecuencia", xlab = "Poblacion en situacion de pobreza" )
histograma$counts
polygon.freq(histograma,col="red",frequency=1,lwd=2)

#"""**Histograma con densidad**"""

histograma <- hist(Datos$X2010,border = "black",freq = FALSE, col = "Gray", nclass = Numero_Clases, labels = TRUE,
                   main = "Porcentaje de poblaci?n en situaci?n de pobreza (2010)", ylab = "Frecuencia", xlab = "IPoblacion en situacion de pobreza" )
lines(density((Datos$X2010)))

#"""**Tabla de frecuencias**"""

Tabla_Frecuencias <- as.data.frame(table(Minutos =Datos$X2010))
transform(Tabla_Frecuencias,
          Frecuencia_Relativa_Clase = round(prop.table(Freq), 3),
          Frec_Relativa_Acumulada = round(cumsum(prop.table(Freq)), 3))

#"""**Intervalo de clases, frecuencia absoluta, valor medio de clase**"""

Intervalo_Clases <- Rango/Numero_Clases
Frecuencia_Absoluta <- table(Datos$X2010) 
Valor_Medio_De_Clase <- histograma$counts
Intervalo_Clases
Numero_Clases
Valor_Medio_De_Clase

#"""**Diagrama de caja**"""

density(Datos$X2010)
boxplot(Datos$X2010, ylab = "Poblacion en situacion de pobreza", main = "Diagrama de caja de tiempos de espera")

#"""**Relacion entre dos connjuntos de datos**

#**Diagrama de dispercion**

min(Datos$X2010)
max(Datos$X2010)
min(Datos$X2012)
max(Datos$X2012)
plot(Datos$X2010, Datos$X2012,
     main="Diagrama de Dispersi?n, Relacion 2010 y 2012",
     xlab = "2012",
     ylab = "2010",
     ylim = c(23.24679, 74.68734),
     xlim = c(21.01755, 78.4834),
     col = "magenta",
     pch = 4
)
abline(lm(Datos$X2010~Datos$X2012), col="Blue")

#"""**Modelo de regrecion y coeficientes del modelo**"""

modelo <- lm( Datos$X2010~Datos$X2012, data = Datos ) 
summary( modelo )

#"""**Probabilidad**"""

Probabilidad = table(Datos$X2010)/length(Datos$X2010)*100
Probabilidad