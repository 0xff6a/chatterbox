describe Hoot do
	
	before(:each) { create_test_user }

	it 'should be created with content' do
		Hoot.create(:content => 'Hello', :user_id => user.id)
		expect(Hoot.count).to eq(1)
		expect(hoot.content).to eq('Hello')
	end

	it 'cannot be created without content' do
		Hoot.create(:user_id => user.id)
		expect(Hoot.count).to eq(0)
	end

	it 'should have a timestamp' do
		Hoot.create(:content => 'Hello', :timestamp => Time.now, :user_id => user.id)
		expect(Time.parse(hoot.timestamp)).to be_within(60).of(Time.now)
	end

	it 'should belong to a user' do
		Hoot.create(:content => 'Hello')
		expect(Hoot.count).to eq(0)
		Hoot.create(:content => 'Hello', :user_id => user.id)
		expect(Hoot.count).to eq(1)
	end

	def hoot
		Hoot.first
	end

end