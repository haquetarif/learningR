

############### Descriptive Statistics and Plotting####################

data = read.csv("http://goo.gl/QPDdMl")
attach(data)
colnames(data)
# import libraries 
pacman::p_load(psych, corrplot, Hmisc, lattice, ggplot2)
# drop some columns from the data  
data_1 = subset(data, select = - c(p1prom, p2prom))

colnames(data_1) = c('SN', 'year', 'week', 'sales_1', 
                   'sales_2', 'price_1', 'price_2', 
                   'country')
colnames(data_1)
attach(data_1)

write.csv(data, file = 'Data Science and Modeling_4.csv', row.names = FALSE)

#-------------Descriptive statistics 
mean(sales_1) 
# or 
mean(data_1$sales_1)

median(data_1$sales_2 ) # checking median 

var(sales_1) # checking variance 
var(sales_2)

cov(sales_1, sales_2) # checking covariance 
corrleation = cor(sales_1, sales_2, method = c('pearson', 'kendall', 'spearman'), use = 'everything')
corrleation

cov(sales_1, price_1) # demand relation  
cov(price_1, price_2) # complement or substitute goods 

quantile(sales_1, probs = c(0.25, 0.40, 0.55, 0.70, 0.85))

##------group mean 
by(sales_1, week, mean)
# put group mean in data frame 
group_mean_sales_1 = aggregate(sales_1, by = list(store = SN), mean) 

colnames(group_mean_sales_1) = c('Store Number', 'Mean Sales')

group_mean_sales_1

write.csv(group_mean_sales_1, file = 'Sales_1 by Store.csv', row.names = FALSE)

#-------- Hypothesis testing  
t.test(sales_1, sales_2, alternative = 'greater', 
       paired = FALSE, var.equal = FALSE, 
       conf.level = 0.95)
cor.test(sales_1, sales_2, conf.level = 0.95, 
         alternative = 'greater', exact = FALSE, 
         continuity = FALSE,
         method = c('pearson', 'kendall', 'spearman'))
        
#----------Basic Plotting  

plot(sales_1, sales_2, 
     xlab = 'sales_1', 
     ylab = 'sales_2', 
     main = 'scatterplot of sales of products 1 and 2')
#--------make histogram  
hist(sales_1,
     main = 'Histogram', 
     prob = TRUE,
     color = 'red', 
     breaks = 50)
# add density curve to the histogram
lines(density(sales_1, 
              bw = 1), #smoothing parameter
      type = "h",       
      col = "red",  
      lwd = 2)     
# do more to the simple scatter plot 
plot(sales_1,sales_2, 
     xlab = 'sales_1', 
     ylab = 'sales_2', 
     main = 'scatterplot of sales of products 1 and 2', 
     xlim = c(0,350), 
     ylim = c(0,350))
#---add line to the scatter 
model_1 = lm(sales_1~sales_2, data = data_1)

abline(model_1,
       lty = 1, col = 'red', lwd = 2)
abline(v = mean(sales_1), col = "blue", lty = 2, lwd = 1 ) # adds a vertical line
abline(h = mean(sales_2), col = "green", lty = 4, lwd = 1) # adds a horizontal line
#---abline(a = 1,b = 1, col ='red')            

# Bar plot 
table(price_1) # collect absolute frequency of prices 

barplot(table(price_1),
        #horiz = TRUE,
        ylab = "Price Levels",
        xlab = "Absolute Freqeuncy",
        xlim = c(0, 500),
        col = "white")

barplot(table(price_1))
##-------------Box Plot 

boxplot(sales_1)

boxplot(sales_1, 
        main = "Box Plot for Sales of Product 1",
        ylab = "Sales",
        col = "red")
# Add the mean value
points(mean(sales_1), 
       col = "blue",            
       pch = 16)               

# Horizontal box plot
boxplot(sales_1, 
        main = "Box Plot for Sales of Product 1",
        xlab = "Sales",
        col = "blue",
        horizontal = TRUE)     
# Add the mean value
points(mean(sales_1), 
       # To add a point to a horizontal box plot
       seq_along(mean(sales_1)), 
       col = "red",            
       pch = 16)
#------------ggplot 
ggplot(data = data, aes(x = sales_1)) +
  geom_histogram(bins = 80, fill = 'blue')+ 
  labs(x = "Sales", y = "Frequency", title = "Histogram")+
  scale_y_continuous(limits = c(0, 350), breaks = seq(0, 350, by = 50))

#--- Grouped Histogram

data$promo_1 <- ifelse(prom_1 == 0, 
                       "No promotion", 
                       "With promotion")

ggplot(data = data, aes(x = sales_1)) +
  geom_histogram(bins = 20, col = "white", fill = 'red') +
  facet_grid(.~promo_1) +
  labs(x = "Sales of Product 1", y = "Frequency") +
  scale_y_continuous(limits = c(0, 350),
                     breaks = seq(0, 350, by = 50)) 

#----- grouped box plot 
ggplot(data = data, aes(x = promo_1, y = sales_1)) +
  geom_boxplot(fill = 'grey')+
  labs(x = "", y = sales_1)+
  stat_summary(fun = "mean", geom = "point", 
               col = "red", fill = "darkred",
               size = 2)
#---------- bar chart 
ggplot(data = data, aes(x = price_1)) + 
  geom_bar(stat = "count")
ggplot(data = data, aes(x = as.factor(price_1))) + 
  geom_bar(stat = "count")+
  labs(x = "Price Levels", y = "Frequency")



