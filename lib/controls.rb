class Controls 

    def returnHTML()
        completeHTML = ""
        initForm = "<form method='get' action='/pvsp'>"
        input = "<input type='number' name='box'/>"
        upButton = "<input class='btn btn-primary' type='submit' value='up' name='direction'>"
        downButton = "<input class='btn btn-success' type='submit' value='down' name='direction'>"
        leftButton = "<input class='btn btn-info' type='submit' value='left' name='direction'>"
        rightButton = "<input class='btn btn-danger' type='submit' value='right' name='direction'>"
        finalForm = "</form'>"

        completeHTML = initForm + input + upButton + downButton + leftButton + rightButton + finalForm
        return completeHTML
    end
    
end