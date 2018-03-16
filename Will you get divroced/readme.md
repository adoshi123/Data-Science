# Will you get divorced or not

The February-March 2007 Social Trends Survey, sponsored by the Pew Research Center
for the People &amp; the Press, obtained telephone interviews with a nationally representative sample
of 2,020 adults living in continental United States telephone households. The survey was
conducted by Princeton Survey Research International. Interviews were done in English and
Spanish by Princeton Data Source, LLC from February 16 to March 14, 2007. Statistical results
are weighted to correct known demographic discrepancies. The margin of sampling error for the
complete set of weighted data is ±2.8%.
Details on the design, execution and analysis of the survey are discussed below.
Further there is a document which discusses in detail about the survey added with the document with has the whole questionare.

Source : Prepared by Princeton Survey Research Associates International
for the Pew Research Center for the People &amp; the Press

With critical understanding of the data through graphs and charts we cut short to the relevant fields from a list of 130+ fields. 

### Roadmap

We would build charts to understand each field. Further, we want to implement a Data science alogrithm to predict the chance of divorce for a particular person. So we would try and find a decision variable by understanding the relation of variables with other variables with helps of charts. Then we would try and implement first the decision tree algorithm and check the accuracy and then implement logistic regression, check the accuracy and finally implement the best of the both. You will find the python file for both codes. 

### Graphs and charts

```Python
#pie chart to show what kind of data about the marriage status we have showing over 60% of the data is about people who are married
#or divorced
marriage['marriageStatus'].value_counts().plot(kind='pie',labels=['Married','Divorced','Seperated','Living with a partner','Widowed'],figsize=(6, 6))
```
[![divorced.png](https://s9.postimg.org/7ecoddhkf/divorced.png)](https://postimg.org/image/mab7kysyz/)

```Python
#barplot of marriage rating grouped by race 
# 1 White 2 Black 3 Hispanic 4 Other 9 Don't Know

pd.crosstab(marriage1.racethn, \

marriage1.everDivorced.astype(bool)).plot(kind='bar',color=['#E7D7C1', '#BF4342']) 
plt.title('Race & Divorce') 
plt.xlabel('Race') 
plt.ylabel('Frequency')
plt.xticks(range(5), ('White', 'Black', 'Hispanic','Other','NA'),rotation=0)
```
[![Histogram.png](https://s9.postimg.org/evlvs7wpb/Histogram.png)](https://postimg.org/image/60l1hp7wr/)

Further charts can be found in the ipynb files with the code implementation.
