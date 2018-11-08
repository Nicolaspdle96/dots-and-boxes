require 'sinatra'

class Box

    attr_reader :upSide, :downSide, :leftSide, :rightSide, :color
   
    def initialize(numberIdentifier)
        @numberIdentifier = numberIdentifier
        @upSide = false
        @downSide = false
        @leftSide = false
        @rightSide = false
        @color = "green"
    end

    def upSide=(value)              
        @upSide = value
    end

    def downSide=(value)              
        @downSide = value
    end

    def leftSide=(value)              
        @leftSide = value
    end

    def rightSide=(value)              
        @rightSide = value
    end

    def color=(value)              
        @color = value
    end

    def isEmpty()
        @leftSide == false and @rightSide == false and @upSide == false and @downSide == false ?  true :  false
    end


    def generateHTML()
        
        return  "<div class=box>" + @numberIdentifier.to_s +  "</div>"
    end

    def generateCSS()
        cssInit =  "<style>" 
        cssClassBox = ".box{"
        cssContent = "width: 50px;
                      height: 50px;
                      line-height: 50px;
                      border-style: solid;
                      text-align: center;
                      display: inline-block;"
        cssClssBoxEnd = "}"
        cssEnd = "</style>"

        if @upSide == true then 
            cssContent += "border-top-color:" + @color + ";"
        end
        if @downSide == true then
            cssContent += "border-bottom-color:" + @color + ";"
        end
        if @leftSide == true then
            cssContent += "border-left-color:" + @color + ";"
        end
        if @rightSide == true then
            cssContent += "border-right-color:"+ @color + ";"
        end

        completeCss = cssInit + cssClassBox + cssContent + cssEnd
    
        return completeCss
    end

    def setPlayer1Turn()
        @color = "red"
    end

    def setPlayer2Turn()
        @color = "blue"
    end
    

end