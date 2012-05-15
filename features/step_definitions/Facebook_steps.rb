require 'watir-webdriver'
require 'date'

browser = Watir::Browser.new :chrome

Given /^I am logged into facebook$/ do
  browser.goto 'facebook.com'
  browser.text_field(:id => 'email').set 'atestytesterguy@gmail.com'
  browser.text_field(:id => 'pass').set 'justtesting'
  browser.label(:id => 'loginbutton').button.click
end

When /^I update my status$/ do
  @message = "status update as of: #{DateTime.now}"
  browser.link(:text => 'Home').click
  browser.textarea(:name => 'xhpc_message').fire_event 'onfocus'
  browser.textarea(:name => 'xhpc_message_text').when_present.set @message
  sleep 0.5 #need better sync here, have to break down how to tell it's ready
  browser.div(:id => "uiComposerMessageBoxControls").when_present.button.click
  #wait for a status update
  Watir::Wait.until {browser.div(:class => 'mainWrapper').span(:class => 'uiStreamSource', :index => 0).text.include? "seconds ago"}
end

Then /^a status update should be posted$/ do
  browser.div(:class => 'mainWrapper').div(:class => 'actorName', :index => 0).link.text.should == "Atesty Testerguy"
  browser.div(:class => 'mainWrapper').span(:class => 'messageBody', :index => 0).text.should == @message
end