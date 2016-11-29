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

    def string_between_markers(input_string, marker1, marker2)
      input_string[/#{Regexp.escape(marker1)}(.*?)#{Regexp.escape(marker2)}/m, 1]
    end
  end
end


# module Parsers
#   class LocalParser
#     def pull_name(str)
#       name = str.split('[').first || nil
#       if str.split('.')[2].length > 10 && str.split('.')[1].strip.length == 1
#         name = str.split('.')[2]
#         name = name.include?('[') ? name.split('[').first : name.split('/').first
#       else
#         name = str.split('.').first
#       end
#       name.strip
#     end

#     def string_between_markers(input_string, marker1, marker2)
#       input_string[/#{Regexp.escape(marker1)}(.*?)#{Regexp.escape(marker2)}/m, 1]
#     end
#   end
# end
