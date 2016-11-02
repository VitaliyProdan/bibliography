class BaseController < ApplicationController
  def index
    @biblio = Biblio.new
  end
end
