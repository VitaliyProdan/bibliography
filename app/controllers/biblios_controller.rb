class BibliosController < ApplicationController
  def create
    @biblio = Biblio.last || Biblio.new
    @biblio.update_attributes(biblio_params)
    redirect_to biblio_path(@biblio)
  end

  def show
    @biblio = Biblio.find(params[:id])
    @bibliography = Parsers::Bibliography.new(@biblio.text)
  end

  private

  def biblio_params
    params.require(:biblio).permit(:text)
  end
end
