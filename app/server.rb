require 'sinatra'
require 'sinatra/partial'
require 'data_mapper'
require 'rack-flash'
require 'rest-client'

require_relative 'models/hoot'
require_relative 'models/user'
require_relative 'models/mailer'
require_relative 'models/reply'

require_relative 'helpers/application'
require_relative 'helpers/users'
require_relative 'helpers/hoots'

require_relative 'controllers/application'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/hoots'

require_relative 'datamapper_setup'

enable :sessions
set :session_secret, 'supercalifragalisticexpialodocious'
use Rack::Flash
set :partial_template_engine, :erb
