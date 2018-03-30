# Prediction Of football position for a player using Logistic Regression

Here is a dataset from Kaggle about FIFA'17 players who has certain attiributes about its play in the game. They might be related, might not be related, what are they lets find out. We will try and understand their characterstics by various graphs plotted using GGPLOT in python, do A/B testing  and understand which features are important i.e do feature engineering, further apply an data science algorithm to predict the probability for a player to play in a position. Inbetween we will also try to clean data, make categorical variables and include them in implementation of the algorithm.


### About the DataSet
17,000+ players
50+ attributes per player ranging from ball skills aggression etc.
Player's attributes sourced from EA Sports' FIFA video game series, including the weekly updates
Players from all around the globe
URLs to their homepage
Club logos
Player images male and female
National and club team data


### What we will try to find
Create attribute dependent or overall best teams
Create the fastest/slowest teams
See which areas of the world provide which attributes (like Africa : Stamina, Pace)
See which players are the best at each position
See which outfield players can play a better role at some other position
See which youngsters have attributes which can be developed

### Findings
```Python
#PLot a graph to show the potential of players to understand what is the frequency of potential
football.plot(x='Value', y='Potential', kind='bar') 
plt.show()
```

[![Indi_Project1.png](https://s7.postimg.org/dhqkrc7iz/Indi_Project1.png)](https://postimg.org/image/fmaxsf95j/)

```Python
#understand whether potential is varied with acceleration and are these features related
football1.plot(y='Acceleration', x='new_Potential', kind='bar') 
plt.show()
```

[![Indi_Project2.png](https://s7.postimg.org/lah8jday3/Indi_Project2.png)](https://postimg.org/image/m000vqbhj/)

```Python
#infer about how natianality affects the other features for example Belgium players are much better in balance then finishing the goal
football2.groupby(['Nationality']).mean()
```

[![Indi_Project3.png](https://s7.postimg.org/br7jpvd57/Indi_Project3.png)](https://postimg.org/image/wbcdocsw7/)

Further Implementation can be found in the python file with code for logistic regression algorithm.

