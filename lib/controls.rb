class Controls 

    def returnHTML()
        completeHTML = ""
        initForm = "<form method='get' action='/pvsp'>"
        input = "<input type='number' name='box'/>"
        upButton = "<input id='up' class='btn btn-primary' type='submit' value='up' name='direction'>"
        downButton = "<input id='down' class='btn btn-success' type='submit' value='down' name='direction'>"
        leftButton = "<input id='left' class='btn btn-info' type='submit' value='left' name='direction'>"
        rightButton = "<input id='right' class='btn btn-danger' type='submit' value='right' name='direction'>"
        finalForm = "</form'>"

        completeHTML = initForm + input + upButton + downButton + leftButton + rightButton + finalForm
        return completeHTML
    end
    
end