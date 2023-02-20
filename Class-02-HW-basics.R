data = read.csv(file.choose())
attach(data)
names(data)
colnames(data)
str(data) #structure of the data
head(data, n = 6)
tail(data, n = 8)
length(data)
dim(data)
nrow(data)

names(data)

data$Date = NULL


data_5 = subset


write.csv(data, file = 'data_no_date.csv', row.names = FALSE)


getwd()

setwd('C:\\Users\\DELL\\Documents\\Rfiles')


data

names(data)

colnames(data) = c('Topic_1', 'Topic_2', 'Topic_3')


data

is.na(data) #check if there is any NA value

data_wihout_NA = data[complete.cases(data),] #it removes the NA values


data_wihout_NA

data[!complete.cases(data), ] #returns only the NA values

dim(data[!complete.cases(data), ]) #returns the dimensions of NA values

?barplot ## Find documentation

z = c(10, 4, -5, 7,0, NA)

mean(z, na.rm = TRUE)
