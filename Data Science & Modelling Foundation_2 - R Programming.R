
#------------------------------Lecture Two-------------------------------------
data = read.csv(file.choose())
attach(data)
colnames(data)
str(data)
head(data, n = 8)
length(data)  #------gives the number of columns 
dim(data)     #------gives the number of rows and columns 

############### Dropping a Particular columns from Data  
data$NWT.1 = NULL 
# alternative method using sub-setting technique
data
############# Sorting values by particular column 
data[order(data$AGE), ]
head(data[order(data$AGE), ], n = 10)
data[order(data$AGE, data$NWT),]
head(data[order(data$NWT, data$AGE),], n = 6)
############ Checking and removing NA values 
z = c(10, 4,-5,7,0,NA)
mean(z, na.rm = TRUE)
median(z, na.rm = TRUE)
var(z, na.rm = TRUE)
is.na(data)
data[complete.cases(data), ] #---------getting rows with NO NA in any column 
dim(data[complete.cases(data), ]) 
data[!complete.cases(data), ]#---------getting rows with NA in any column  
dim(data[!complete.cases(data), ])
#---------------------------------------------------------------------
data[complete.cases(data$NWT), ] #----getting rows with NO NA in a specific column
dim(data[complete.cases(data$NWT), ])
data[!complete.cases(data$NWT),] #----getting rows with NA in a specific column
dim(data[!complete.cases(data$NWT),])

############ Factorization & creating dummy variables
data$TCP = factor(data$TCP, c('yes', 'no'), labels = c(1,0))
data$TCP 
data$TCP = as.factor(data$TCP)
data$TCP
head(data,n = 5)
############ Grabbing a particular portion of the data set 






