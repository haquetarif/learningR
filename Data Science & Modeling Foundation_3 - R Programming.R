

####------------------------- Functions and Loops in R---------------------------
# ---------simple function format 
myfunc = function(y){
  m = y*y
  return(m)
}
myfunc(y = 4)# see the output  

myfunc = function(x , y){
  z = x*y+y
  return(z)
}
myfunc(7,3) # see the output  

# ---------------alternative method 
x = 1:100 
y = 1:100 
my_plot = function(x,y){
  plot(x,y)
}
my_plot(x,y)

#-----Complex function 
x = 1:200 
y = 1:200
m = 1:100 
d = 1:80
my_fun = function(y,m,x,d){
  q = m+log(y)
  z = d+log(x)
  return(list(z=z, q=q))
}
my_fun(y,m,x,d)
# more complex function  
x = 1:200 
y = 1:200
m = 1:8
d = 1:80
my_fun = function(y , m, a=40){
  q = m+a*log(y)
  plot(y,q,xlim = c(0,200), ylim = c(0,200))
  return(q)
}
my_fun(y,m)
#-------More example 
my_fun_1 = function(y,m,a=20){
  n = a+m*sin(y)
  return(n)
}
my_fun(20,10)
####----- If function 
x = 5 
if(x<10){
 print('x is equal to 5')
}else if (x>4){
  print('x is still equal to 5')
} else{
  print('x not equal to 5')
}
#---------more complex format 
z = 20
b = 2.3
c = 0.44
e = .57
k = z+b/c+(c*e)/3+(c*c)
if(k>b){
  print('k is the target parameter')
} else if(k<b){
  print('k is not the target parameter')
} else if(k==b){
  print('discard k as false parameter')
} else{
  print('reset the numbers')
}
#-------- ifelse 
x = c(3,4,5)
ifelse(x==3,1,ifelse(x==4, 2, 3))

#---------ifelse application - categorical coding 

x = c('low', 'medium', 'high')
ifelse(x=='low', 1, ifelse(x=='medium', 2,3))

#------- for loop 
for(i in 1:1000){
  z = i*i+1
  print(z) 
}
#-----------combine for and If loop 
for(s in 0.24:1)
  sigma = (s*s)/2+sqrt((s-0.20)^2)
  if(sigma>1){
    print('incorrect correct sigma from normal distribution')
  } else if(sigma<1){
    print('correct sigma from normal distribution')
  } else{
    print('reset the formula')
  }
# ---Building For Loops in R 
A = matrix(1:9, nrow = 3, ncol = 3)
B = matrix(9:18, nrow = 3, ncol =3)
c = matrix(0, nrow = 3, ncol =3)
for(i in 1:nrow(A)){
  for (j in 1:ncol(A)){
    for (k in 1:nrow(B)){
      for (m in 1:ncol(B)){
        c[k,m] = i+j+k+m
        
      }
    }
    
  }
}
#-----------Matrix multiplication with for loop 
C = matrix(0 , dim(A)[1] , dim(B)[2] , TRUE ) 
mat_mult = function(A,B){
  for ( i in 1:dim(A)[1] ) {
    for ( j in 1:dim(B)[2] ) {
      for (k in 1:dim(A)[2] ) {
        C[i,j] = C[i,j] + A[i,k]*B[k,j]
      }
    }
  }
 return(C) 
}
mat_mult(A,B)
#------------- while loop 
k = 0
while(k<5){
  m = k-1
  print(m)
}

#  A practical Application 

for(i in 1:ncol(data)){
  data[,i][is.na(data[,i])] = mean(data[,i], na.rm = TRUE)
}
### we will implment this loop for removing NA values in the next class 
data = read.csv(file.choose())
names(data)
data$studentFacultyRatio










