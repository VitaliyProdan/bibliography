class BibliosController < ApplicationController
  def create
    @biblio = Biblio.last
    @biblio.update_attributes(biblio_params)
    redirect_to biblio_path(@biblio)
  end

  def show
    @biblio = Biblio.find(params[:id])
    @biblio.text = 'Моделирование надежности обновляемых программных средств нерезервированных информационно-управляющих систем постоянной готовности'
    @bibliography = Parsers::Bibliography.new(@biblio.text)

    # puts bibliography.author
  end

  private

  def biblio_params
    params.require(:biblio).permit(:text)
  end
end
