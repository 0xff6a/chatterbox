describe Hoot do
	
	it 'should be created with content' do
		Hoot.create(:content => 'Hello')
		expect(Hoot.count).to eq(1)
		expect(hoot.content).to eq('Hello')
	end

	it 'cannot be created without content' do
		Hoot.create()
		expect(Hoot.count).to eq(0)
	end

	it 'should have a timestamp' do
		Hoot.create(:content => 'Hello', :timestamp => Time.now)
		expect(Time.parse(hoot.timestamp)).to be_within(60).of(Time.now)
	end

	def hoot
		Hoot.first
	end

end