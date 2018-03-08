# Titanic Survival Rate

We have known for long about the Titanic incident and how did it sink its first voyege to US during its journey. Here is the data set about every passenger on the titanic with its class, sex, whether survived or not etc.  We will work with the data set to find some findings and find what would is the survival rate of the passenger who were already on titanic. We would also implement a Data Science algorithm to predict that if a person gets on titanic whether he/she would have survived that fatal incident or not. To get the data you can install the earth package in the R and then find the titanic data

```R
install.packages("earth")
library(earth)
data(etitanic)
```

### About the data

```R
?etitanic
```
[![Summary.png](https://s14.postimg.org/6fp7a3rxt/Summary.png)](https://postimg.org/image/o5qvv55il/)

### Understanding the data

#### How many men and women were there on the ship with the bar plot
We are taking the old data frame and making a new data frame with just the sex as a different column

```R
etitanic1 <- etitanic[,c(3)]
barplot(table(etitanic1),
        main="Count of number of females and males",
        xlab="Sex",
        ylab="Count",
        border="red",
        col="blue",
)
```
[![q2.1.png](https://s14.postimg.org/3mvzpomc1/q2.1.png)](https://postimg.org/image/nhi1bt1jh/)

#### Predicting the survival rate
Here we will group by sex and then find the mean of the column survived since it only 1's and 0's where 1 is survived and 0 is dead. This can be done because our variable has only binary data and will find mean on 1's only.

```R
etitanic3 <- etitanic %>% group_by(sex) %>% summarise(survivalrate=mean(survived)); etitanic3
ggplot(etitanic3, aes(x=sex, y=survivalrate)) + geom_bar(stat="identity") + 
labs(x="Sex", y="survival rate value")
```

[![image.png](https://s14.postimg.org/knevyjua9/image.png)](https://postimg.org/image/ytumts559/)

Rest of the code can be found in the R file shared with more findings and implementation of the decision tree algorithm to predict about whether the passenger will survive or not. The file also contains about SQL implementation of queries 
