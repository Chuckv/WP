I'm starting this out fairly simple and will add cucumber and then add 
page objects a tiny bit later as time permits.

To run the whole works you will need:
 1) a current version of ruby
 2) the following gems: Watir-webdriver, Cucumber, Rspec, (and soon:) Page-object
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

The second example is a cucumber feature file (in the features directory) and 
accompaning steps in a step definition file.  To run this all you need to do
is be at a command line in the main directory for this project ('wp' on my 
system) and run 'cucumber' 

This is a pretty basic example of using cucumber, and there's a number of 
things that would be 'dried out' in a real example where we might for example 
have a lot of scenarios that all require a logged in user, so we would move 
that into a 'background' section at the top of the feature file.  We might 
also need a lot of test objects that we want to pass around where we want to 
be sure that they are initialized properly etc.  Cucumber makes that pretty 
easy to do as well.
