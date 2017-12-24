Hello, this is Matt Hunger's MVC project.

My plan is put together an association between farms and foodbanks in terms of 
their respective availability to drive (for farmers) and to accept food (for 
foodbanks). There appear to be a number of ways to express this relationship. 

My current model will have:

Farms have names... they have many days / has_many :foodbanks, through: :days  
Foodbanks have names ...   have many :days_banks /has_many :days, through: :days_banks 
  has_many :farmers, through: :days 
Days have names ... they belong to farmers, have many days_banks (join table) 
and have many foodbanks through the join table 

The idea is for a farmer (The user) to add days when they can deliver food, which will be more dynamic than when
a foodbank accepts deliveries (which tend to fixed/static). 

In a future version of the program I'd like better calendar functionality and I would have a superuser 
that would be able to add/delete  farmers and/or foodbanks. Farmers would add what produce is available
and how long those seconds (i.e. imperfect food that is donated) will last in the walk-in before it rots
in order to facilitate meaningful delivery 