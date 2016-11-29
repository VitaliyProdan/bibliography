class BibliosController < ApplicationController
  def create
    save_file
    @biblios = Biblio.last || Biblio.new
    @biblios.text = File.read('tmp/txt/biblios_list')
    @biblios.save
    redirect_to biblio_path(@biblios)
  end

  def show
    @biblios = Biblio.find(params[:id])
  end

  private

  def save_file
    path = File.join('tmp/txt', 'biblios_list')
    File.open(path, 'wb') { |f| f.write(params[:biblio][:txt].read) }
  end

  def biblio_params
    params.require(:biblio).permit(:text)
  end
end
