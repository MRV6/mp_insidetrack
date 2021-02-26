function Utils:ShowBetScreen(horse)
    BeginScaleformMovieMethod(self.Scaleform, 'SHOW_SCREEN')
    ScaleformMovieMethodAddParamInt(3)
    EndScaleformMovieMethod()

    self:UpdateBetValues(horse, 0, 0, 0)
    self.BetVisible = true
end

function Utils:UpdateBetValues(horse, bet, balance, gain)
    BeginScaleformMovieMethod(self.Scaleform, 'SET_BETTING_VALUES')
    ScaleformMovieMethodAddParamInt(horse) -- Horse index

    ScaleformMovieMethodAddParamInt(bet) -- Bet
    ScaleformMovieMethodAddParamInt(balance) -- Current balance
    ScaleformMovieMethodAddParamInt(gain) -- Gain
    EndScaleformMovieMethod()
end