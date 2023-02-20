################ set the directory 
getwd()
setwd('C:\\Users\\DELL\\Documents\\Rfiles')

############## Loading the package 

install.packages('pacman')
library(pacman)

############## Load Multiple packages at the same time  

pacman::p_load(car, psych, MASS, ggplot2) 

######################### Update R 
install.packages('installr')
library(installr)
updateR()


####################### Update Packages

update.packages(ask = FALSE, checkBuilt = TRUE)


##################### Importing and saving data sets  

data = read.csv(file.choose())

write.csv(data, file = 'data.csv', row.names = FALSE)

###################### variables and assignment of values

x = 1

y = 2

x+y 

################### Sequence and vectors

x = c(1,3,2,4,5,6,7) #vector

length(x)

string_vector = c('Orange','Apple','Promgranate')

y = 1:30

y

sequ = seq(10,40,2)

sequ

################### creating matrix and data frame
#square matrix, same number of row and column
#in R functions contains first bracket and sub-setting use third bracket
#rectangular 
matrix_mat = matrix(c(1,3,2,4,5,6,7,8,9), nrow = 3, ncol = 3)

matrix_square = matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3, ncol =3)

matrix_square

dim(matrix_square)

matrix_square[,3]

matrix_square[3,2]

matrix_mat

matrix_mat[,3]

mat_data_frame = data.frame(matrix_square)

mat_data_frame

matrix_mat [1,3]

dim(matrix_mat) #Returns the dimension of the matrix, array, data frame

mat_data = data.frame(matrix_mat) #converting matrix into data frame

colnames(mat_data_frame) = c('orarnge', 'apple', 'lemon')

mat_data
colnames(mat_data_frame) = c('orange', 'apple', 'lemon')

mat_data_frame

data_frame_2 = data.frame(id = c('id1', 'id2', 'id3', 'id4'), sales = c(100, 120, 130, 140))

data_frame_2

data_frame_4 = data.frame(id = c('id1', 'id2', 'id3', 'id4'), sales = c(100, 120, 130, 140))

data_frame_4

colnames(data_frame_4) = c('Identification', 'Sales Revenue')

data_frame_4['Sales Revenue']

attach(data_frame_4)

employee_bonus = c(10, 20, 30, 40)

data_5 = cbind(data_frame_4,employee_bonus)

data_5

colnames(data_frame_2) = c('id', 'sales revenue')

new_row = c('id5', 150, 50)

data_6 = rbind(data_5, new_row)

data_6

data_6[3,3] = 50

data_frame_4

data_frame_2

#data attachment

#we need to attach the data to use models like the one as follows, unless we have to use $ sign again and again


model = lm(sales_revenue ~ employee bonus, data = data_2)

attach(data_frame_2) 

data_frame_2['sales revenue'] #sub-setting data, one column

profit = c(40, 50, 70, 78)

profit

data_frame_3 = cbind(data_frame_2, profit)

data_frame_3

new_row = c('id5', 150, 85)

data_frame_4 = rbind(data_frame_3, new_row)

data_frame_4

data_frame_4[3,3] = 85

data_frame_4[3,3]

data_frame_4[3,]= c('ID3', 12.40, 10)

data_frame_4

data_frame_4[2, ] = c('id2', 110, 50, 100, 150)

data_frame_4

data_frame_4[, 2] = c(50, 110, 50, 100, 150)

### Setting seed for random numbers

set.seed(142) #if both use seed 142 then the the random numbers will be same if we bo
rnorm(5) # rnorm =normally distributed random number

set.seed(100)

rnorm(5)



