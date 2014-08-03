require 'helpers/general'

feature 'Replying to hoots' do

	before(:each) do
		create_test_user
		sign_in_test_user	
		hoot('test hoot')	
	end
	
	scenario 'while browsing the home page' do
		visit('/')
		click_button 'reply'
		expect(page).to have_content("Hoot 'Em Backs")
		fill_in 'content', :with => 'reply'
		click_on "Hoot 'Em Back"
		expect(user.replies.count).to eq(1)
		expect(user.replies.first.content).to eq('reply')
	end

	# scenario 'navigating to a favourites page' do
	# 	# visit('/')
	# 	# click_button 'fav'
	# 	# add_link('http://www.notfav.com', 'Not Fav', ['test'], 'testing')
	# 	# visit('/')
	# 	# click_on 'profile-button'
	# 	# expect(page).to have_content('Test')
	# 	# expect(page).not_to have_content('Not Fav')
	# end

end