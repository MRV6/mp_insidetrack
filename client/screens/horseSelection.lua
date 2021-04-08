function Utils:ShowHorseSelection()
    self.ChooseHorseVisible = true

    BeginScaleformMovieMethod(self.Scaleform, 'SHOW_SCREEN')
    ScaleformMovieMethodAddParamInt(1)
    EndScaleformMovieMethod()
end

function Utils.AddHorses(scaleform)
    for i = 1, 6 do
        local name = Utils.GetRandomHorseName()

        BeginScaleformMovieMethod(scaleform, 'SET_HORSE')
        ScaleformMovieMethodAddParamInt(i) -- Horse index

        -- Horse name
        BeginTextCommandScaleformString(name)
        EndTextCommandScaleformString()

        ScaleformMovieMethodAddParamPlayerNameString('Cool Horse')

        -- Horse style (TODO: Random preset, different one for each horse)
        ScaleformMovieMethodAddParamInt(Utils.HorseStyles[i][1])
        ScaleformMovieMethodAddParamInt(Utils.HorseStyles[i][2])
        ScaleformMovieMethodAddParamInt(Utils.HorseStyles[i][3])
        ScaleformMovieMethodAddParamInt(Utils.HorseStyles[i][4])
        EndScaleformMovieMethod()
    end
end