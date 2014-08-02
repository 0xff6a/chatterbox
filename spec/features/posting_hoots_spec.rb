require './spec/helpers/general'

feature 'Posting hoots' do 

	before(:each) do
		create_test_user
		sign_in_test_user		
	end
	
	scenario 'while browsing the homepage' do
		hoot('Yay coding')
		expect(Hoot.first.content).to eq('Yay coding')
		expect(page).to have_content('Yay coding')
	end
	
	scenario 'without content' do
		hoot('')
		expect(Hoot.count).to eq(0)
		expect(page).to have_content('You must hoot something')
	end

end