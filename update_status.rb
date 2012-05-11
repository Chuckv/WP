require 'watir-webdriver'

browser = Watir::Browser.new :chrome

browser.goto 'facebook.com'
browser.text_field(:id => 'email').set 'atestytesterguy@gmail.com'
browser.text_field(:id => 'pass').set 'justtesting'
 # there is an ID value on the button below but it looks dynamic..
browser.label(:id => 'loginbutton').button.click
browser.link(:text => 'Home').click
browser.textarea(:name => 'xhpc_message').fire_event 'onfocus'
browser.textarea(:name => 'xhpc_message').set 'busy writing test automation proof of concept against the facebook UI'
browser.div(:id => "uiComposerMessageBoxControls").button.when_present.click
# need to add validation here
# check that top actor name is me
# check that content of post matches expected
# check for 'just now' posting

#logout
browser.link(:id => 'navAccountLink').click
browser.label(:class => 'logoutButton').button.click
browser.close