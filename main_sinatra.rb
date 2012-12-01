# encoding: UTF-8
#require 'rubygems'
require 'bundler/setup'
require 'compass'
require 'sinatra'
require 'zurb-foundation'

Bundler.require
require './controllers/persistence.rb'

##########################################################
# Enable static files like images, javascript, css, etc.
##########################################################

configure do
   set :static, true
   set :public_folder, File.dirname(__FILE__) + '/static'
   set :port,9394
   set :session_secret, "My session secret"
   set :scss, {:style => :compact, :debug_info => false}
   Compass.add_project_configuration(File.join(Sinatra::Application.root, 'config', 'compass.config'))

end

#get '/stylesheets/:name.css' do
#  content_type 'text/css', :charset => 'utf-8'
#  sass(:"stylesheets/#{params[:name]}", Compass.sass_engine_options )
#end

get '/home' do
	erb :home
end

get '/formulario' do
	erb :formulario
end

get '/map' do
   erb :map
end

get '/miniInfo/:id' do
   @id = params[:id]
   erb :miniInfo,:layout => false
end

get '/conflicto' do
   @conflicto = Conflicto.all
   erb :conflicto
end