module Parsers
  class LocalParser
    def pull_name(str)
      if str.split('.')[2] && str.split('.')[2].length > 10 &&
         str.split('.')[1].strip.length == 1
        name = str.split('.')[2]
        name = name.include?('[') ? name.split('[').first : name.split('/').first
      else
        name = str.split('.').first
      end
      name.strip
    end

    def pull_eng_name(str)
      if str.split(',')[1] && str.split(',')[1].strip.length == 2
        name = str.split(':')[1]
        name = name.include?('/') ? name.split('/').first : name.split(':').first
      else
        name = str.split('.').first
      end
      name.split(',').first.strip
    end
  end
end
