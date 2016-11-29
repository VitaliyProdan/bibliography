class Biblio < ActiveRecord::Base
  attr_accessor :txt

  def split
    result = []
    text.split("\n").each_with_index do |full_name, i|
      result << Parsers::IrbisBibliography.new(full_name)
      logger.info "Bibliography #{i + 1}/#{text.split("\n").length}"
    end
    result
  end
end
