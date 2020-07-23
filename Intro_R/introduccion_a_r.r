# -*- coding: utf-8 -*-
##Indice#
'''
*   Comandos basicos en R
*   Comandos matemáticos basicos
*   Comandos estadisticos basicos
*   Importar archivos y graficar
'''
##*Comandos basicos en R#*

#Solicitar ayuda#
#

help()

##Ayuda en linea hiper texto##

help.start()

##Solicitar ayuda de una función especifica de R, en este caso distribución normal##

? rnorm

##Actualizar paquetes##

update.packages

##Instalar un paquete esfecifico (Ej. "qcc")##

install.packages("qcc")

##Cargar un paquete instalado#

#Nota: En R para utilizar ciertas funciones primero tenemos que instalar un paquete y despues cargarlo. Ambos pasos son necesarios.


library("qcc")

##Muestra el directorio de trabajo actual##

getwd()

##Cambiar directorio de trabajo#

#Al usar nuevamente getwd() vemos que se actualizó el directorio de trabajo


setwd("sample_data")

getwd()

##Crea una carpeta llamada pruebas en el caso de que no exista##

if ( !file.exists("pruebas") ) { dir.create("pruebas") }

##R cuenta con varios demos, con ellos podemos conocer algunas funciones de cierto paquetes para tener una idea general de lo que se puede hacer con ellos#


#Con este comando podemos ver la lista de los demos existentes#
#

demo()

##Para correr un demo en especial utilizamos el mismo comando pero le indicamos el nombre del demo que deseamos##

demo("plotmath")

## #Comandos matemáticos basicos#
----------------------------------

### #R como calculadora#

#Suma#
#

10+5

##Resta##

23-13

##Multiplicación##

3*4

##Division##

4/3

##Potencia##

3^3

##Valor infinito##

5/0

##Division entera##

5%/%2

##Modulo##

5%%2

##Flotante con n digitos##

round(3.45678, digits = 2)

#### #Tipos de datos en R#

#Objetos numéricos#


#Nota: En el lenguaje R se utiliza el operador de asignacion <-, tambien se puede utilizar el = pero en algunos caso no es recomendable, por lo que es mejor utilizar el operador <-

x <- 5L

##Para revisar el tipo de dato de una variable##

class(x)

#Otros ejemplos#

y <- 2

class(y)

w <- 3+4i

class(w)

##Lista de las variables existentes##

ls()

##Eliminar una variable##

rm(x)

x

#### #Funciones y constantes matematicas#

#Logaritmo base 10#
#

log10(100)

##Logaritmo base e##

log(2.7172)

##Logaritmo base 2##

log2(64)

##Valor absoluto##

abs(-12)

##Funcion exponencial base e##

exp(1)

##Raiz cuadrada##

sqrt(81)

##Constante pi##

pi

##Maneja una variable como entera aunque sea flotante haciendo un redonde hacia abajo##

z <- as.integer(x/y)

z

##Redondea un numero a 2 digitos##

round(3.476,digits=2)

##Obtener el entero mas pequeño que sea mayor que el numero que se le indique##

ceiling(3.475)

##Obtener el entero mas grande que sea menor que el numero que se le indique##

floor(3.475)

#### #Funciones para manejo de cadenas#

#Replica el primer argumento el numero de veces indicado en el segundo argumento#
#

rep("Hola",2)

##Concatena cadenas##

paste("Zapopan","Jalisco")

##Obtiene una subcadena de una cadena, como argumento indicamos la posicion inicial y la posicion final##

substr("Guadalajara",3,6)

#### #Vectores en R#

#Crear vector de enteros (del 1 a 1000)#
#

v2 <- 1:100

v2

##Crear vector con los cuadrados del vector v2#


#Nota: En lenguaje R, a diferencia de otros lenguajes, es muy común utilizar en el identificador de la variable algun punto en donde normalmente utilizamos un guion bajo para separar las palablas (Ej. variable_normal, variable.normal)
#

v2.cuadrado <- v2 ^ 2

v2.cuadrado

##Crear vector vA##

vA <- c(10,8,6)

vA

##Multiplicar cada elemento del vector vA por 10##

vA * 10

