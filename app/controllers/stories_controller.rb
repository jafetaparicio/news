class StoriesController < ApplicationController
  def index
  end
  
  def new
    @story = Story.new
  end
  
  def create
    @story = Story.new
    @story.user_id = current_user.id
    @story.title = params[:story][:title]
    @story.url = params[:story][:url]
    @story.save
    redirect_to '/'
  end
  
  def edit
    @story = Story.find(params[:id])
  end
  
  def update
    @story = Story.find(params[:id])
    @story.title = params[:story][:title]
    @story.url = params[:story][:url]
    @story.save
    redirect_to '/'
  end
end
