When /^a user visits index page$/ do
	visit '/'
end

Then /^he should see new session record$/ do
	response.should contain(/record id: \d+\s+user: \w+\s+login time: \d+ \w+ \d+:\d+:\d+/)
end

And /^he should see "(.*)" within title$/ do |appname|
	page.should have_selector('title', content: appname)
end