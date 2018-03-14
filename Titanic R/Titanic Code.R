install.packages("earth")
library(earth)
data(etitanic)
summary(etitanic)
?etitanic

#count the number of male passenger and female passengers
#source : https://stackoverflow.com/questions/25293045/count-number-of-rows-in-a-data-frame-in-r-based-on-group
data.frame(table(etitanic$sex))

#creating a new data frame from the existing dataframe to get a bar plot for number of males and females
etitanic1 <- etitanic[,c(3)]
etitanic1

#creating a barplot to display number of males and females 
barplot(table(etitanic1),
        main="Count of number of females and males",
        xlab="Sex",
        ylab="Count",
        border="red",
        col="blue",
)



#finding total number of males and females
etitanic2 <- with(etitanic, table(sex)); etitanic2
etitanic2

#finding total number of people survived for each sex where 0 = died and 1 = survived
#source : https://www.quora.com/How-do-I-get-a-frequency-count-based-on-two-columns-variables-in-an-R-dataframe
etitanic2 <- with(etitanic, table(survived, sex)); etitanic2
etitanic2


install.packages("magrittr")
install.packages("dplyr")
library(magrittr)
library(dplyr)

#finding the survival rate for each sex and storing it into a new table
etitanic3 <- etitanic %>% group_by(sex) %>% summarise(survivalrate=mean(survived)); etitanic3
etitanic3

#using ggplot to plot the survival rates of each sex with x axes as sex and y axes as the survival rate value
install.packages("ggplot2")
library(ggplot2)
ggplot(etitanic3, aes(x=sex, y=survivalrate)) + geom_bar(stat="identity") + 
  labs(x="Sex", y="survival rate value")

install.packages("sqldf")
library(sqldf)

#transfering dataframe into a sql table format
etitanic5 <- etitanic
attributes(etitanic5) <- attributes(etitanic)[
  c("names", "row.names", "class")]
class(etitanic5) <- "data.frame"

#checking for colnames 
colnames(etitanic5)
s03 <- sqldf("select * from etitanic5")
s03

#checking that all the data is importated or not
s04 <- sqldf("SELECT count(*) FROM etitanic5")
s04


#finding the survival rate by sex using sql query
#the reason it worked because the survived column had binary values so tried a different way below but couln't find the 
#result due to some reason. Kindly please help
s09 <- sqldf("select sex,avg(survived) from etitanic5 group by sex")
s09

#query tried but not working please help
s10 <- sqldf("select (T1.Survived_Total/T2.Full_Total) as Rate from 
             (select sex,count(*) as 'Survived_Total'
             from etitanic5 where 
             survived = 1 group by sex) as T1,
             (select sex,count(*) as 'Full_Total'
             from etitanic5
             group by sex)as T2
             where T1.sex=T2.sex")
s10


#checking how many people survived overall where 0= dead adn 1= survived
#showing more people died and not surviving
etitanic6 <- with(etitanic, table(survived)); etitanic6
etitanic6


#creating a barplot to display number of people dead and survived 
barplot(table(etitanic6),
        main="Count of people survied and deda",
        xlab="Dead or survived",
        ylab="Count",
        border="red",
        col="blue",
)

barplot(etitanic6, main="Plot for dead vs survived prople", horiz=TRUE,
        names.arg=c("0", "1"))

#number of people survived by class
#clearly see in the results that number of people survived from class one were more than in number of people in class 3
etitanic7 <- with(etitanic, table(survived,pclass)); etitanic6
etitanic7

#even comparing the rates the survival rate is clearly high for a person who travelled in first class
etitanic8 <- etitanic %>% group_by(pclass) %>% summarise(survivalrate=mean(survived)); etitanic8
etitanic8

install.packages("caret")
library(caret)


titanictrain <- createDataPartition(y = etitanic$survived, p= 0.9, list = FALSE)
training <- etitanic[titanictrain,]
testing <- etitanic[-titanictrain,]

anyNA(etitanic)

trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
dtree_fit <- train(survived ~., data = training, method = "rpart",
                   parms = list(split = "information"),
                   trControl=trctrl,
                   tuneLength = 10)

dtree_fit

install.packages("rpart.plot")
library(rpart.plot)
prp(dtree_fit$finalModel, box.palette = "Reds", tweak = 1.2)

testing[1,]

predict(dtree_fit, newdata = testing[1,])


dtree_fit_gini <- train(survived ~., data = training, method = "rpart",
                        parms = list(split = "gini"),
                        trControl=trctrl,
                        tuneLength = 10)
dtree_fit_gini

test_pred_gini <- predict(dtree_fit_gini, newdata = testing)


confusionMatrix(test_pred_gini, testing$survived) 
