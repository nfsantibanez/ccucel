class HomePagesController < ApplicationController

#Action to call Home Page
def home
  render :layout => 'home'
end

end
