Given(/^I open the first book$/) do
	page(BookReaderPage).open_first_book
	@book_reader_page = page(BookReaderPage).await
end

Then(/^I can flip pages forward$/) do
	@book_reader_page.turn_page_forward(1)
end

Then(/^I can flip pages backward$/) do
	@book_reader_page.turn_page_backward(1)
end
Then(/^I should be back on the user library screen$/) do
	page(UserLibraryPage).await.expect be_current_page
end
And(/^move (\d+) foward$/) do |arg1|
	@book_reader_page.turn_page_forward(arg1)
end
And(/^move (\d+) backward$/) do |arg1|
	@book_reader_page.turn_page_backward(arg1)
end

And(/^I verify that the page is not bookmarked$/) do
	if @book_reader_page.has_bookmark? == true
		scenario.fail!('Page should not have been book marked')
	end
end

When(/^I open the reading option$/) do
	@book_reader_page.options_menu_button
end

When(/^I add a bookmark to the page$/) do
	@book_reader_page.add_bookmark
end

And(/^I verify that the page is bookmarked$/) do
	if @book_reader_page.has_bookmark? == false
		scenario.fail!('Page should have been book marked')
	end
end

Then(/^I remove the bookmark from the page$/) do
	@book_reader_page.remove_bookmark
end

