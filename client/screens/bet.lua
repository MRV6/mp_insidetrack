function Utils:ShowBetScreen()
    BeginScaleformMovieMethod(self.Scaleform, 'SHOW_SCREEN')
    ScaleformMovieMethodAddParamInt(3)
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(self.Scaleform, 'SET_BETTING_VALUES')
    ScaleformMovieMethodAddParamInt(0) -- Unk

    ScaleformMovieMethodAddParamInt(0)
    ScaleformMovieMethodAddParamInt(0)
    ScaleformMovieMethodAddParamInt(0)
    EndScaleformMovieMethod()

    self.BetVisible = true
end

function Utils:UpdateBetValues(bet, balance, gain)
    BeginScaleformMovieMethod(self.Scaleform, 'SET_BETTING_VALUES')
    ScaleformMovieMethodAddParamInt(0) -- Unk (Probably selected horse index)

    ScaleformMovieMethodAddParamInt(bet) -- Bet
    ScaleformMovieMethodAddParamInt(balance) -- Current balance
    ScaleformMovieMethodAddParamInt(gain) -- Gain
    EndScaleformMovieMethod()
end