##Crear un vector con numeros del 1 al 10 con saltos de 2 en 2##

vB <- c(seq(1,10,2))

vB

##Mostrar el primer elemento del vector vA##

vA[1]

##Mostrar los primeros cuatro elementos del vector vB##

vB[1:4]

##Devuelve los indices de los elementos que cumplen la condicion que se le indique##

which (vB > 3)

##Una caracteriztica de los vectores en lenguaje R es que los elementos pueden ser de varios tipos de datos#

#Crearemos el vector sex, utilizando la función rep vista previamente#
#

sex <- c( rep('M', 3), rep('F', 3) )

sex

##Mostramos los indices de los elementos del vector sex que sean igual a 'M'##

which (sex == 'M')

##R nos permite realizar operaciones entre vectores#

#Creamos el vector x1#
#

x1 <- c(1,2,3)

##Creamos el vector y1##

y1 <- c(4,5,6)

##Producto de vectores##

x1 * y1

##Valor minimo en el vector##

min(x1)

##Valor maximo en el vector##

max(x1)

##Producto interno de dos vectores##

outer(x1,y1)

##Producto punto de dos vectores##

x1%*%y1

##Se puede realizar operaciones de conjuntos con los vectores, por ejemplo union e interaccion, en el caso de la interaccion calcula un factor que representa la interacción de los factores dados. 
#El resultado de interaccion siempre está desordenado.#
#

A <- c(1,2,3)
 B <- c(4,5,6)
 union(A,B)
 interaction(A,B)

#### #Matrices en R#

#Creamos una matriz con numeros del 1 al 15, podemos indicarle numero de filas y numero de columnas, ésta se llenara en orden por columnas.#


#Se puede especificar la forma en la que se llenara cambiando el argumento nrow por byrow, utilizando byrow = T se llenara por fila, con     byrow = F se llenara por columna#
#

m1 <- matrix(1:15, nrow=5, ncol=5)

m1

##Diagonal principal de m1##

diag(m1)

##Suma de columnas##

colSums(m1)

##Podemos crear una matriz con vectores previamente creados##

vX <-  c(0,1,2,5,10,20)
vY <- c(76,9,43,5,25,80)

##La matriz se llenara en orden por renglones##

row.bind <- rbind(vX,vY)

row.bind

##La matriz se llenara en orden por columnas##

col.bind <- cbind(vX,vY)

col.bind

##Muestra el elemento 1,1 de la matriz##

row.bind[1,1]

##Mestra el renglon 4 de la matriz##

row.bind[,4]

##Muestra la fila 1 de la matriz##

row.bind[1,]

##Muestra el indice del elemento que cumple una condición, en este caso el elemento con valor igual a 5##

index <- which(vX==5)

index

##Obtiene el elemento en el indice que le indiques##

vX[index]

##R nos da la libertar de experimentar mezclando varias funciones#

#Por ejemplo, crearemos la matris m3 con numeros del 1 al 9, llenando la matriz en orden por columnas y especificamos que necesitamos 3 columnas, despues mostraremos el indice del elemento que cumpla una condición, en este caso el de la funcion max y min#
#

m3 <- matrix(1:9, byrow=F, ncol=3)
m3
which.max(m3)
which.min(m3)

#### #Listas y Data frames en R#

#Al crear una lista podemos especificar las etiquetas de los elementos#
#

mi_lista <- list(nombre="juan",edad=28,jubilado=F)

##Mostrar las etiquetas de la lista##

names(mi_lista)

##Podemos incluir vectores como elemento dentro de una lista##

mireg <- list(nombre="maria", ingresis = c(23,34,15))

##Para acceder a un elemento de la lista lo haremos a traves de su etiqueta, utilizando el operador '$'##

mireg$ingresis

##R cuenta con el dipo de dato Data frame, este puede ser creado de diversas manera, con vectores, listas, archivos##

blood <- c('A', 'B', 'AB', 'B', 'O', 'O')
sex <- c(rep('M',3),rep('F',3))
people <- c('Rafael','Juan', 'Sebastian', 'Maria','Guadalupe','Sofia')

df.1 <- data.frame(people,blood,sex)
df.1

