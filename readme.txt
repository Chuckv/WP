I'm starting this out fairly simple and will add page objects a tiny bit 
later as time permits.

To run you will need
 1) a current version of ruby
 2) the following gems: Watir-webdriver, Cucumber, (and soon) Page-object
 3) Chrome (or change the browser setting)
 4) chromedriver (get it from http://code.google.com/p/chromedriver/downloads/list)
    located somewhere on your path
 
The first example "update_status.rb" is pure quick and dirty coding, no 
framework, just a simple ruby script that uses cucumber and will do the 
desired automation.  It is still being refined, I need to resolve some timing
problems (things work from IRB, but not at scripting speed), randomize the 
posting data so facebooks duplicate post logic is appeased, and I can more
easily validate a given posting was made.
