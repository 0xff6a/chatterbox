require 'helpers/general'

feature 'Posting hoots' do 

	before(:each) do
		create_test_user
		sign_in_test_user		
	end
	
	scenario 'while browsing the homepage' do
		hoot('Yay coding')
		expect(Hoot.first.content).to eq('Yay coding')
		expect(page).to have_content('Yay coding')
		expect(page).to have_content(user.username)
		expect(page).to have_content(user.name)
	end
	
	scenario 'without content' do
		hoot('')
		expect(Hoot.count).to eq(0)
		expect(page).to have_content('You must hoot something')
	end

end

feature 'Viewing a list of hoots' do

	before(:each) do
		create_test_user
		sign_in_test_user		
		hoot('Hoot Hoot')
		hoot('Woot Woot')
	end

	scenario 'while browsing the homepage' do
		expect(page).to have_content('Hoot Hoot')
		expect(page).to have_content('Woot Woot')
	end

end