##Mostrar los atributos del Data frame##

attributes(df.1)

##Podemos utilizar diversas funciones en estos Data frames#

#Mostrar los indices de los elementos del Data frame que cumpla con la condicion que le indiquemos, en este caso que nos muestre los indices de los elementos que pertenecen a la etiqueta sex que sean igual a M#
#

masculino <- which(df.1$sex=='M')

##Ordena blood de forma decresiente, esto varia segun el argumento que le demos, sea True o False##

sort(df.1$blood, decreasing = TRUE)

#### #Data sets propios de R#

#R tiene por si mismo algunos data sets libres para ser utilizados#

#Mostrar la lista de data sets disponibles#
#

data()

##Cargar un conjunto en especifico##

data("women")

##Podemos ver las etiquedas del data set##

names(women)

##Podemos guardan en una variable los datos del data set, utilizado su etiqueda##

h = women$height
h

##Checar la longitud del vector previamente guardado##

tam = length(h)
tam

##Suma acumulada#

#En el data set "women" podemos enocontrar la etiqueta height, podemos hacer la suma acumulada en estos datos#
#

cumsum(women$height)

##Cargamos el data set "BOD"##

data("BOD")

##Buscamos algun valor o elemento igual al indicado en el primer parametro y nos regresa los indices, en el segundo argumento indicamos en donde queremos que lo busque##

grep("setosa", iris$Species)

##Suma los elementos de la columna Time en el data set BOD##

sum(BOD$Time)

##Checa si existe un dato que sea mayor o igual a 15 y retorna TRUE o False##

any(BOD$demand>=15)

#### #Tabla de datos#

#Para utilizar tablas necesitamos instalar el paquete "data.table" y lo cargamos en memoria como vimos antes#
#

install.packages("data.table")
library(data.table)

##Crea tabla 1 de la siguente manera##

DT1 <- data.table(x=c('c','a','b','r'), y=c(3,9,2,5))
DT1

##R nos permite utilizar llaves, se crea y se asigna de la siguiente manera##

setkey(DT1,x)
key(DT1)
haskey(DT1)

##Podemos ver ejemplos de setkey con el siguiente comando##

example("setkey")

##Hacer un "inner-join" con las tablas#

#Hacer merge con las tablas#

#Nota: El INNER JOIN es otro tipo de composición de tablas, permite emparejar filas de distintas tablas de forma más eficiente que con el producto cartesiano cuando una de las columnas de emparejamiento está indexada. Por lo que necesitaremos dos tablas
#

df1 <- data.frame(LETTERS, dfindex = 1:26)
df2 <- data.frame(letters, dfindex = c(1:10,15,20,22:35))
merge(df1, df2)

## #Comandos estadisticos basicos#

#Para los siguientes ejemplos cargaremos un archivo csv, R nos permite asignarles una variable para acceder a ellos a travez de ésta#
#

datos <- read.table("/content/sample_data/DatosTiemposEspera.csv", header = TRUE, sep = ",", nrows = 50)

##Encabezado##

head(datos)

##Nombre de columnas##

names(datos)

##Descripcion de dimensiones y sus tipos de datos##

str(datos)

##Dimensiones##

dim(datos)

##Tipo de dato##

class(datos)

##Total de datos##

n <- length(datos$Tiempos.de.espera)
n

##Raiz cuadrada del total de datos##

Numero_Clases <- sqrt(n) 
Numero_Clases

##Media##

Media <- mean(datos$Tiempos.de.espera)
Media

##Mediana##

Mediana <- median(datos$Tiempos.de.espera)
Mediana

##Moda##

Moda <- table(datos$Tiempos.de.espera)
Moda
max(Moda)

##Rango##

Rango <- max(datos$Tiempos.de.espera) - min(datos$Tiempos.de.espera)
Rango

##Varianza##

Varianza <- var(datos)
Varianza

##Desviacion estandar##

Desviacion_Estandar <- sd(datos$Tiempos.de.espera)
Desviacion_Estandar

##Coeficiente de variacion##

Coeficiente_Variacion <- (Desviacion_Estandar/Media)*100
Coeficiente_Variacion

