Utils = {
    Scaleform = -1,
    ChooseHorseVisible = false,
    BetVisible = false
}

function Utils:GetMouseClickedButton()
    local returnValue = -1

    CallScaleformMovieMethodWithNumber(self.Scaleform, 'SET_INPUT_EVENT', 237.0, -1082130432, -1082130432, -1082130432, -1082130432)
    BeginScaleformMovieMethod(self.Scaleform, 'GET_CURRENT_SELECTION')

    returnValue = EndScaleformMovieMethodReturnValue()

    while not IsScaleformMovieMethodReturnValueReady(returnValue) do
        Wait(0)
    end

    return GetScaleformMovieMethodReturnValueInt(returnValue)
end

-- TODO: Don't return already used names.
function Utils.GetRandomHorseName()
    local random = math.random(0, 20)

    if (random < 10) then
        return 'ITH_NAME_00'..random
    else
        return 'ITH_NAME_0'..random 
    end 
end