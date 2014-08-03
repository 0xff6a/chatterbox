require 'helpers/general'

feature 'Replying to hoots' do

	before(:each) do
		create_test_user
		sign_in_test_user	
		create_hoot('test hoot')	
	end
	
	scenario 'while browsing the home page' do
		create_hoot_em_back('reply')
		expect(user.replies.count).to eq(1)
		expect(user.replies.first.content).to eq('reply')
	end

	scenario 'with no content' do
		create_hoot_em_back('')
		expect(page).to have_content('You must hoot em back with something')
	end

	scenario 'navigating to the hootenannies page' do
		create_hoot_em_back('reply')
		click_on 'profile-button'
		
		within 'div.hoot-daddy' do
			expect(page).to have_content('Hoot Daddy')
			expect(page).to have_content('test hoot')
		end
		
		within 'div.hoot-em-backs' do
			expect(page).to have_content("Hoot 'Em Backs")
			expect(page).to have_content('reply')
		end
	end

end