##Se carga la libreria para usar la funcion "skewness"##

install.packages("e1071")
library(e1071)

##Regla empirica##

Sesgo <- skewness(datos$Tiempos.de.espera)
Sesgo

##Se calculan los valores de la regla empirica con las variables previamente calculada##

Regla_Empirica68.1 <- (Media+Desviacion_Estandar)
Regla_Empirica68.2 <- (Media-Desviacion_Estandar)
print("Regla empirica del 68%")
Regla_Empirica68.1
Regla_Empirica68.2
Regla_Empirica95.1 <- (Media+(2*Desviacion_Estandar))
Regla_Empirica95.2 <- (Media-(2*Desviacion_Estandar))
print("Regla empirica del 95%")
Regla_Empirica95.1
Regla_Empirica95.2
Regla_Empirica99.1 <- (Media+(3*Desviacion_Estandar))
Regla_Empirica99.2 <- (Media-(3*Desviacion_Estandar))
print("Regla empirica del 99%")
Regla_Empirica99.1
Regla_Empirica99.2

##Se relaiza la grafica con la campana de los datos de la columna llamada "Tiempos.de.espera", usando las variables previamente graficadas##

n <- length(datos$Tiempos.de.espera)
  media <- mean(datos$Tiempos.de.espera)
  table(datos$Tiempos.de.espera)
  x1 <- (Media-Desviacion_Estandar)
  x2 <- (Media+Desviacion_Estandar)
  x3 <- (Media-(2*Desviacion_Estandar))
  x4 <- (Media+(2*Desviacion_Estandar))
  x5 <- (Media-(3*Desviacion_Estandar))
  x6 <- (Media+(3*Desviacion_Estandar))
  Desviacion_Estandar <- sd(datos$Tiempos.de.espera)
  x <- datos$Tiempos.de.espera
  ymax <- max(dnorm(x, media, Desviacion_Estandar))
  max <- max(datos$Tiempos.de.espera)
  min <- min(datos$Tiempos.de.espera)
  
  
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

##Se utiliza el dataset llamado "iris" para estos ejemplos#

#Cuartiles#
#

summary(iris$Sepal.Length)

##Tabla de frecuencias absolutas##

table(iris$Species)

##Media geometrica##

prod(iris$Sepal.Length) ^ (1/length(iris$Sepal.Length))

##Media geometrica escala logaritmica##

mean(log(iris$Sepal.Length))

##Media geometrica escala original##

exp(mean(log(iris$Petal.Length)))

##Ordena de min a max la tabla de frecuencias##

sort(table(iris$Petal.Length), decreasing = T)

##Se programa una funcion que encuentra la moda de un vector##

moda <- function(x){
    #encuentra la moda de un vector
    m1=sort(table(x), decreasing=T)
    moda=names(m1[m1==m1[1]])
    moda=as.numeric(moda)
    return(moda)
  } #crea una funcion moda

##Se manda a llamar la funcion "moda" se de parametro se envia un vector, y regresa la moda##

getwd()

source("sample_data/moda.R")
moda(iris$Sepal.Length)

######Medidas de dispersion#

#Rango#
#

diff(range(women$height))

##Varianza##

var(women$height)

##Desviacion estandar##

sd(women$height)

##Coeficiente de variacion##

100 * sd(women$weight)/ mean(women$weight)

##Medidas de posicion, de uno en uno hasta el 11##

quantile(women$weight, probs = seq(0,1,length=101), type = 5)

##Diagrama de tallo y hoja##

stem(women$height)

##Campana de gauss##

x <- women$height
x
mu <- mean(women$height)
sigma <- sd(women$height)
fx <- (1/sqrt(2*pi*sigma))*exp((x-mu)*(x-mu)/(-2*sigma*sigma))
fx
plot(x, fx, main="Distribucion women height", type="l")

##Prueba de shapiro-wilk##

shapiro.test(rnorm(100, mean=0, sd=1))

##Distribucion binomial#

#Numero de exitos de n ensayos#

#Ejemplo: sumular el numero de mujeres que podrian esperar presentar su  trabajo en una conferencia donde 20 articulos seran presentados, el cual 40% son mujeres.#
#

