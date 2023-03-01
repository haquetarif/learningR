
#--------------------------Lecture One-------------------------

################ set the directory 
getwd()
setwd('C:/Users/Jamal/Desktop/Bechmark Data Folder')

############## Loading the package 

install.packages('pacman')
library(pacman)

############## Load Multiple packages at the same time  

pacman::p_load(car, pysch, MASS, ggplot2)

######################### Update R 
install.packages('installr')
library(installr)
updateR()
####################### Update Packages

update.packages(ask = FALSE, checkBuilt = TRUE)

##################### Importing and saving data sets  
data = read.csv(file.choose())
rahim = x^2 




data = read.csv(file.choose())
write.csv(data, file = 'data.csv', row.names = FALSE)

###################### variables and assignment of values    
x = 2 
y >2 
z = 4 
x+z 
################### Sequence and vectors 
x = c(1,3,2,4,5,6,7) # vectors 
length(x)
string_vector = c('orange', 'apple', 'promgranate')
y = 1:30 
sequ = seq(10, 40, 2)
sequ 
################### creating matrix and data frame 
matrix_mat = matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3, ncol = 3)
matrix_mat
matrix_mat[,3]
matrix_mat[3,2]
dim(matrix_mat)
mat_data = data.frame(matrix_mat) # converting matrix into data frame 
colnames(mat_data) = c('orange', 'apple', 'lemon')
colnames(mat_data)
data_2 = data.frame(id = c('id1', 'id2', 'id3', 'id4'), sales = c(100, 120, 130, 140) )
data_2
colnames(data_2) = c('ID', 'Sales Revenue')
data_2
attach(data_2)
data_2['Sales Revenue'] # sub-setting data

############################ Adding new column and row to a data set 
profit = c(40, 50, 70, 78)
profit 
data_3 = cbind(data_2, profit) # Add new column to a data set 
data_3 
new_r()ow = c('id5', 150, 85)
data_4 = rbind(data_3, new_row) # Add new row to a data set 
data_4
######################### Replacing a particular value in a row or column

data_4[3,3] = 88 # replacing a particular value 
data_4[3,] = c('ID3', 12.40, 13.77) # replacing a particular row 
data_4
data_4[,3] = c(133, 155, 177, 188, 199) # replacing a particular column 
data_4

################## setting the seed for random draws of numbers 
set.seed(142)
rnorm(5)
set.seed(100)
rnorm(5)
#------------------------------------------------------------------------
