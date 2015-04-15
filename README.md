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

<%= form_for @post do |f| %>
  <%= f.label :title %>
  <%= f.text_field :title %>

  <%= f.label :content %>
  <%= f.text_field :content %>

  <%= f.submit %>
<% end %>

```

## Instructions



## Bonus



## Resources


