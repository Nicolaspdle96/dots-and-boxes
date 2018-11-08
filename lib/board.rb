require './lib/box'

class Board
    def initialize(size)
        @size = size
    end

    def generateHTML()
        $j = 1
        $i = 1
        row = 1
        completeHTML = ""  
        while $i <= @size  do
            while $j <= @size * row   do
                completeHTML = completeHTML +  Box.new($j).generateHTML()
                $j +=1
            end
            completeHTML = completeHTML + "<div></div>"
            row += 1
            $i +=1
        end
        return completeHTML
    end


    def generateCss()
        completeCss = ""
        completeCSS = completeCss + Box.new(0).generateCSS()            
        return completeCSS
    end
end