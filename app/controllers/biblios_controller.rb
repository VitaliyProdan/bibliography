class BibliosController < ApplicationController
  def create
    @biblio = Biblio.create(biblio_params)
    redirect_to biblio_path(@biblio)
  end

  def show
    @biblio = Biblio.find(params[:id])
  end

  private

  def biblio_params
    params.require(:biblios).permit(:text)
  end
end
