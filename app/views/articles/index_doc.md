# index.html.erb

## line 4, what is happening there?
 previously, it was originally: <a href="/articles/<%= article.id %>">
                                 <%= article.title %>
                                </a>

 changed to 2. <a href="<%= article_path(article) %>">
                 <%= article.title %>
               </a>

 changed to 3. what we have below

## Explanation: 
The resources method also sets up URL and path helper methods that we can use to keep our code from depending on a specific route configuration. 

### Type in: bin/rails routes command. 
The values in the "Prefix" column plus a suffix of _url or _path form the names of these helpers.

In **change #2**, the article_path helper returns "/articles/#{article.id}" when given an article.

In **change #3**, link_to helper renders a link with its first argument as the link's text and its second argument as the link's destination

If we pass a model object as the second argument, link_to will call the appropriate path helper to convert the object to a path. For example, if we pass an article, link_to will call article_path

