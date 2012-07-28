#Rubygems
require 'rubygems'

#Sinatra
require 'sinatra'
require 'sinatra/content_for'
require 'sinatra/reloader'
require 'sinatra/flash'

require 'haml'
require 'sass'

# Serve all public folder files
# set :public_folder, 'public'

# Routing

get '/' do
  haml :index
end

get '/:route' do
  valid_routes = [  'about' ] 

  valid_routes.each do | r |
    @route = r if params[:route] == r
  end
  halt 404 unless @route
  haml @route.to_sym
end
  
get '/stylesheets/*' do
  content_type 'text/css'
  sass '../styles/'.concat(params[:splat].join.chomp('.css')).to_sym
end
