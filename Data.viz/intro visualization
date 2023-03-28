library(tidyverse)

## data visualization
## ggplot => grammar of graphic


## one variable, numeric
ggplot(data = mtcars, mapping = aes(x=mpg)) +
  geom_histogram(bins=10)

ggplot(data = mtcars, mapping = aes(x=mpg)) +
  geom_density()

ggplot(data = mtcars, mapping = aes(x=mpg)) +
  geom_freqpoly()

p1 <- ggplot(mtcars, aes(mpg)) +
  geom_histogram(bins=5)

p2 <- ggplot(mtcars, aes(hp)) +
  geom_histogram(bins=10)

mtcars %>%
  filter(hp <= 200) %>%
  count()

## summary table before make bar chart
mtcars <- mtcars %>%
  mutate(am = ifelse(am==0, "Auto", "Manual"))

View(mtcars)

## approach 01 - summary table + geom_col()
t2 <- mtcars %>%
  mutate(am = ifelse(am==0, "Auto", "Manual")) %>%
  count(am) 

ggplot(t2, aes(x=am, y=n)) +
  geom_col()

## approach 02 - geom_bar()
ggplot(mtcars, aes(am)) +
  geom_bar()

## two variables, numeric
## scatter plot

ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(col="red", size=5) # setting


## geom_col vs. geom_bar
## อะไรใช้กับ summary table?

## dataframe => diamonds
## ordinal factor
temp <- c("high", "med", "low", "high")
temp <- factor(temp, levels = c("low", "med", "high"), ordered = TRUE)


## categorical factor
gender <- c("m", "f", "m")
gender <- factor(gender)


glimpse(diamonds)

## frequency table
diamonds %>%
  count(cut, color, clarity)

## sample
set.seed(42)
diamonds %>%
  sample_n(5)

diamonds %>%
  sample_frac(0.1)

diamonds %>%
  slice(1:5)

## relationship (pattern)
p3 <- ggplot(diamonds %>% sample_n(500), aes(carat, price)) +
  geom_point() +
  geom_smooth(method = "loess") +
  geom_rug()

## setting vs. mapping

ggplot(diamonds, aes(price)) +
  geom_histogram(bins = 100, fill="#2585F9")

ggplot(diamonds %>% sample_n(500),
       aes(carat, price)) +
  geom_point(size=5, alpha=0.2, col="red")

ggplot(diamonds %>% sample_n(500),
       mapping = aes(carat, price, col=cut)) +
  geom_point(size=5, alpha=0.5) +
  theme_minimal()

## SETTING vs. MAPPING ???

## add label
ggplot(diamonds %>% sample_n(500),
       mapping = aes(carat, price, col=cut)) +
  geom_point(size=5, alpha=0.5) +
  theme_minimal() +
  labs(
    title = "Relationship between carat and price",
    x = "Carat",
    y = "Price USD",
    subtitle = "We found a positive relationship",
    caption = "Datasource: diamonds ggplot2"
  ) +
  scale_color_manual(values = c(
    "#546A76", "#88A0A8", "#B4CEB3", "#DBD3C9", "#FAD4D8"
  ))

ggplot(diamonds %>% sample_n(500),
       mapping = aes(carat, price, col=cut)) +
  geom_point(size=5, alpha=0.5) +
  theme_minimal() +
  labs(
    title = "Relationship between carat and price",
    x = "Carat",
    y = "Price USD",
    subtitle = "We found a positive relationship",
    caption = "Datasource: diamonds ggplot2"
  ) +
  scale_color_brewer(type="div", palette = 4)

## map color scale
p4 = ggplot(mtcars, mapping=aes(hp, mpg,col=wt)) +
  geom_point(size=5, alpha=0.7) +
  theme_minimal() +
  scale_color_gradient(low="gold", high="purple")

## facet
ggplot(diamonds %>% sample_n(5000), aes(carat, price)) +
  geom_point(alpha=0.3) +
  geom_smooth(col="red") +
  theme_minimal() +
  facet_wrap( ~cut, ncol=3)

ggplot(diamonds %>% sample_n(30000), aes(carat, price)) +
  geom_point(alpha=0.3) +
  geom_smooth(col="red") +
  theme_minimal() +
  facet_grid(cut ~ color)

## combine charts
library(patchwork)
library(ggplot2)

p1 = qplot(mpg, data=mtcars, geom="histogram", bins=10)
p2 = qplot(hp, mpg, data=mtcars, geom="point")
p3 = qplot(hp, data=mtcars, geom="density")

## quick plot
p1 + p2 + p3

(p1+p2) / p3

(p1 + p2 + p3) / p4


















