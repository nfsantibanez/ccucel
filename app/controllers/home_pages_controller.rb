class HomePagesController < ApplicationController


# Action to call Home Page
def home
  render :layout => 'home'
end

# Action to call Request HomePage
def request_home
  render :layout => 'general_view'
end

# Action to call Request HomePage
def follow_request
  render :layout => 'general_view'
end


end
