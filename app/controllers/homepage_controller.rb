class HomepageController < ApplicationController

  def index

    if user_signed_in?
      redirect_to jobs_path
    else
      redirect_to new_user_registration_path
    end
  end

end