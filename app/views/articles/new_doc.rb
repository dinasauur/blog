# The form_with helper method instantiates a form builder. 
# In the form_with block we call methods like label and text_field on the form builder to output the appropriate form elements.

# Explanation for line 5-7:
# the full_messages_for(:body) method is called on the @article.errors object to get an array of error messages specifically for the body attribute of the Article model. 
# The each method is then called on the resulting array to iterate over each error message and generate a <div> element for it to display in the HTML.

# Some cchanges made when creating the partial file, all occurrences of @article have been replaced with article. 
# Because partials are shared code, it is best practice that they do not depend on specific instance variables set by a controller action. 
# Instead, we will pass the article to the partial as a local variable.

# update new.html and edit.html to use the partial via render