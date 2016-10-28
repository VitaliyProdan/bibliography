module Parsers
  class Bibliography
    def initialize(query)
      self.query = URI.escape query
    end

    def categorize_listing
      page_content.css('td.main_content table.advanced').each do |el|
      end
    end

    def author
      page_content.css(
        'td.main_content table.advanced a[title="Пошук за автором"]'
      ).first.text
    end

    private

    attr_accessor :query

    def page_content
      Nokogiri::HTML(http_open(search_query))
    end

    def http_open(url)
      Net::HTTP.get(URI.parse(url))
    end

    def search_query
      'http://www.irbis-nbuv.gov.ua/cgi-bin/irbis_nbuv/cgiirbis_64.exe?' \
      'S21P03=T%3D&SearchIn=&I21DBN=UJRN&P21DBN=UJRN&S21LOG=1&S21P01=0' \
      '&S21COLORTERMS=1&S21FMT=fullwebr&S21P02=1&S21STN=1&S21CNR=20&S21REF=10' \
      '&S21All=&FT_REQUEST=&FT_PREFIX=&S21STR=' + query + '&C21COM=S' \
      '&C21COM1=%D0%9F%D0%BE%D1%88%D1%83%D0%BA'
    end
  end
end
