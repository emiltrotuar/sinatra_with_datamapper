Given /^a user visits the signup page$/ do
	visit '/signup'
end

And /^name he want to register was alreasy taken$/ do
	User.create!(name: "new_user", password: "password")
end

When /^he tries to register account with this name$/ do
	fill_in 'login',    with: 'new_user'
  fill_in 'password', with: 'password'
  click_button 'Sign up'
end

Then /^he should see an error message$/ do
  expect(page).to contain(/this name was already taken/)
end

Given /^name he want to register not exists$/ do
	User.get('new_user').destroy
end

When /^he register account with this name$/ do
  fill_in 'login',    with: 'new_user'
  fill_in 'password', with: 'password'
  click_button 'Sign up'
end

Then /^he should see index page with newly created session record$/ do
	expect(page).to contain(/record id: \d+\s+user: new_user+\s+signup time: \d+ \w+ \d+:\d+:\d+/)
end