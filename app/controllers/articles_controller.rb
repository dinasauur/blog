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

  # C of CRUD (Note 1)
  def new
    @article = Article.new
  end

  # C of CRUD (Note 2)
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  # U of CRUD (Note 4)
  def edit
    @article = Article.find(params[:id])
  end

  # U of CRUD (Note 4)
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
    # (Note 3)
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
 

### Note 1
# The "new" action is used to render a form where the user can input the data for the new record.
# the new action instantiates a new article but does not save it ( we're creating a new Article object and assigning it to an instance variable "@article")
# this article will be used in the view template when building the form, and automatically render app/views/articles/new.html.erb
###

### Note 2
# "create" action is used to actually save the data from the submitted form to the database and create a new record. This action is triggered when the user submits the form data. 
# Submitted form data is put into the params Hash, alongside captured route parameters. 
# Thus, the create action can access the submitted title via params[:article][:title] and the submitted body via params[:article][:body]
###

# Further explanation: When creating a new record (or row) in the database using the "create" action, the submitted form data is stored in a special data structure called the "params Hash". 
# This Hash is like a container for all the submitted data and captured route parameters, and it can be accessed in the controller actions.
# Ex. The submitted title and body will be stored in the params Hash, with keys that correspond to the names of the form fields.
# line 34 passes a sanitized Hash of the submitted data (from line 48) to the Article.new method, with only the permitted fields included.
# The Article.new method will use this Hash to create a new Article object with the submitted values.
###

### Note 3
# This is a security measure to prevent unwanted data from being saved to the database
# "params.require(:article)" checks that the submitted data includes a Hash with the key "article"
# and "permit(:title, :body)" allows only the "title" and "body" fields to be submitted.
###

### CONTROL FLOW OF NEW AND CREATE WITH NEW.HTML, ROUTES, ARTICLE MODEL
# When we visit http://localhost:3000/articles/new, the GET /articles/new request is mapped to the new action. The new action does not attempt to save @article. Therefore, validations are not checked, and there will be no error messages.
# When we submit the form, the POST /articles request is mapped to the create action. The create action does attempt to save @article. Therefore, validations are checked. 
# If any validation fails, @article will not be saved, and app/views/articles/new.html.erb will be rendered with error messages.
###

### Note 4
# The edit action fetches the article from the database, and stores it in @article so that it can be used when building the form. 
# By default, the edit action will render app/views/articles/edit.html.erb.
# The update action (re-)fetches the article from the database, and attempts to update it with the submitted form data filtered by article_params. 
# If no validations fail and the update is successful, the action redirects the browser to the article's page. Else, the action redisplays the form, with error messages, by rendering app/views/articles/edit.html.erb.
###