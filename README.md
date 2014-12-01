#![styled 'o'](http://i36.photobucket.com/albums/e17/cordiallysherry/shout_gravatar_with_border_zps147084eb.png)SHOUTER
SHOUTER is a breakable toy that is the angriest (or most enthusiastic) version of Twitter. Imagine capitalized text ALL THE TIME!
ENTER SHOUTER, ENSURING YOUR INTENTIONS ARE CLEARLY SHOWN WITHOUT HAVING TO KEEP YOUR FINGER ON THE SHIFT BUTTON!

#CODE STYLE
SHOUTER was created to experiment with various coding practices, often with Sandi Metz in mind. To enforce her guidelines,
design patterns such as law of demeter and the facade pattern were used.

EXAMPLE:

From the view:
```erb
<%= form_for @home.new_text_shout do |form| %>
  <%= form.text_field :body, placeholder: "Shout something!" %>
  <%= form.submit "SHOUT!" %>
<% end %>

<%= form_for @home.new_photo_shout do |form| %>
  <%= form.file_field :image %>
  <%= form.submit "SHARE!"%>
<% end %>

<%= render @home.all_shouts %>
```

To the controller:

```ruby
class HomesController < ApplicationController
  def show
    @home = Home.new(current_user)
  end
end
```

To a model, specifically designed to handle logic that does not need to persist into the database:

```ruby
class Home
  def initialize(user)
    @user = user
  end

  def new_text_shout
    TextShout.new
  end

  def new_photo_shout
    PhotoShout.new
  end

  def all_shouts
    Shout.all
  end
end
```
#TESTING

SHOUTER uses RSpec, Capybara, and FactoryGirl.

#CODE FEATURES

SHOUTER incorporates polymorphism, self-join tables, and searching using regular expressions.

#APP FEATURES

* Gravatars are used for user avatars, with a personally designed default gravatar image if a user doesn't have one.
* Admin privileges and spam control
* Ability to follow/unfollow users
* Two types of shouts, either photo or text

#FUTURE FEATURE PLANS
* Tagging users
* Fully functional site-wide searching
* Improved UX
* Code that is 100% tested using TDD
