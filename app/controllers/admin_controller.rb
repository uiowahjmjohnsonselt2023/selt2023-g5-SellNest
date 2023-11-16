class AdminController < ApplicationController
  def index
    @total_users = totalUsers
  end

  def totalUsers
    User.count
  end
  
end
