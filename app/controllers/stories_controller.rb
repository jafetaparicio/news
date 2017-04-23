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
    @story.image = params[:story][:image]
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
    @story.image = params[:story][:image]
    @story.save
    redirect_to '/'
  end
  
    def upvote
    vote = Vote.find_by(user_id: current_user.id, story_id: params[:id])
    if vote.nil?
      vote = Vote.new
      vote.user_id = current_user.id
      vote.story_id = params[:id]
      vote.value = 1
      vote.save
    else
      vote.value = 1
      vote.save
    end
    redirect_to '/'
  end
  
  def downvote
    vote = Vote.find_by(user_id: current_user.id, story_id: params[:id])
    if vote.nil?
      vote = Vote.new
      vote.user_id = current_user.id
      vote.story_id = params[:id]
      vote.value = -1
      vote.save
    else 
      vote.value = -1
      vote.save
    end
    redirect_to '/'
  end
end
