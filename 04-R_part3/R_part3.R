
###################### 
# RA tutorial / week 4
######################

##### preparation: install and load packages

# install the package `tidyverse`
# the tidyverse package installs a number of packages that will be useful for tidying (dplyr, tidyr, etc.)
# you can read more here: https://tidyverse.tidyverse.org/
# by loading it, you can load all packages at once
install.packages('tidyverse')

# install the package `ggplot2`


# load both the tidyverse and ggplot2 pacakges



##### section 1: tidy & non-tidy data

# first, let's take a look at some not-so-tidy data
# this data is built into the tidyverse package
# and shows the number of tuberculosis cases between 1999 and 2000
# in a select number of countries, as documented by the WHO
# it includes several tables (table1, table2, table3, table4a, table 4b, table5)
# which present the data in a different layout

# we will start with table2. here we save it to an R-object:
table2 <- table2

# preview the data
head(table2)

# how could we make this data "tidy"?
# introducing the spread() function
?spread

# use the spread() function to transform the data from "long" to "wide"
# such that each country is a single observation (row)



# what if we wanted to go in the reverse direction
# in other words, to generate the not-so-tidy data
# introducing the gather() function
?gather

# use the gather() function to transform the data from "wide" to "long"




##### section 2: loading data & review of dplyr functions

# first, load some data to plot
# we will load the `swiss` dataframe, which contains information about 
# socioeconomic and fertility indicators of swiss provinces in 1888
data(swiss)
?swiss # displays a description of the dataset and variables

# preview the first 10 rows of the data


# get a summary of the data



# check whether there are any NAs in the data


# create a new variable, `Province`, consisting of the province name for each observation
# hint: right now these are stored as the row names


# use dplyr functions to do a few things:
# (a) create a new factor variable, `Education_Level`, with two levels (`high` or `low`),
# indicating whether the % of education beyond primary school among draftees (Education) 
# is high (>= mean Education) or low (< mean Education)

# (b) create a new factor variable, `Agriculture_Level`, with two levels (`high` or `low`),
# indicating whether the % of males involved in agriculture as an occupation (Agriculture) is high (>= 50%) or low (< 50%)





# use the summarize() function to summarize the data 
# calculate the mean fertility by Education_Level (call the resulting summary variable 'Fertility')
# call the new dataframe `swiss_summary_edu`

  
  

# use the summarize() function to summarize the data once more
# calculate the mean fertility by two variables, Education_Level and Agriculture_Level
# call the new dataframe `swiss_summary_edu_agr`

  


##### section 3: creating our first dot plot

# now we will use ggplot2 to plot various aspects of the `swiss` data
# first, let's make a very basic dot plot
# showing fertility for each province based on its education level
# (i.e. NOT the summarized data)





# now copy the code from the last step and create a new plot, changing the axis labels and title



  
# now copy the code from the last step and create a new plot, 
# coloring the points according to agriculture level



# now copy the code from the last step and create a new plot,
# making the points larger and centering them around each x-axis level



# now create the plot one last time, adding a theme (choose the theme you like best)
# and save the final plot as an R-object, `mydotplot`




##### section 4: creating a barplot with a dotplot layer

# next, let's make a barplot
# showing the same thing: fertility based on education level and then agriculture level
# and then also put the dots representing the individual data points on top
# this time, we want the bars to indicate the mean fertility for each education level
# so our code need to change a little
# specifically, we can use the summary dataframes we created earlier since they contain the mean values

# create a basic barplot of mean fertility by education level, coloring the bars by agriculture level




# now copy the code from the last step and create a new plot,
# making the bars more translucent
# and add the individual data points from the `swiss` dataframe as circular points on top of the bars
# save the last plot as an R-object, `mybarplot`




##### section 5: creating a boxplot and using facets

# create a boxplot of infant mortality by agriculture level
# add relevant axis labels, a title, and color the boxplots according to agriculture level




# now copy the code from the last step and create a new plot,
# creating a similar boxplot for each level of education




##### section 6: regression lines & a few miscellaneous pieces

# for this part, create a scatterplot of infant mortality (y) vs. agriculture (x)
# color the points according to education level, and
# use appropriate axis labels, give the plot a title, and choose a theme




# now copy the code from the last step and create a new plot,
# adding a linear regression line for each education level




