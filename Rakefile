require 'data_mapper'
require File.join(File.dirname(__FILE__), 'app/datamapper_setup.rb')

task :auto_upgrade do
	DataMapper.auto_upgrade!
	puts 'Auto-upgrade complete (no data loss)'
end

task :auto_migrate do
	DataMapper.auto_migrate!
	puts 'Auto-migrate complete (data could have been lost)'
end