get '/'  do
	@hoots = Hoot.all(:order => [ :timestamp.desc ])
	erb :index
end