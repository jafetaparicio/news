class HomeController < ApplicationController
  def index
    @stories = Story.all
    @stories = @stories.sort do |x, y|
      y.score <=> x.score
  end
end
end
