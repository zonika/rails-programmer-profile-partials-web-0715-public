---
tags: rails, partials
languages: ruby
resources: 4
---

# Programmer Profiles App

We have a Rails app that showcases some of our favorite programmers. The landing page is an index of all the programmers, and users can click on each programmer to see his or her profile page. There's just one problem - the views are loaded with repetition and clunky iteration, and could use some serious refactoring. Your job is to clean up `programmers/index.html.erb` and `programmers/show.html.erb` by using partials.

## Rendering Partials in Rails

Partials (short for partial templates) do exactly what it sounds like - they render a part of a larger view. Using partials allows us to apply the principles of single responsiblity and DRY code to our ERB files.

### Example: Using Partials for Forms

Let's say we have a blog app that allows you to create and edit blog posts. Here's how your views for `new.html.erb` and `edit.html.erb` might look without partials:

```ruby
# app/views/posts/new.html.erb
<h1>Make a new post!</h1>

<%= form_for @post do |f| %>
  <%= f.label :title %>
  <%= f.text_field :title %>

  <%= f.label :content %>
  <%= f.text_field :content %>

  <%= f.submit %>
<% end %>

```
```ruby
# app/views/posts/edit.html.erb
<h1>Edit a post</h1>

<%= form_for @post do |f| %>
  <%= f.label :title %>
  <%= f.text_field :title %>

  <%= f.label :content %>
  <%= f.text_field :content %>

  <%= f.submit %>
<% end %>

```

Clearly, the code for these two views is not exactly DRY. In fact, it is identical except for the `h1`. With a partial for the form, we can get rid of all this repeated code:

```ruby
# app/views/posts/_form.html.erb
# *** Note that the file name for the partial must begin with an underscore! ***

<%= form_for @post do |f| %>
  <%= f.label :title %>
  <%= f.text_field :title %>

  <%= f.label :content %>
  <%= f.text_field :content %>

  <%= f.submit %>
<% end %>

```
```ruby
# app/views/posts/new.html.erb
<h1>Make a new post!</h1>

<%= render 'form' %>

```
```ruby
# app/views/posts/edit.html.erb
<h1>Edit a post</h1>

<%= render 'form' %>

```

By using a partial for the form (`app/views/posts/_form.html.erb`), we can abstract away the repeated code. But how will one of these forms be a form to `update` a post and the other be a form to `create` a post if the forms are exactly the same? That's part of the awesomeness of Rails. Rails introspects on the object passed in to the form, in this case `@post`. If the object is `persisted?`, the form object generated will be for an `update` and the fields that already have values will be pre-populated with them. If not, it will be for a `create`.

Another common situation in which partials are handy is when rendering collections. For example, in `app/views/posts/index.html.erb`, you can do the following iteration to render all the `@posts`:

```ruby
<h1>All the Posts!</h1>

<% @posts.each do |post| %>
  <div class="post">
    Title: <%= post.title %>
    Author: <%= post.auther.name %>

    <p><%= post.content %></p>
  </div>
<% end %>

```
...or, you can use a partial for rendering a single post (move all the code in `div.post` over to `app/views/posts/_post.html.erb`), and change that entire `each` loop into just one line of code:

`<%= render @posts %>`

As long as `@post` was set to contain a collection of `Post` objects in the `index` action of the posts controller and your partial is in the right place with the right name, Rails takes care of all the rest!

Now you'll make some partials to refactor our Programmer Profiles App.


## Instructions

Fork and clone the lab. Run `bundle install` and `rake db:migrate`, then `rake db:migrate RAILS_ENV=test`. Next, seed the database with some programmers - run `rake db:seed` - and start the sever to see the app in the browser.

Run `rspec` and make the tests pass one at a time! The app will continue to have the same functionality (keep checking it in the browser), but you'll be making the following partials to clean up the views:

1. A partial to render the navbar.
2. A partial to render all the programmers on the index page (see the example above!).
3. A bonus partial to abstract away some of the repetition in `app/views/programmers/show.html.erb`. More details on that in the next section.

## Bonus

This part is a little more complex than the previous two steps, and will require you to get a little more creative.

When you look at `app/views/programmers/show.html.erb`, you will probably notice a pattern in how several of the attributes are rendered (specifically `home_country`, `quote`, and `claim_to_fame`. They each seem to be in a `<p>` tag with a bold capitalized label followed by the value for the given attribute. You'll want to render each of these with a single partial, `app/views/programmers/_attribute.html.erb`. Here are two hints to set you on the right track:

1. You'll probably need to use the `send` method.
2. You'll have to pass local variables to the partial to render it correctly for each attribute without hard-coding anything. Read the resources below to learn more about both of these!


## Resources
- [Rails Guides - Using Partials](http://guides.rubyonrails.org/layouts_and_rendering.html#using-partials)
- [Action View Partials](http://api.rubyonrails.org/classes/ActionView/PartialRenderer.html)
- [Metaprogramming in Ruby](http://ruby-metaprogramming.rubylearning.com/html/ruby_metaprogramming_2.html) - See section 1.3.2 to learn about `send`.
- [Stack Overflow - Passing Variables to a Partial](http://stackoverflow.com/questions/16242121/rails-4-passing-variable-to-partial) (see the first answer for a concise example)

