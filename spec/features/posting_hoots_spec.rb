require './spec/helpers/general'

feature 'Posting hoots' do 

	before(:each) do
		create_test_user
		sign_in_test_user		
	end
	
	scenario 'while browsing the homepage' do
		click_on 'Hoot'
		fill_in 'content', :with => 'Yay coding'
		click_on 'Hoot Away'
		expect(Hoot.first.content).to eq('Yay coding')
		expect(page).to have_content('Yay coding')
	end
	
end