require './spec/helpers/general'

describe Reply do

	before(:each) do
		create_test_user 
		Hoot.create(:content => 'Hello', :user_id => user.id)
	end

	it 'must be associated with a user and hoot to be created' do
		Reply.create(:content => 'test')
		expect(Reply.count).to eq(0)
		Reply.create(:content => 'test', :user => user)
		expect(Reply.count).to eq(0)
		Reply.create(:content => 'test', :user => user, :hoot => hoot)
		expect(Reply.count).to eq(1)
		expect(reply.content).to eq('test')
	end

	it 'cannot have empty content' do
		Reply.create(:content => '', :user => user, :hoot => hoot)
		expect(Reply.count).to eq(0)
	end

	it 'should have a timestamp' do
		Reply.create(	:content => 'test', 
									:timestamp => Time.now, 
									:user => user,
									:hoot => hoot)
		expect(Time.parse(reply.timestamp)).to be_within(60).of(Time.now)
	end

end