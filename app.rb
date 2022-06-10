# ./app.rb

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmarks'
require './lib/database_connection_setup.rb'
require 'uri'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override
   # method_override is to allow DELETE method
  register Sinatra::Flash
  
  # our routes would go here
  get '/' do
    erb :index
  end

  get '/bookmarks' do
    p params
    @bookmarks = Bookmarks.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    if params[:url] =~ /\A#{URI::regexp(['http', 'https'])}\z/
      Bookmarks.create(url: params[:url], title: params[:title])
    else
      flash[:notice] = "You must submit a valid URL"
    end

    redirect '/bookmarks'
  end

  # :id is the id inside the html (inside the <li> tag)
  delete '/bookmarks/:id' do
    p params
    Bookmarks.delete(id: params[:id])
    redirect ('/bookmarks')
  end

  get '/bookmarks/:id/update' do
    p params
    @bookmark = Bookmarks.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    Bookmarks.update(url: params[:url], title: params[:title], id: params[:id])
    redirect('/bookmarks')
  end

  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end
