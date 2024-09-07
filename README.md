# Miller Exercises


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
