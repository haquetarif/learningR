#Solution of the R Capstone


#Importing Data

US_Collage_Data = read.csv(file.choose())

attach(US_Collage_Data)

#Importing Libraries
pacman::p_load(psych, corrplot, Hmisc, lattice, ggplot2)


#2 Cleaning the data dropping the

colnames(US_Collage_Data)

Clean_US_College_Data = subset(US_Collage_Data, select = 
                                 - c(longitude, latitude, website, 
                                     phoneNumber, city, country,state.1, 
                                     yearFounded, stateCode, undergradPop, 
                                     totalGrantAid, percentOfStudentsGrant,
                                     totalStudentPop))
Clean_US_College_Data

attach(Clean_US_College_Data)

colnames(Clean_US_College_Data)

str(Clean_US_College_Data)



#1 Converting categorical variables into Dummy Codes




