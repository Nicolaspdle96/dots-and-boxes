require 'sinatra'

class Box

    attr_reader :numberIdentifier, :upSide, :downSide, :leftSide, :rightSide, :borderColorUp, :borderColorDown, :borderColorLeft, :borderColorRight, :backgroundColor
   
    def initialize(numberIdentifier)
        @numberIdentifier = numberIdentifier
        @upSide = false
        @downSide = false
        @leftSide = false
        @rightSide = false

        @borderColorUp = "pink"
        @borderColorDown = "pink"
        @borderColorLeft = "pink"
        @borderColorRight = "pink"
        
        @backgroundColor = "red"

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

    def borderColorUp=(value)              
        @borderColorUp = value
    end

    def borderColorDown=(value)              
        @borderColorDown = value
    end

    def borderColorLeft=(value)              
        @borderColorLeft = value
    end

    def borderColorRight=(value)              
        @borderColorRight = value
    end

    def backgroundColor=(value)              
        @backgroundColor = value
    end

    def isEmpty()
        @leftSide == false and @rightSide == false and @upSide == false and @downSide == false ?  true :  false
    end

    def generateHtml()
        return  "<div class=box" +  @numberIdentifier.to_s + ">" + @numberIdentifier.to_s +  "</div>"
    end

    def generateCss()
        cssInit =  "<style>" 
        cssClassBox = ".box"
        cssID = numberIdentifier.to_s + "{" 
        cssContent = "width: 100px;
                      height: 100px;
                      line-height: 100px;
                      border-style: solid;
                      border-color: rgb(0,0,0,0.1);
                      text-align: center;
                      display: inline-block;"
        cssClssBoxEnd = "}"
        cssEnd = "</style>"

        if @upSide == true then 
            cssContent += "border-top-color:" + @borderColorUp + ";"
        end
        if @downSide == true then
            cssContent += "border-bottom-color:" + @borderColorDown + ";"
        end
        if @leftSide == true then
            cssContent += "border-left-color:" + @borderColorLeft + ";"
        end
        if @rightSide == true then
            cssContent += "border-right-color:"+ @borderColorRight + ";"
        end
        
        if isCompleted() then
            cssContent += "background-color:"+ @backgroundColor + ";"
        end

        completeCss = cssInit + cssClassBox + cssID + cssContent + cssEnd
    
        return completeCss
    end

    def isCompleted()
        @upSide == true and @downSide == true and @leftSide == true and @rightSide == true ? true : false
    end

    def renderHTMLandCSS()
        return generateHtml() + generateCss()
    end

end