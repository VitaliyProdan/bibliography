class BibliosController < ApplicationController
  def create
    @biblio = Biblio.last || Biblio.new
    @biblio.update_attributes(biblio_params)
    redirect_to biblio_path(@biblio)
  end

  def show
    @biblio = Biblio.find(params[:id])
    name = Parsers::LocalParser.new.pull_name(@biblio.text)
    @bibliography = Parsers::IrbisBibliography.new(name.strip)
  end

  private

  def biblio_params
    params.require(:biblio).permit(:text)
  end
end
