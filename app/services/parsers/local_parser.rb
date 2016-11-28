module Parsers
  class LocalParser
    def pull_name(str)
      name = string_between_markers(str, '.', '[')
      name ||= str.split('[').first
      name
    end

    def string_between_markers(input_string, marker1, marker2)
      input_string[/#{Regexp.escape(marker1)}(.*?)#{Regexp.escape(marker2)}/m, 1]
    end
  end
end
