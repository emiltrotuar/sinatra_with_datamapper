Given (/^a user visits the "([^"]*)" page$/) do |page|
	visit "/#{page}"
end

And (/^account he want to "([^"]*)"$/) do |existence|
	User.create!(name: "user", password: "valid_password")
end

When (/^he fill in form with "([^"]*)" input$/) do |valid|
	fill_in 'login',    with: 'user'
  fill_in 'password', with:  "#{valid}_password"
end

And (/^click "([^"]*)"$/) do |button|
  click_button button
end
  
Then (/^he should see "([^"]*)"$/) do |error_message|
  page.should have_content(error_message)
end

Then /^he should see index page with newly created session record$/ do
  find("tr:last-child").text.should match(/record id: \d+\s+user: \w+\s+login time: \d+ \w+ \d+:\d+:\d+/)
end