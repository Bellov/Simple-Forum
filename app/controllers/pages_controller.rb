class PagesController < ApplicationController

  def index
      redirect_to article_path if logged_in?
  end


  def about

  end

end