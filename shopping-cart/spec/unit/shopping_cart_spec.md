#happy path
``` 
Feature: My cart
  As a user 
  I want to be able to add, remove items to my cart, or change the quantity of a item.
  So that i can see them in my cart.

Scenario: Add item
  Given an item
  And a quantity of the item
  When i add item and quantity to my cart
  Then i should see them in my cart
```
#sad path
```
Scenario: add an item with lack of stock
  Given an item
  and a quantity of the item
  when i add the item and quantity to my cart
  then i should receive a alert saying that isn´t enough stock of the item.
```
#bad path
```
Scenario: add the an item with a very big quantity
  Given an item
  and a quantity of 1_000_000_000
  when i add the item and the quantity to my cart
  then i should receive a warning saying that there is an error with the quantity inserted.
```



