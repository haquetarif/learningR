

# -------------- Advanced Visualization ----------------
data = read.csv("http://goo.gl/QPDdMl")
attach(data)
colnames(data)
# import libraries 
pacman::p_load(psych, corrplot, Hmisc, lattice, ggplot2)
colnames(data) = c('SN', 'year', 'week', 'sales_1', 
                   'sales_2', 'price_1', 'price_2', 'prom_1', 'prom_2', 
                  'country')
# save the data into csv file format
science_modeling = write.csv(data, file = 'data_science_modeling.csv', row.names = FALSE)

names(data)
attach(data)
ggplot(data = data, aes(x = sales_1)) +
  geom_histogram(bins = 80, fill = 'blue')+ 
  labs(x = "Sales", y = "Frequency", title = "Histogram")+
  scale_y_continuous(limits = c(0, 350), breaks = seq(0, 350, by = 50))
###----------Grouped Histogram 

data$promo_1 <- ifelse(prom_1 == 0, 
                                 "No promotion", 
                                 "With promotion")

ggplot(data = data, aes(x = sales_1)) +
  geom_histogram(bins = 20, col = "white", fill = 'red') +
  facet_grid(.~promo_1) +
  labs(x = "Sales of Product 1", y = "Frequency") +
  scale_y_continuous(limits = c(0, 350),
                     breaks = seq(0, 350, by = 50)) 

##--------------building box plot 

ggplot(data = data, aes(y = sales_1)) +
  geom_boxplot()+
  labs(x = '', y = 'sales')
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

##-----------grouped bar chart 
ggplot(data = data, aes(x = as.factor(price_1), fill = as.factor(year))) + 
  geom_bar(stat = "count", position = "dodge", width = 0.6) +
  labs(x = "Price Levels", y = "Frequency", fill = "Year") +
  scale_y_continuous(limits = c(0, 250)) 
#------------- alternative way  
ggplot(data = data, aes(x = as.factor(price_1), fill = as.factor(year))) + 
  geom_bar(stat = "count", position = "dodge") +
  labs(x = "Price Levels", y = "Frequency", fill = "Year") +
  scale_y_continuous(limits = c(0, 500)) +
  scale_fill_brewer(palette="Set1") 

#---------or 

ggplot(data = data, aes(x = as.factor(price_1), fill = as.factor(year))) + 
  geom_bar(stat = "count", position = "dodge") +
  labs(x = "Price Levels", y = "Frequency", fill = "Year") +
  scale_y_continuous(limits = c(0, 250)) +
  scale_fill_manual(values = c('pink','blue'))

##--------------scatter plot 
options(repr.plot.width =5, repr.plot.height =6)
ggplot(data = data, aes(x = sales_1, y = sales_2)) +
  geom_point()
min_xy = min(sales_1, sales_2)
max_xy = max(sales_1, sales_2)
ggplot(data = data, aes(x = sales_1, y = sales_2)) +
  geom_point(col = 'red') +
  scale_x_continuous(limits = c(min_xy, max_xy)) +
  scale_y_continuous(limits = c(min_xy, max_xy)) +
  coord_fixed()+
geom_smooth(method = "lm", color = "blue", lwd = 0.8)+
  geom_vline(xintercept = mean(sales_1), col = 'black',linetype = 'dotted', lwd = 0.7) +
  geom_hline(yintercept = mean(sales_2),linetype = 'dotted', col = 'green', lwd = 0.7)
#################

g_plot_2 = ggplot(data = data_75, aes(x =`Percentage Watching`, y = Views)) +
  geom_point(col = 'blue', size = 2.5) +
  coord_fixed()+
  geom_smooth(method = "lm", color = "red", lwd = 1)+
  facet_grid(.~string_data)+
  xlim(c(0,100))+
  ylim(c(0,700))+
  theme(aspect.ratio = 0.5)+
  theme(text = element_text(size = 10),element_line(size =0.30))+
  labs(title = 'Relation Between Views and Retention', )+
  theme(plot.title = element_text(hjust = 0.5, size = 9)) 
