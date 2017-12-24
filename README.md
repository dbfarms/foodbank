Hello, this is Matt Hunger's MVC project.

My plan is put together an association between farms and foodbanks in terms of 
their respective availability to drive (for farmers) and to accept food (for 
foodbanks). There appear to be a number of ways to express this relationship. 

My current model will have:

Farms have names 
Foodbanks have names
Days have names and foodbank_id for days whe foodbank is open

Farms have many days and through days foodbanks 
foodbanks have many days and through days farms they receive from 
days belong to farms and they belong to food banks 