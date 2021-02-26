Utils = {
    Scaleform = -1,
    ChooseHorseVisible = false,
    BetVisible = false,
    HorseStyles = { -- There's 99 presets, but i'm fucking lazy so i've only put 6 of them (1 different for each horse)
        {15553363, 5474797, 9858144, 4671302},
        {16724530, 3684408, 14807026, 16777215},
        {13560920, 15582764, 16770746, 7500402},
        {16558591, 5090807, 10446437, 7493977},
        {5090807, 16558591, 3815994, 9393493},
        {16269415, 16767010, 10329501, 16777215}
    },
    PlayerBalance = 500,
    CurrentHorse = -1,
    CurrentBet = 100,
    CurrentGain = 1000,
    HorsesPositions = {}
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

function Utils.GetRandomHorseName()
    local random = math.random(0, 99)
    local randomName = (random < 10) and ('ITH_NAME_00'..random) or ('ITH_NAME_0'..random)
    
    return randomName
end