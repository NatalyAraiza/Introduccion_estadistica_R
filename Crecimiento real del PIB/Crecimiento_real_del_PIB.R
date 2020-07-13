datos <- read.table("Crecimiento real del PIB.csv", sep =",", header=TRUE)
head(datos)#nombre de encabezados
names(datos) #nombres de columnas
str(datos)
dim(datos) #dimensiones
class(datos)
View(datos)
density(datos$Porcentaje)
########################################################
#Total de datos
n <- length(datos$Porcentaje)
#numero de clases
n_clases = sqrt(n)

#media, mediana, moda
media <- mean(datos$Porcentaje)
mediana = median(datos$Porcentaje)
moda = table(datos$Porcentaje)
media
mediana
moda

#Rango, varianza, desviacion estandar, coeficiente de variacion
Rango = max(datos$Porcentaje) - min(datos$Porcentaje)
Varianza = var(datos$Porcentaje)
Desviacion_estandar = sd(datos$Porcentaje)
Coeficiente_variacion = (Desviacion_estandar/media)*100
Rango
Varianza
Desviacion_estandar
Coeficiente_variacion

#Sesgo
library(e1071)  
sesgo <- skewness(datos$Porcentaje)
sesgo


#Regla Empirica
Desviacion_estandar = sd(datos$Porcentaje)
n <- length(datos$Porcentaje)
x1 <- media - Desviacion_estandar
x2 <- media + Desviacion_estandar
x3 <- media - (2*Desviacion_estandar)
x4 <- media + (2*Desviacion_estandar)
x5 <- media - (3*Desviacion_estandar)
x6 <- media + (3*Desviacion_estandar)
x1 ; x2 #68% de los datos
x3 ; x4 #95% de los datos
x5 ; x6 #99.97% de los datos
#-----------------------------Grafica---------------------------------------#
x <- datos$Porcentaje
ymax =max(dnorm(x, media, Desviacion_estandar))
max = max(datos$Porcentaje)
min = min(datos$Porcentaje)

regionx = seq(x1, x2, 0.01)
xP <- c(x1, regionx, x2)
yP <- c(0, dnorm(regionx, media, Desviacion_estandar), 0)

regiony = seq(x3, x4, 0.01)
aP <- c(x3, regiony, x4)
bP <- c(0, dnorm(regiony, media, Desviacion_estandar), 0)

regionz = seq(x5, x6, 0.01)
cP <- c(x5, regionz, x6)
dP <- c(0, dnorm(regionz, media, Desviacion_estandar), 0)

curve(dnorm(x, media, Desviacion_estandar), xlim = c(min, max), yaxs = "i", ylim=c(0, ymax), ylab = "f(x)",
      main="Regla Empirica")
polygon(cP, dP, col = "blue")
polygon(aP, bP, col = "violet")
polygon(xP, yP, col= "orange1")
################################################################################

#boxplot
density(datos$Porcentaje)
n;Rango
boxplot(datos$Porcentaje, main="Crecimiento real del PIB 1994-2019",
        ylab="Porcentaje del PIB")

#histograma con densidad
histograma = hist(datos$Porcentaje, col = "Blue", 
                  nclass = n_clases, labels = TRUE, main = "Crecimiento real del PIB 1994-2019",
                  ylab = "No. de densidad", xlab = "Porcentaje del PIB",
                  border = "black", freq = FALSE)
lines(density(datos$Porcentaje))

#histograma con poligono de frecuencias
histograma = hist(datos$Porcentaje, col = "Blue", 
                  nclass = n_clases, labels = TRUE, main = "Crecimiento real del PIB 1994-2019",
                  ylab = "No. de Frecuencia", xlab = "Porcentaje del PIB",
                  border = "black")
library(agricolae)
polygon.freq(histograma,col="red",frequency=1,lwd=2)

#Tabla de frecuencias
Intervalo_clases <- Rango/ n_clases
Frecuencia_absoluta <- table(datos$Porcentaje)
Valor_medio_clase <- histograma$counts

tablaf <- as.data.frame(table(Porcentaje = datos$Porcentaje))
transform(tablaf,
          FrecAc = cumsum(Freq),
          FrecRel_deClases = round(prop.table(Freq), 3),
          FreqRel_Ac = round(cumsum(prop.table(Freq)), 3))

#Distribucion normal
#?Cual es la probabilidad de que el el PIB crezca menos de 2%
#tomando en cuenta que la media es de 2.471983
#y la desviacion estandar de 3.308963
##################################
##################################
pnorm(2, mean = media, sd = Desviacion_estandar) #area de la curva antes del 2%
##################################
##################################
datos <- read.table("Crecimiento real del PIB.csv", sep =",", header=TRUE)
table(datos$Porcentaje)
x1=min(datos$Porcentaje)
x2=2
media = mean(datos$Porcentaje)
Desviacion_estandar = sd(datos$Porcentaje)
z1 = (x1-media)/Desviacion_estandar
z2 = (x2-media)/Desviacion_estandar
z1; z2
#tabla: 
#z2 = -0.1426379 = 0.4443
#[-inf, 0.4443]
#P(Z < 2)
0.4443*100
#la probabilidad de que el PIB crezca menos de 2%
#---------------Grafica----------------------------------------#
n <- length(datos$Porcentaje)
x <- datos$Porcentaje
ymax =max(dnorm(x, media, Desviacion_estandar))
max = max(datos$Porcentaje)
min = min(datos$Porcentaje)
regionx = seq(x1, x2, 0.01)
xP <- c(x1, regionx, x2)
yP <- c(0, dnorm(regionx, media, Desviacion_estandar), 0)
curve(dnorm(x, media, Desviacion_estandar), xlim = c(min, max), yaxs = "i", ylim=c(0, ymax), ylab = "f(x)",
      main="Distribucion normal")
polygon(xP, yP, col="orange1")
text(media, .1,"0.4432881")
#------------------------------------------------------------------------------------#

#Estimacion por intervalo de una media (muestras grandes, pescadito/2)
#En una muestra de 101 datos, el PIB crece en promedio 2.471983
#con una desviacion estandar de 3.308963
#construya un intervalo de confianza de 99% (2.575)
datos <- read.table("Crecimiento real del PIB.csv", sep =",", header=TRUE)
media = mean(datos$Porcentaje)
Desviacion_estandar = sd(datos$Porcentaje)
z = 2.575
P1 <- media - (z*(Desviacion_estandar / (sqrt(n))))
P2 <- media + (z*(Desviacion_estandar / (sqrt(n))))
P1; P2
#(1.624154 <= M <= 3.319813) con un 95% de certeza
#------------------Grafica----------------------------#
x <- datos$Porcentaje
x1 <- P1
x2 <- P2
n <- length(datos$Porcentaje)
ymax <- max(dnorm(x, media, Desviacion_estandar))
max <- max(datos$Porcentaje)
min <- min(datos$Porcentaje)
regionX <- seq(x1, x2, 0.01)
xP <- c(x1, regionX, x2)
yP <- c(0, dnorm(regionX, media, Desviacion_estandar),0)
curve(dnorm(x, media, Desviacion_estandar), xlim = c(min, max), yaxs = "i", ylim = c(0, ymax), ylab = "f(x)",
      main = "Distribucion normal")
polygon(xP, yP, col = "orange1")
text(media, .10, "(1.624154 <= M <= 3.319813) con un 95% de certeza")
#-----------------------------------------------------------#
