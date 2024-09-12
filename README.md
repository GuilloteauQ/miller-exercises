# Miller Exercises

This repository contains exercises to learn the [Miller (`mlr`) tool](https://github.com/johnkerl/miller).
It is inspired by [Ben Porter's Awk Course](https://github.com/FreedomBen/awk-hack-the-planet).

The exercises are focused for a data analysis workload involving CSVs.

You would like to add new exercises?
You think the Miller solutions could be improved?
**Feel free to contribute!**


## Getting the data

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

  [`head`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#head)

  Output:
  
  ```
id name                     sex age height weight team           noc games       year season city        sport         event                              medal
1  A Dijiang                M   24  180    80     China          CHN 1992 Summer 1992 Summer Barcelona   Basketball    Basketball Men's Basketball        NA
2  A Lamusi                 M   23  170    60     China          CHN 2012 Summer 2012 Summer London      Judo          Judo Men's Extra-Lightweight       NA
3  Gunnar Nielsen Aaby      M   24  NA     NA     Denmark        DEN 1920 Summer 1920 Summer Antwerpen   Football      Football Men's Football            NA
4  Edgar Lindenau Aabye     M   34  NA     NA     Denmark/Sweden DEN 1900 Summer 1900 Summer Paris       Tug-Of-War    Tug-Of-War Men's Tug-Of-War        Gold
5  Christine Jacoba Aaftink F   21  185    82     Netherlands    NED 1988 Winter 1988 Winter Calgary     Speed Skating Speed Skating Women's 500 metres   NA
5  Christine Jacoba Aaftink F   21  185    82     Netherlands    NED 1988 Winter 1988 Winter Calgary     Speed Skating Speed Skating Women's 1,000 metres NA
5  Christine Jacoba Aaftink F   25  185    82     Netherlands    NED 1992 Winter 1992 Winter Albertville Speed Skating Speed Skating Women's 500 metres   NA
5  Christine Jacoba Aaftink F   25  185    82     Netherlands    NED 1992 Winter 1992 Winter Albertville Speed Skating Speed Skating Women's 1,000 metres NA
5  Christine Jacoba Aaftink F   27  185    82     Netherlands    NED 1994 Winter 1994 Winter Lillehammer Speed Skating Speed Skating Women's 500 metres   NA
5  Christine Jacoba Aaftink F   27  185    82     Netherlands    NED 1994 Winter 1994 Winter Lillehammer Speed Skating Speed Skating Women's 1,000 metres NA
  ```

</details>

## Exercise 2

Display only the rows for the Summer Olympics.

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --icsv --opprint filter '$season == "Summer"' then head olympics.csv
  ```

  [`filter`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#filter)

  Output:
  
  ```
id name                               sex age height weight team           noc games       year season city        sport      event                                  medal
1  A Dijiang                          M   24  180    80     China          CHN 1992 Summer 1992 Summer Barcelona   Basketball Basketball Men's Basketball            NA
2  A Lamusi                           M   23  170    60     China          CHN 2012 Summer 2012 Summer London      Judo       Judo Men's Extra-Lightweight           NA
3  Gunnar Nielsen Aaby                M   24  NA     NA     Denmark        DEN 1920 Summer 1920 Summer Antwerpen   Football   Football Men's Football                NA
4  Edgar Lindenau Aabye               M   34  NA     NA     Denmark/Sweden DEN 1900 Summer 1900 Summer Paris       Tug-Of-War Tug-Of-War Men's Tug-Of-War            Gold
8  Cornelia "Cor" Aalten (-Strannood) F   18  168    NA     Netherlands    NED 1932 Summer 1932 Summer Los Angeles Athletics  Athletics Women's 100 metres           NA
8  Cornelia "Cor" Aalten (-Strannood) F   18  168    NA     Netherlands    NED 1932 Summer 1932 Summer Los Angeles Athletics  Athletics Women's 4 x 100 metres Relay NA
10 Einar Ferdinand "Einari" Aalto     M   26  NA     NA     Finland        FIN 1952 Summer 1952 Summer Helsinki    Swimming   Swimming Men's 400 metres Freestyle    NA
12 Jyri Tapani Aalto                  M   31  172    70     Finland        FIN 2000 Summer 2000 Summer Sydney      Badminton  Badminton Men's Singles                NA
13 Minna Maarit Aalto                 F   30  159    55.5   Finland        FIN 1996 Summer 1996 Summer Atlanta     Sailing    Sailing Women's Windsurfer             NA
13 Minna Maarit Aalto                 F   34  159    55.5   Finland        FIN 2000 Summer 2000 Summer Sydney      Sailing    Sailing Women's Windsurfer             NA
  ```

</details>

## Exercise 3

Display only the names of the athletes who won a medal at the Summer Olympics.

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --icsv --opprint filter '$season == "Summer" && $medal != "NA"' then cut -f name then head olympics.csv
  ```

  - [`filter`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#filter)

  - [`cut`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#cut)

  Output:
  
  ```
name
Edgar Lindenau Aabye
Arvo Ossian Aaltonen
Arvo Ossian Aaltonen
Paavo Johannes Aaltonen
Paavo Johannes Aaltonen
Paavo Johannes Aaltonen
Paavo Johannes Aaltonen
Paavo Johannes Aaltonen
Ragnhild Margrethe Aamodt
Alf Lied Aanning
  ```

</details>

## Exercise 4

Display only the names of the athletes who won a medal at the Summer Olympics, without any duplicate

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --icsv --opprint filter '$season == "Summer" && $medal != "NA"' then uniq -f name then head olympics.csv
  ```

  - [`filter`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#filter)

  - [`uniq`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#uniq)

  Output:
  
  ```
name
Edgar Lindenau Aabye
Arvo Ossian Aaltonen
Paavo Johannes Aaltonen
Ragnhild Margrethe Aamodt
Alf Lied Aanning
Willemien Aardenburg
Pepijn Aardewijn
Ann Kristin Aarnes
Karl Jan Aas
Thomas Valentin Aas
  ```

</details>

## Exercise 5

What is the number of unique athletes who won at least one medal at the Summer Olympics?

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --icsv --opprint filter '$season == "Summer" && $medal != "NA"' then uniq -f name then count olympics.csv
  ```

  - [`filter`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#filter)

  - [`uniq`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#uniq)

  - [`count`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#count)

  Output:
  
  ```
count
24545
  ```

</details>


## Exercise 6

Who are the 10 athletes with the most medals at the Summer Olympics?

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --icsv --opprint filter '$season == "Summer" && $medal != "NA"' then most-frequent -f name olympics.csv
  ```

  - [`filter`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#filter)

  - [`most-frequent`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#most-frequent)

  Output:
  
  
  ```
name                                            count
Michael Fred Phelps, II                         28
Larysa Semenivna Latynina (Diriy-)              18
Nikolay Yefimovich Andrianov                    15
Borys Anfiyanovych Shakhlin                     13
Edoardo Mangiarotti                             13
Takashi Ono                                     13
Natalie Anne Coughlin (-Hall)                   12
Birgit Fischer-Schmidt                          12
Jennifer Elisabeth "Jenny" Thompson (-Cumpelik) 12
Paavo Johannes Nurmi                            12
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

  - [`filter`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#filter)

  - [`top`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#top)

  Output:
  
  
  ```
  # oldest
id     name                   sex age height weight team          noc games       year season city      sport            event                                       medal
128719 John Quincy Adams Ward M   97  NA     NA     United States USA 1928 Summer 1928 Summer Amsterdam Art Competitions Art Competitions Mixed Sculpturing, Statues NA

  # youngest  
id    name               sex age height weight team                          noc games       year season city   sport      event                                 medal
71691 Dimitrios Loundras M   10  NA     NA     Ethnikos Gymnastikos Syllogos GRE 1896 Summer 1896 Summer Athina Gymnastics Gymnastics Men's Parallel Bars, Teams Bronze
  ```

</details>

## Exercise 8

What are the top 10 teams with the most medals in any Olympic?

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --icsv --opprint filter '$medal != "NA"' then most-frequent -f team olympics.csv
  ```

  - [`filter`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#filter)

  - [`most-frequent`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#most-frequent)

  Output:
  
  
  ```
team          count
United States 5219
Soviet Union  2451
Germany       1984
Great Britain 1673
France        1550
Italy         1527
Sweden        1434
Australia     1306
Canada        1243
Hungary       1127
  ```

</details>

## Exercise 9

What is the average number of medals per year for each team?

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --icsv --opprint filter '$medal != "NA"' then stats1 -a count -f medal -g team,year then stats1 -a mean -f medal_count -g team then sort -nr medal_count_mean then head olympics.csv
  ```

  - [`filter`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#filter)

  - [`stats1`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#stats1)

  - [`sort`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#sort)

  Output:
  
  ```
team          medal_count_mean
Unified Team  271
Soviet Union  245.1
East Germany  156.83333333333334
United States 149.11428571428573
West Germany  93
Russia        79.28571428571429
Germany       76.3076923076923
China         60.06666666666667
Great Britain 47.8
Italy         46.27272727272727
  ```

</details>

## Exercise 10

In which Summer Olympic edition did France won the most medals?

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --icsv --opprint filter '$medal != "NA" && $season == "Summer" && $team == "France"' then stats1 -a count -f medal -g year then top -f medal_count -a olympics.csv
  ```

  - [`filter`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#filter)

  - [`stats1`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#stats1)

  - [`top`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#top)

  Output:
  
  ```
year medal_count
1920 134
  ```

</details>

## Exercise 11

For each team, what is the number of Gold, Silver, and Bronze medals?

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --icsv --opprint filter '$medal != "NA"' \
                  then cut -f team,medal \
                  then stats1 -a count -f medal -g team,medal \
                  then reshape -s medal,medal_count \
                  then unsparsify \
                  then head olympics.csv
  ```

  - [`filter`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#filter)

  - [`stats1`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#stats1)

  - [`reshape`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#reshape)

  - [`unsparsify`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#unsparsify)

  Output:
  
  
  ```
team           Gold Bronze Silver
Denmark/Sweden 6    -      -
Finland        198  415    263
Norway         299  281    330
Netherlands    277  390    321
Taifun         5    -      -
France         455  577    518
Italy          535  484    508
Spain          108  136    239
Azerbaijan     7    25     12
Russia         366  393    351
  ```

</details>


## Exercise 12

How many Judo athletes were present at the 2012 Summer Olympics?

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --c2p filter '$sport == "Judo" && $year == 2012' then uniq -f name -n  olympics.csv
  ```

  - [`filter`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#filter)

  - [`uniq`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#uniq)

  Output:
  
  
  ```
count
384
  ```

</details>

## Exercise 13

Who are the 10 athletes with the most participations to any Olympic event (there could be several event per Olympics)?

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --c2p stats1 -a count -f name -g name then top -f name_count -n 10 -a olympics.csv
  ```

  - [`stats1`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#stats1)

  - [`top`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#top)

  Output:
  
  ```
name                             name_count
Robert Tait McKenzie             58
Heikki Ilmari Savolainen         39
Joseph "Josy" Stoffel            38
Ioannis Theofilakis              36
Takashi Ono                      33
Alexandros Theofilakis           32
Andreas Wecker                   32
Jean Lucien Nicolas Jacoby       32
Alfrd (Arnold-) Hajs (Guttmann-) 32
Johann "Hans" Sauter             31
  ```

</details>

## Exercise 14

Who is the athlete with the most participations in a single Olympic, and in which year?

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --c2p stats1 -a count -f name -g name,year then top -f name_count -a olympics.csv
  ```

  - [`stats1`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#stats1)

  - [`top`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#top)

  Output:
  
  ```
name                 year name_count
Robert Tait McKenzie 1932 44
  ```

</details>

## Exercise 15

Who is the athlete who participated to the most Olympic editions, and how many editions did they participate to?

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --c2p uniq -g name,year \
      then stats1 -a count -f name -g name \
      then top -a -f name_count olympics.csv
  ```

  - [`uniq`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#uniq)

  - [`stats1`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#stats1)

  - [`top`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#top)

  Output:
  
  ```
name       name_count
Ian Millar 10
  ```

</details>

## Exercise 16

Which cities hosted several times the Olympics?

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --c2p --from olympics.csv uniq -f city,year \
                           then count -g city \
                           then filter '$count > 1'
  ```

  - [`uniq`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#uniq)

  - [`count`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#count)

  - [`filter`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#filter)

  Output:
  
  
  ```
city         count
London       3
Paris        2
Los Angeles  2
Lake Placid  2
Stockholm    2
Athina       3
Innsbruck    2
Sankt Moritz 2
  ```

</details>


## Exercise 17

Which Olympics had the highest proportion of female athletes?

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --c2p --from olympics.csv uniq -g id,year,sex \
                         then stats1 -a count -f sex -g year,sex \
                         then reshape -s sex,sex_count \
                         then unsparsify \
                         then put '$percentF = 100 * $F / ($F + $M)' \
                         then cut -f year,percentF\
                         then top -f percentF -n 10 -a
  ```

  - [`uniq`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#uniq)

  - [`reshape`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#reshape)

  - [`unsparsify`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#unsparsify)

  - [`put`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#put)

  - [`cut`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#cut)

  - [`top`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#top)


  Output:
  
  
  ```
year percentF
2016 45.03086143662224
2012 44.25216316440049
2008 42.288283328745756
2010 40.73343848580441
2004 40.73126835275173
2014 40.145719489981786
2006 38.291900561347234
2000 38.20794590025359
2002 36.93205502292622
1998 36.209270307480494
  ```

</details>

## Exercise 18

How many people with the first name "Quentin" won an Olympic medal?

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --c2p --from olympics.csv filter "$name =~ "^Quentin" && $medal != "NA"' then count
  ```

  - [`filter`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#filter)

  - [`count`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#count)

  Output:
  
  
  ```
count
0
  ```

  sad...

</details>


## Exercise 19

Print the cumulative number of medals per year that Michael Phelps (`Michael Fred Phelps, II`) won during his Olympic carrer.

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --c2p --from olympics.csv filter '$name == "Michael Fred Phelps, II"' then \
                                put '$had_medal = ($medal != "NA") ? 1 : 0' then \
                                stats1 -a sum -f had_medal -g year then \
                                step -a rsum -f had_medal_sum
  ```

  - [`filter`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#filter)

  - [`put`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#put)

  - [`?:`](https://miller.readthedocs.io/en/6.12.0/reference-dsl-builtin-functions/index.html#_28)

  - [`stats1`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#stats1)

  - [`step`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#step)



  Output:
  
  
  ```
year had_medal_sum had_medal_sum_rsum
2000 0             0
2004 8             8
2008 8             16
2012 6             22
2016 6             28
  ```

</details>


## Exercise 20

What is the age, height, and weight of the average Olympian and of the median Olympian?

<details>
  <summary>Solution</summary>
  
  
  ```
  mlr --c2p --from olympics.csv cut -f age,height,weight then\
                                filter '$age != "NA" && $height != "NA" && $weight != "NA"' then\
                                summary -a mean,median
  ```

  - [`cut`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#cut)

  - [`filter`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#filter)

  - [`summary`](https://miller.readthedocs.io/en/6.12.0/reference-verbs/index.html#summary)



  Output:
  
  
  ```
field_name mean               median
age        25.055508937016466 24
height     175.3719496519778  175
weight     70.68833701161691  70
  ```

</details>
