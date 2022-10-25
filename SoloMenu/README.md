Solo Project 1 readme

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

Use the twilio-ruby gem to implement this next one. You will need to use doubles too.

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

Please see accompanying drawio file for a visual representation of classes


###########
Make sure to use .gitignore for a file containg the twilio api key!!!!!!
###########

Tests/Implementations


TESTS: 
    Menu class
    1. Add (Int + Doub). Use Ordering.viewmenu to verify
    2. Remove (Int + Doub). Use Ordering.viewmenu to verify

    Checkout class
    3. placeorder (Int + Doub) shows orderconf correctly use viewconf
    4. placeorder (Int + Doub) shows orderplaced status correctly false
    5. placeorder (Int + Doub) shows orderplaced status correctly true
    6. sendconf (Unit) returns error if order not placed
    8. orderconf (Int + Doub) shows blank receipt of what ordered if checkout not activated
    9. orderconf (Int + Doub) shows correct receipt of what ordered if checkout activated
    TODO 7. sendconf (Int + Doub) sends text with correct body
    

    Ordering class
    11. viewchoices (Unit) shows @choices as a blank when nothing input
    12. viewmenu (Int + Doub) shows @menuhash
    13. selectitems (Int + Doub) shows @choices populated with 1 items use viewchoices
    14. selectitems (Int + Doub) shows @choices populated with 2 items use viewchoices
    
    15. interface (Doub) give messages to and show calls methods correctly, 1: see menu + exit
    16. interface (Doub) give messages to and show calls methods correctly, selectitem x2 and see basket + checkout
    17. interface (Doub) give messages to and show calls methods correctly, selectitem x1 incorrect, view empty basket, checkout fail, exit







