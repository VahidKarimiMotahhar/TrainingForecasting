 ___  ____  ____  ____  ____ ®
 /__    /   ____/   /   ____/      18.0
___/   /   /___/   /   /___/       SE—Standard Edition

 Statistics and Data Science       Copyright 1985-2023 StataCorp LLC
                                   StataCorp
                                   4905 Lakeway Drive
                                   College Station, Texas 77845 USA
                                   800-STATA-PC        https://www.stata.com
                                   979-696-4600        stata@stata.com

Stata license: Unlimited-user network, expiring 30 Apr 2025
Serial number: 401809303166
  Licensed to: Mohammad Hosein Tavakoli
               University of Warwick

Notes:
      1. Unicode is supported; see help unicode_advice.
      2. Maximum number of variables is set to 5,000 but can be increased; see
          help set_maxvar.
      3. New update available; type -update all-

. 
. import excel "/Users/mohota/Downloads/ReCod.xlsx", sheet("ReCod") firstrow
(39 vars, 50,161 obs)

#How does training improve individual forecasts? Modeling Differences in Compensatory and Non-Compensatory Biases in Geopolitical Forecasts
#Corresponding author’s contact details:
#First Name: Vahid 
#Surname: Karimi Motahhar
#assistant professor of marketing at sabancı university
#Email address: vahid.karimimotahhar@sabanciuniv.edu
#Affiliation postal address: Sabancı University. Orta Mahalle, 34956 Tuzla, İstanbul, Türkiye
#Co-authors’ contact details:
#First Name: Thomas 
#Middle Name: S.
#Surname: Gruca
#professor of marketing at the university of iowa
#Email address: thomas-gruca@uiowa.edu
#Affiliation postal address: 21 E Market St, Iowa City, IA 52242, USA

#This Script is used to gather numbers for the Table 2 of the manuscript. 
#Necessary amout of time to run each model is given after recording the running time of them on the above-mentioned configuration. 

Model 1:

. bayes: logit BinaryOutcome c.ForecastLogRatio if Experience == 0

#Time to run Model 1:  
#. timer list 1
#   1:     16.54 /        1 =      16.5370
   
   
   
Model 2:
Since the model has randomization, we set the seed. The coeffienents still might vary very slightly. 
. set seed 6092024

. bayes: melogit BinaryOutcome c.ForecastLogRatio || user_id: c.ForecastLogRatio

#Time to run Model 2:
#.  timer list 1
#   1:    230.09 /        1 =     230.0890


   
Model 3:

. bayes: melogit BinaryOutcome c.ForecastLogRatio##i.TrainingBinary || user_id: c.ForecastLogR
> atio

#Time to run Model 3:
#. timer list 1
#   1:    301.42 /        1 =     301.4210

   
   
Model 4: 
  
. bayes: melogit BinaryOutcome c.ForecastLogRatio##i.TrainingBinary c.ForecastLogRatio##i.year2binary || user_id: c.ForecastLogRatio

#Time to run Model 4:
#. timer list 1
#   1:    388.62 /        1 =     388.6210
   
   
   
Model 5:

. bayes: melogit BinaryOutcome c.ForecastLogRatio##i.TrainingBinary##i.year2binary if Experience == 0 || user_id
> : c.ForecastLogRatio

#Time to run Model 5:
#. timer list 1
#   1:    649.75 /        1 =     649.7470
