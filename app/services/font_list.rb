require 'json'
require 'open-uri'

class FontList
  def initialize

  end

  def self.list
    font_list = Hash.new
    i = 0
    url = "https://www.googleapis.com/webfonts/v1/webfonts?key=AIzaSyCvbDy-yR6a4BCd6OblDf4BIR9Yzb_PHz8&sort=popularity"
    read = open(url).read
    fonts = JSON.parse(read)

    until i == 15 do
      font_list[fonts['items'][i]['family']] = fonts['items'][i]['files'].first[1]
      i += 1
    end
    font_list
  end

end
