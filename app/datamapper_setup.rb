env = ENV["RACK_ENV"] || "development"
# DataMapper::Logger.new(STDOUT, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chatterbox_#{env}")

DataMapper.finalize
DataMapper.auto_upgrade!