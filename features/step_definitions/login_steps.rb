Given /^a user visits the login page$/ do
	visit '/login'
end

And /^he has an account$/ do
  @user = User.create!(name: "user", password: "password")
end

When /^he submits invalid login information$/ do
	fill_in 'login',    with: 'user'
  fill_in 'password', with: 'wrong_password'
  click_button 'Log in'
end

Then /^he should see an error message$/ do
  expect(page).to contain(/wrong password\/login/)
end

When /^the user submits valid login information$/ do
  fill_in 'login',    with: 'user'
  fill_in 'password', with: 'password'
  click_button 'Log in'
end

Then /^he should see index page with newly created session record$/ do
	expect(page).to contain(/record id: \d+\s+user: user+\s+login time: \d+ \w+ \d+:\d+:\d+/)
end