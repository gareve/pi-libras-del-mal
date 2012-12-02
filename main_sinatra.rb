# encoding: UTF-8
#require 'rubygems'
require 'bundler/setup'
require 'compass'
require 'sinatra'
require 'zurb-foundation'

Bundler.require
require './models/persistence'
require './models/chart_fill_values'
Dir.glob('./controllers/*', &method(:require))

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

set :locales, %w[es pt]
set :default_locale, 'es'
set :locale_pattern, /^\/?(#{Regexp.union(settings.locales)})(\/.+)$/

helpers do
  def locale
    @locale || settings.default_locale
  end
end

before do
  @locale, request.path_info = $1, $2 if request.path_info =~ settings.locale_pattern
  R18n.set(locale)
end




#get '/stylesheets/:name.css' do
#  content_type 'text/css', :charset => 'utf-8'
#  sass(:"stylesheets/#{params[:name]}", Compass.sass_engine_options )
#end

get '/formulario' do
	erb :formulario
end

get '/conflicto' do
   @conflicto = Conflicto.all
   erb :conflicto
end

################ Paginas Contest ######################

#Can be used on views
helpers do
   include Rack::Utils

   # Use h(str) to escape html
   alias_method :h, :escape_html
end

get '/home' do
   @ultimos1 = Conflicto.all.first(5)
   @ultimos2 = Conflicto.all.last(5)
   erb :home
end


get '/estadistica' do
   @conflictos = Conflicto.all
   load_charts_value
   erb :estadistica
end