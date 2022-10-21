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
    1. placeorder (Int + Doub) shows orderconf correctly
    2. placeorder (Int + Doub) shows orderplaced status correctly false
    3. placeorder (Int + Doub) shows orderplaced status correctly true
    4. sendconf (Unit) returns error if order not placed
    5. sendconf (Int + Doub) sends text with correct body
    6. viewconf (Int + Doub) shows receipt of what ordered
    7. viewconf (Unit) returns error if not placed
    8. viewconf (Int + Doub) returns receipt

    Ordering class
    1. viewchoices (Unit) shows @choices as a blank when nothing input
    2. viewmenu (Int + Doub) shows @menuhash
    3. selectitems (Int + Doub) shows @choices populated with 1 items use viewchoices
    4. selectitems (Int + Doub) shows @choices populated with 2 items use viewchoices
    5. interface (Int + Doub) give messages to and show calls methods correctly, 1: selectitem x2 and viewchoices
    6. interface (Int + Doub) give messages to and show calls methods correctly, 2: viewmenu
    7. interface (Int + Doub) give messages to and show calls methods correctly, 3: Checkout.placeorder works
    







