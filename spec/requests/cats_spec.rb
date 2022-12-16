
require 'rails_helper'


RSpec.describe "Cats", type: :request do

  #### GET

  describe "GET /index" do

    it "gets a list of cats" do
      Cat.create(
        name: 'Felix',
        age: 2,
        enjoys: 'Walks in the park',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      )

      get '/cats'
      
      cat = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1
    end

  end

  ## END GET

  ## START POST

  describe "POST /create" do

    ### START SUSSY BLOCK

    it "creates a cat" do

      # The params we are going to send with the request
      cat_params = {
        cat: {
          name: 'Buster',
          age: 4,
          enjoys: 'Meow Mix, and plenty of sunshine.',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
  
      # Send the request to the server
      post '/cats', params: cat_params
  
      # Assure that we get a success back
      expect(response).to have_http_status(200)
  
      # Look up the cat we expect to be created in the db
      cat = Cat.first
  
      # Assure that the created cat has the correct attributes
      expect(cat.name).to eq 'Buster'

    end

    ### END SUSSY BLOCK

    
    ### Start Name Validation

    it "doesn't create a cat without a name" do
      cat_params = {
        cat: {
          age: 2,
          enjoys: 'Walks in the park',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
      # Send the request to the  server
      post '/cats', params: cat_params

      # expect an error if the cat_params does not have a name
      expect(response.status).to eq 422

      # Convert the JSON response into a Ruby Hash
      json = JSON.parse(response.body)

      # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
      expect(json['name']).to include "can't be blank"

    end

    ### End name validation


    ### Start age validation

    it "doesn't create a cat without a age" do
      cat_params = {
        cat: {
          name: 'Austin',
          enjoys: 'Walks in the park',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
      # Send the request to the  server
      post '/cats', params: cat_params
      # expect an error if the cat_params does not have a age
      expect(response.status).to eq 422
      # Convert the JSON response into a Ruby Hash
      json = JSON.parse(response.body)
      # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
      expect(json['age']).to include "can't be blank"

    end ### End age validation

    
      
    ### Start enjoys presence validation

    it "doesn't create a cat without an enjoys value" do

      cat_params = {

        cat: { 
          name: 'Austin',
          age: 2,
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }

      # Send the request to the  server
      post '/cats', params: cat_params

      # expect an error if the cat_params does not have a enjoy
      expect(response.status).to eq 422

      # Convert the JSON response into a Ruby Hash
      json = JSON.parse(response.body)

      # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
      expect(json['enjoys']).to include "can't be blank"

    end ### End enjoys presence validation


    ### Start image validation

    it "doesn't create a cat without an image value" do

      cat_params = {

        cat: { 
          name: 'Austin',
          age: 2,
          enjoys: 'The enjoyable things in life'
        }
      }

      # Send the request to the  server
      post '/cats', params: cat_params

      # expect an error if the cat_params does not have a image
      expect(response.status).to eq 422

      # Convert the JSON response into a Ruby Hash
      json = JSON.parse(response.body)

      # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
      expect(json['image']).to include "can't be blank"

    end ### End image validation


    ### Start enjoys length validation

    it "doesn't create a cat without an enjoys value of minimum length 10" do

      cat_params = {

        cat: { 
          name: 'Austin',
          age: 2,
          enjoys: 'Whatever',
          image: 'https://GOOGLE.COM'
        }
      }

      # Send the request to the  server
      post '/cats', params: cat_params

      # expect an error if the cat_params does not have a enjoy
      expect(response.status).to eq 422

      # Convert the JSON response into a Ruby Hash
      json = JSON.parse(response.body)

      # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
      expect(json['enjoys']).to include "is too short (minimum is 10 characters)"

    end ### End enjoys length validation

  end   ### END POST


  ### START PATCH

  describe "PATCH /update" do

    it "updates a cat" do

      # The params we are going to send with the request
      cat_params = {
        cat: {
          name: 'Buster',
          age: 4,
          enjoys: 'Meow Mix, and plenty of sunshine.',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }

      # Create a cat
      post '/cats', params: cat_params

      cat_params = {
        cat: {
          name: "Mosey", 
          age: 6, 
          enjoys: "showing up in places randomly", 
          image:"https://www.grxstatic.com/4f3rgqwzdznj/4IMpm0CX5kGpinJiG2ME8r/2dae4b7ac7c3008359bc7fe690bab18f/cat_on_fence_outside-1324776163.jpg?format=pjpg&auto=webp&width=704"
        }
      }

      cat = Cat.first

      patch "/cats/#{cat.id}", params: cat_params

      updated_cat = Cat.find(cat.id)

      expect(response).to have_http_status(200)

      expect(updated_cat.age).to eq(6)

    end
  end

  ### END PATCH

end

# END DESCRIBE CATS