x <- rbinom(500, 20, .4) #500 aleatorios, 20 aceptados, 40% son mujeres
x
summary(x) #de las mujeres acpetadas, min son 2, promedio 8, y el max 15
hist(x, col = rainbow(length(x)))
###########
dbin= dbinom(1:20, size = 20, prob=.4) #de 20 papers, el .4 son aceptados
prob.bin <- data.frame(dbin)
prob.bin
dbinom(8, size = 20, prob=.4)
pbinom(8, size=20, prob=.4) #probabilidad acumulada
sum(prob.bin$dbin[1:8]) #suma de las probabilidades, hasta el 8

##Grafico de dispersion##

EPG.tbl <- read.table('http://verso.mat.uam.es/~joser.berrendero/datos/EdadPesoGrasas.txt',header=TRUE)
names(EPG.tbl)

##Correlacion##

pairs(EPG.tbl)

##Matriz correlacion#

#Coeficientes de correlacion#
#

cor(EPG.tbl) 
cor(EPG.tbl$edad, EPG.tbl$grasas)

##Modelo de regresion lineal##

dev.off()
plot(EPG.tbl$edad, EPG.tbl$grasas, xlab = "edad", ylab="grasas")
abline(lm(grasas~edad, data=EPG.tbl)) #y=5.321x + 102.575

###Importar archivos y graficar#

#Plot#

#Para la funcion plot necesitamos un vector x y un vector y#

#Agregar rug a la grafica, el argumento ticksize es personalizable#
#

x <- rnorm(100) #vector x
y <- rnorm(100)
plot(x,y)
rug(x, ticksize = .5)

##Plot nos permite personalizar la grafica con los parametros dados, puedes checar todos estos argumentos en la documentacion##

plot(x,
       type="b", 
       main="Titulo", 
       sub="subtitulo", 
       col = c("blue"),
       xlab= "x label",
       ylab = "y label",
       frame.plot = FALSE, #quita el marco
       grid(8,8), #cuadricula
       axes = FALSE #esconder los ejes
  )

##Parabola##

plot(1:11, 
       (-5:5)^2, 
       main = "parabola", 
       xlab = "xlab", 
       type="l")
  mtext("margen3 renglon", side = 3, line=1)

##Metodo points##

plot(-4:4, -4:4, type = "n")
points(rnorm(200), rnorm(200), col="red")
title("Puntitos aleatorios")

##Graficar trigonometria#

#Definimos un vector, en este caso de 10 puntos#
#

x <- seq(0, 2*pi, length=10)

##Seno##

plot(sin(x), main="sin x", type="l")

##Coseno##

plot(x, cos(x), main = "coseno")

##Grafico curvas##

curve(cos, from = -2*pi,to = 2*pi, xname="x", main="Coseno x")

curve(exp, from=-2*pi, to=2*pi, xname="x", main="Funcion exponencial")

##Graficas de barras#

#Cargamos un data set para trabajar con el#

data(VADeaths)
class(VADeaths)
barplot(VADeaths)

##Se pueden personalizar segun nuestras necesidades#

#Incluso podemos elegir los colores creando un vector o cargando una paleta de colores, (Nota: para usar una paleta de colores tenemos que instalarla y cargarla en memoria)#
#

barplot(VADeaths, beside = T, col= c("red", "green", "yellow", "blue", "orange"))

install.packages("rainbow")  
library("rainbow")
barplot(VADeaths, beside = T, col= "rainbow")

##Grafico de pastel#

#Tambien es muy personalizable, checar la documentacion#
#

mes <- c("Enero", "Febrero", "Marzo")
frec <- c(8,2,5)
pie(frec, col= rainbow(length(mes)), main="Grafico Cricular", labels=mes, radius=0.8)

##Histograma##

hist(women$height, main = "Histograma de altura", col = rainbow(length(women$height)))

##Grafico de cajas##

boxplot(women$height, main="Grafico de caja", col = rainbow(length(women$height)), ylab = "Estatura de Mujeres cm")

##Para mas informacion sobre los graficos en R y su flexibilidad para ser personalizados usted puede ver el demo de graficos##

demo("graphics")

demo("lm.glm")