function Utils:StartRace()
    BeginScaleformMovieMethod(self.Scaleform, 'START_RACE')
    ScaleformMovieMethodAddParamFloat(15000.0) -- Race duration (in MS)
    ScaleformMovieMethodAddParamInt(4)

    -- Add each horses by their index (win order)
    -- TODO: Random order
    ScaleformMovieMethodAddParamInt(2)
    ScaleformMovieMethodAddParamInt(4)
    ScaleformMovieMethodAddParamInt(3)
    ScaleformMovieMethodAddParamInt(1)
    ScaleformMovieMethodAddParamInt(5)
    ScaleformMovieMethodAddParamInt(6)

    ScaleformMovieMethodAddParamFloat(0.0) -- Unk
    ScaleformMovieMethodAddParamBool(false)
    EndScaleformMovieMethod()
end