# The index action is empty. When an action does not explicitly render a view (or otherwise trigger an HTTP response), 
# Rails will automatically render a view that matches the name of the controller and action.
# So the index action will render app/views/articles/index.html.erb by default.
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
end
 