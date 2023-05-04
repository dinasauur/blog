# The index action is empty. When an action does not explicitly render a view (or otherwise trigger an HTTP response), 
# Rails will automatically render a view that matches the name of the controller and action.
# So the index action will render app/views/articles/index.html.erb by default.
class ArticlesController < ApplicationController
  # R of CRUD
  def index
    @articles = Article.all
  end

  # R of CRUD
  def show
    @article = Article.find(params[:id])
  end

  # C of CRUD , we want to show the new page for the form
  # the new action instantiates a new article but does not save it
  # this article will be used in the view when building the form, and auutomatically render app/views/articles/new.html.erb
  def new
    @article = Article.new
  end

  # C of CRUD
  def create
    @article = Article.new(title: "...", body: "...")

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end
end
 