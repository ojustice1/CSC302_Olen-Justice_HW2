#1. Run the following lines and study how they work. Then state what they do and output for us

#Creates df1 with 3 columns (Name, State, Sales) and inserts the data for each column
df1=data.frame(Name=c('James','Paul','Richards','Marico','Samantha','Ravi','Raghu',
                      'Richards','George','Ema','Samantha','Catherine'),
               State=c('Alaska','California','Texas','North Carolina','California','Texas',
                       'Alaska','Texas','North Carolina','Alaska','California','Texas'),
               Sales=c(14,24,31,12,13,7,9,31,18,16,18,14))

#Totals all the sales from each State and prints a list organized by State
aggregate(df1$Sales, by=list(df1$State), FUN=sum)

#Imports special functions from dplyr
library(dplyr)

#Totals all the sales by state and prints out in 2 columns. 1 column for the grouped by and 1 column that is named in the summarise function. 
df1 %>% group_by(State) %>% summarise(sum_sales = sum(Sales))



#2. Use R to read the WorldCupMatches.csv from the DATA folder on Google Drive. Then perform the followings (48

medals=read.csv("G:/My Drive/WorldCupMatches.csv", header = T)

#(a) Find the size of the data frame. How many rows, how many columns?
dim(medals)

#(b) Use summary function to report the statistical summary of your data.
summary(medals)

#(c) Find how many unique locations olympics were held at.
length(unique(medals$City))

#(d) Find the average attendance.
mean(medals$Attendance, na.rm = T)

#(e) For each Home Team, what is the total number of goals scored? (Hint: Please refer to question 1)
library(dplyr)
medals %>%  group_by(Home.Team.Name) %>% summarise(Goal.Totals = sum(Home.Team.Goals))

#(f) What is the average number of attendees for each year? 
aggregate(medals$Attendance, by=list(medals$Year), FUN=mean)



#3. Use R to read the metabolites.csv from the DATA folder on Google Drive. Then perform the followings (32 points):
df=read.csv("G:/My Drive/metabolite.csv", header = T)

#(a) Find how many Alzheimers patients there are in the data set. (Hint: Please refer to question 1)
sum(df$Label == "Alzheimer")

#(b) Determine the number of missing values for each column. (Hint: is.na( ) 
colSums(is.na(df))

#c) Remove the rows which has missing value for the Dopamine column and assign the result to a new data frame.
df2 <- df %>% drop_na(Dopamine)

#(d) In the new data frame, replace the missing values in the c4-OH-Pro column with the median value of the same
#column. (Hint: there is median( ) function.)
df2$c4.OH.Pro[is.na(df2$c4.OH.Pro)] <- median(df2$c4.OH.Pro, na.rm = TRUE)


#(e) (Optional) Drop columns which have more than 25% missing values.
df3 <- df2 %>% purrr::discard(~sum(is.na(.x))/length(.x)* 100 >=25)
