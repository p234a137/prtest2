
# read files
cumulative = read.csv("catted_files/cumulative_statistics.csv", header=TRUE)
playoff = read.csv('catted_files/playoff.csv', header = TRUE)
preseason = read.csv('catted_files/preseason.csv', header = TRUE)
regular = read.csv('catted_files//regular.csv', header = TRUE)

# 
summary(regular$Home.Score)
summary(regular$Visitor.Score)

# Home.Wins 
regular$Home.Wins = regular$Home.Score - regular$Visitor.Score
# In general the Home.Score is better than Visitor.Score
hist(regular$Home.Wins, breaks = 30)
# some (statistical?) fluctuations, have the impression that there are 2 (or more)
# overlapping distributions
hist(regular$Home.Wins, breaks = 200) 

# null hypothesis:
# mean smaller or equal to zero
# hypothesis:
# mean larger than zero

#
m1 = mean(regular$Home.Wins)
s1 = sd(regular$Home.Wins)
n1 = length(regular$Home.Wins)
confidence_level = 0.05
#
z = (m1 - 0.) / (s1/sqrt(n1))
z_alpha = qnorm(1-confidence_level)
#
pval = pnorm(z, lower.tail = FALSE)
print(pval)
# 1.99e-65 !

