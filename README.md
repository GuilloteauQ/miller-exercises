# Miller Exercises

This repository contains some small exercises to learn the [Miller (`mlr`) tool](https://github.com/johnkerl/miller).

The data comes from the [RGriffin Kaggle dataset: 120 years of Olympic history](https://www.kaggle.com/datasets/heesoo37/120-years-of-olympic-history-athletes-and-results/)

You can download the data as such:

```
wget https://raw.githubusercontent.com/GuilloteauQ/miller-exercises/main/olympics.csv
```


## Exercise 1

Display the first few rows of the CSV in the pretty-print format

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --icsv --opprint head olympics.csv
  ```

</details>

## Exercise 2

Display only the rows for the Summer Olympics.

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --icsv --opprint filter '$season == "Summer"' then head olympics.csv
  ```

</details>

## Exercise 3

Display only the names of the athletes who won a medal at the Summer Olympics.

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --icsv --opprint filter '$season == "Summer" && $medal != "NA"' then cut -f name then head olympics.csv
  ```

</details>

## Exercise 4

Display only the names of the athletes who won a medal at the Summer Olympics, without any duplicate

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --icsv --opprint filter '$season == "Summer" && $medal != "NA"' then uniq -f name then head olympics.csv
  ```

</details>

## Exercise 5

What is the number of unique athletes who won at least one medal at the Summer Olympics?

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --icsv --opprint filter '$season == "Summer" && $medal != "NA"' then uniq -f name then count olympics.csv
  ```

</details>


## Exercise 6

Who are the 10 athletes with the most medals at the Summer Olympics?

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --icsv --opprint filter '$season == "Summer" && $medal != "NA"' then most-frequent -f name olympics.csv
  ```

</details>

## Exercise 7

Who was the oldest and the youngest athlete to compete in any Olympic?

<details>
  <summary>Solution</summary>
  
  
  ```
  # oldest
  mlr --icsv --opprint filter '$age != "NA"' then top -f age -a olympics.csv

  # youngest  
  mlr --icsv --opprint filter '$age != "NA"' then top -f age -a --min olympics.csv
  ```

</details>

## Exercise 8

What are the top 10 teams with the most medals in any Olympic?

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --icsv --opprint filter '$medal != "NA"' then most-frequent -f team olympics.csv
  ```

</details>

## Exercise 9

What is the average number of medals per year for each team?

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --icsv --opprint filter '$medal != "NA"' then stats1 -a count -f medal -g team,year then stats1 -a mean -f medal_count -g team then sort -nr medal_count_mean then head olympics.csv
  ```

</details>

## Exercise 10

In which Summer Olympic edition did France won the most medals?

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --icsv --opprint filter '$medal != "NA" && $season == "Summer" && $team == "France"' then stats1 -a count -f medal -g year then top -f medal_count -a olympics.csv
  ```

</details>

## Exercise 11

For each team, what is the number of Gold, Silver, and Bronze medals?

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --icsv --opprint filter '$medal != "NA"' then cut -f team,medal then stats1 -a count -f medal -g team,medal then reshape -s medal,medal_count then unsparsify then head olympics.csv
  ```

</details>


## Exercise 12

How many Judo athletes were present at the 2012 Summer Olympics?

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --c2p filter '$sport == "Judo" && $year == 2012' then uniq -f name -n  olympics.csv
  ```

</details>

## Exercise 13

Who are the 10 athletes with the most participations to any Olympic event (there could be several event per Olympics)?

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --c2p stats1 -a count -f name -g name then top -f name_count -n 10 -a olympics.csv
  ```

</details>

## Exercise 14

Who is the athlete with the most participations in a single Olympic, and in which year?

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --c2p stats1 -a count -f name -g name,year then top -f name_count -a olympics.csv
  ```

</details>

## Exercise 15

Who is the athlete who participated to the most Olympic editions, and how many editions did they participate to?

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --c2p uniq -g name,year then stats1 -a count -f name -g name then top -a -f name_count olympics.csv
  ```

</details>

## Exercise 16

Which cities hosted several times the Olympics?

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --c2p --from olympics.csv uniq -f city,year then count -g city then filter '$count > 1'
  ```

</details>
