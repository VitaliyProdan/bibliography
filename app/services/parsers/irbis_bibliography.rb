module Parsers
  class IrbisBibliography
    EDITION_SELECTOR = 'p[style="margin-bottom:6pt;margin-top:10pt;' \
      'text-align:justify;font-size:12.0pt"]'.freeze

    def initialize(query)
      self.query = URI.escape query
    end

    def author
      page_content(false).css(
        'td.main_content table.advanced a[title="Пошук за автором"]'
      ).first.try(:text)
    end

    def name
      self.link = search_query(true)
      edition = page_content(true).css(EDITION_SELECTOR).first.try(:text)
      if edition.blank?
        self.link = search_query(false)
        article = page_content(false).css(
          'td.main_content table.advanced td[width="95%"]'
        )
        return article.blank? ? nil : article_full_name(article)
      else
        edition.strip
      end
    end

    attr_accessor :query, :link

    private

    def page_content(is_edition = true)
      Nokogiri::HTML(http_open(search_query(is_edition)))
    end

    def http_open(url)
      Net::HTTP.get(URI.parse(url))
    end

    def search_query(is_edition = true)
      prefix = is_edition ? 'J' : ''
      'http://www.irbis-nbuv.gov.ua/cgi-bin/irbis_nbuv/cgiirbis_64.exe?' \
      "S21P03=T#{prefix}%3D&SearchIn=&I21DBN=UJRN&P21DBN=UJRN&S21LOG=1" \
      '&S21P01=0&S21COLORTERMS=1&S21FMT=fullwebr&S21P02=1&S21STN=1&S21CNR=20' \
      '&S21All=&FT_REQUEST=&FT_PREFIX=&S21STR=' + query + '&C21COM=S' \
      '&S21REF=10&C21COM1=%D0%9F%D0%BE%D1%88%D1%83%D0%BA'
    end

    def article_full_name(article)
      element = article.css('br')[1].next
      text = element.text
      stop = false
      until stop
        element = element.next
        stop = element.name == 'br'
        text << element.text
      end
      text.squish.strip
    end
  end
end
