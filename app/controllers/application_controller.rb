
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  #READ
  get '/articles' do
    @articles = Article.all
    
    erb :index
  end

#CREATE
  get '/articles/new' do
    erb :new
  end

#CREATE
  post '/articles' do
    Article.create(params)
    redirect '/articles'
  end
  
#READ
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  #UPDATE
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:edit_article])
    @article.save

    erb :show
  end

  delete '/articles/:id/delete' do
    @article = Article.find(params[:id])
    @article.destroy

    erb :delete
  end

end

