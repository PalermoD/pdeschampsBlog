class StaticPagesController < ApplicationController
  caches_page :index, :about, :portfolio

  def index
  end

  def about
  end 

  def portfolio
  end
end
