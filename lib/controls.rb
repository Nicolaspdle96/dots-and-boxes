class Controls 

    def initialize()
    end

    def returnHTML()
        completeHTML = ""
        initForm = "<form method='get' action='/pvsp'>"
        input = "<input type='number' name='box'/>"
        upButton = "<input type='submit' value='up' name='direction'>"
        downButton = "<input type='submit' value='down' name='direction'>"
        leftButton = "<input type='submit' value='left' name='direction'>"
        rightButton = "<input type='submit' value='right' name='direction'>"
        finalForm = "</form'>"

        completeHTML = initForm + input + upButton + downButton + leftButton + rightButton + finalForm
        return completeHTML
    end
end