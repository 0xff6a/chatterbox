require 'sinatra'
require 'sinatra/partial'
require 'data_mapper'
require 'rack-flash'
require 'rest-client'

require_relative 'models/hoot'
require_relative 'models/user'

require_relative 'datamapper_setup'

enable :sessions
set :session_secret, 'supercalifragalisticexpialodocious'
use Rack::Flash
set :partial_template_engine, :erb
