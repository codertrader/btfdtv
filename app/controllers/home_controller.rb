class HomeController < ApplicationController

  # GET /home
  # GET /home.json
  def index
    @contributors = Contributor.all.order(:name)
  end

end
