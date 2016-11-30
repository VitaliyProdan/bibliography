module Parsers
  class SpringerBibliography
    def initialize(query)
      self.original_text = query
      name = Parsers::LocalParser.new.pull_eng_name(query).strip
      self.query = URI.escape name
    end

    def name
      link.present? ? original_text : nil
    end

    def link
      path = page_content.css('#results-list a.title').first.try(:attr, 'href')
      path.blank? ? nil : "http://link.springer.com#{path}"
    end

    attr_accessor :query, :original_text

    private

    def page_content
      Nokogiri::HTML(Net::HTTP.get(URI.parse(search_query)))
    end

    def search_query
      "http://link.springer.com/search?query=#{query}"
    end
  end
end
