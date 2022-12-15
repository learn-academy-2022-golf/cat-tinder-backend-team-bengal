Complete - As a developer, I can create a new Rails application with a Postgresql database.


Complete - As a developer, I can create a RSpec testing suite in my Rails application.


As a developer, I can add a resource for Cat that has a name, an age, what the cat enjoys doing, and an image.

rails generate resource Cat name:string age:integer enjoys:text image:text
###  $ rails db:migrate

Add seed file db-->seeds.rb
add code to file from syllabus
example:
cats = [
  {
    name: 'Felix',
    age: 2,
    enjoys: 'Long naps on the couch, and a warm fire.',
    image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
  },
  {
    name: 'Homer',
    age: 12,
    enjoys: 'Food mostly, really just food.',
    image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80'
  },
  {
    name: 'Jack',
    age: 5,
    enjoys: 'Furrrrociously hunting bugs.',
    image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
  }
]

cats.each do |each_cat|
  Cat.create each_cat
  puts "creating cat #{each_cat}"
end

run rails db:seed

Complete - As a developer, I can add cat seeds to the seeds.rb file.

Complete - As a developer, I can run the rails command to add cats to database.

Complete - As a developer, I can enable my controller to accept requests from outside applications. Token Authenticity

Complete - As a developer, I can add the CORS gem to my Rails application. Get file from the syllabus

Complete - As a developer, I can add the cors.rb file to my application. app/initializers/cors.rb --We need to do a file create for cors.rb

## As a developer, I can add an index request spec to my application. ✅
under app/controllers/cats_controller.rb

def index
  end

  def create
  end

  def update
  end

  def destroy
  end

end

in /spec/requests/cats_request_spec.rb

First hiccup. The above file does not exist in my folder

Solution: created the file, c&p the supplied content from syllabus

tried rspec spec

informed need to run bundle

ran bundle install

rspec spec  no database error
rails db:create
rails db:migrate
rails db:seed

in config/routes.rb
Rails.application.routes.draw do
  resources :cats
end


## As a developer, I can add an index endpoint to my application. ✅

## As a developer, I can add a create request spec to my application. ✅

## As a developer, I can add a create endpoint to my application. ✅


# Stretch Goals
## As a developer, I can add an update request spec to my application.







## As a developer, I can add an update endpoint to my application.

## As a developer, I can add a destroy request spec to my application.

## As a developer, I can add a destroy endpoint to my application.

As a developer, I can add the appropriate model specs that will ensure an incomplete cat throws an error.


As a developer, I can add the appropriate model validations to ensure the user submits a name, an age, what the cat enjoys, and an image.


As a developer, I can add the appropriate model specs that will ensure a cat enjoys entry is at least 10 characters long.
As a developer, I can add a validation to assure that will ensure a cat enjoys entry is at least 10 characters long.
As a developer, I can add the appropriate request validations to ensure the API is sending useful information to the frontend developer if a new cat is not valid.


As a developer, I can add the appropriate request spec that will look for a 422 error if the create validations are not met.


STRETCH: As a developer, I can add the appropriate request validations to ensure the API is sending useful information to the frontend developer if an updated cat is not valid.


STRETCH: As a developer, I can add the appropriate request spec that will look for a 422 error if the update validations are not met.