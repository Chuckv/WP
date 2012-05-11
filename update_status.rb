require 'watir-webdriver'
require 'date'

browser = Watir::Browser.new :chrome

message = "status update as of: #{DateTime.now}"

browser.goto 'facebook.com'
browser.text_field(:id => 'email').set 'atestytesterguy@gmail.com'
browser.text_field(:id => 'pass').set 'justtesting'
 # there is an ID value on the button below but it looks dynamic..
browser.label(:id => 'loginbutton').button.click
browser.link(:text => 'Home').click
browser.textarea(:name => 'xhpc_message').fire_event 'onfocus'
browser.textarea(:name => 'xhpc_message_text').when_present.set message
sleep 0.2 #hate fixed sleeps but this control needs time to respond to input
browser.div(:id => "uiComposerMessageBoxControls").when_present.button.click
#sync
Watir::Wait.until {browser.div(:class => 'mainWrapper').span(:class => 'uiStreamSource', :index => 0).text.include? "seconds ago"}
#validation 
if browser.div(:class => 'mainWrapper').div(:class => 'actorName', :index => 0).link.text == "Atesty Testerguy"
  puts 'my username is top posting'
else
  puts 'my name is not at the top of the list of postings'
end
if browser.div(:class => 'mainWrapper').span(:class => 'messageBody', :index => 0).text == message
  puts "messsage appears at top of stream"
else
  puts "status update posting not found at top of list"
end

#logout
browser.link(:id => 'navAccountLink').click
browser.label(:class => 'logoutButton').when_present.button.click
browser.window.close