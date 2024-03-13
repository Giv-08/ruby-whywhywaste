class PagesController < ApplicationController
  skip_before_action :authenticate_user_or_restaurant, only: [ :home ]

  def dashboard
  end
end
