ENV["RACK_ENV"] ||= "development"

require_relative 'datamapper_setup'
require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    #p @tags = Tag.all
    erb(:'links/index')
  end

  get '/links/new' do
    erb(:'links/new_link')
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(name: params[:tag])
    link.tags << tag
    link.save
    redirect('/links')
  end

  get '/tags/:name' do
    p @links = Link.all.map { |link|
        tagged = link.tags.map { |tag|
          tag.name == params[:name] }
        link if tagged.include?(true)
      }.compact

      erb :'links/index'
  end

  run! if app_file == $0

end
