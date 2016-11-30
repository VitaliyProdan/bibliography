class Biblio < ActiveRecord::Base
  attr_accessor :txt

  def split
    result = []
    text.split("\n").each_with_index do |full_name, i|
      if full_name.match(/[а-я]/).nil?
        result << Parsers::SpringerBibliography.new(full_name)
      else
        result << Parsers::IrbisBibliography.new(full_name)
      end
      logger.info "Bibliography #{i + 1}/#{text.split("\n").length}"
    end
    result
  end
end
