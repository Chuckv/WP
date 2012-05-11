I'm starting this out fairly simple and will add cucumber and then add 
page objects a tiny bit later as time permits.

To run the whole works you will need:
 1) a current version of ruby
 2) the following gems: Watir-webdriver, (and soon:) Cucumber, Page-object
 3) Chrome (or change the browser setting in the code before running)
 4) chromedriver (get it from http://code.google.com/p/chromedriver/downloads/list)
    located somewhere on your path
    
    
 
The first example "update_status.rb" is pure quick and dirty coding, no 
framework, just a simple ruby script that uses Watir-Webdriver and will do the 
desired automation.  It logs in, makes a posting with the current timestamp in
it, waits to see 'a few seconds ago' at the top of the posting list, and
validates that the right data is present in the top posting.

It contains one fixed sleep which I hate, but their UI does not have many easy
ways to sync and see that any ajax or client side code is done, and the input
area exhibited occasional problems where it only got part of the posting if
the post button was clicked immediately after the text was sent to the text
area.
