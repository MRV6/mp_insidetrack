function Utils:ShowHorseSelection()
	self.ChooseHorseVisible = true

    BeginScaleformMovieMethod(self.Scaleform, 'SHOW_SCREEN')
    ScaleformMovieMethodAddParamInt(1)
    EndScaleformMovieMethod()
end

function Utils:AddHorses()
	for i = 1, 6 do
		local name = self.GetRandomHorseName()

		BeginScaleformMovieMethod(self.Scaleform, 'SET_HORSE')
		ScaleformMovieMethodAddParamInt(i) -- Horse index

		BeginTextCommandScaleformString(name) -- Horse name
		EndTextCommandScaleformString()

		ScaleformMovieMethodAddParamPlayerNameString('Just a random horse') -- 1/1

		ScaleformMovieMethodAddParamInt(2)
		ScaleformMovieMethodAddParamInt(5)
		ScaleformMovieMethodAddParamInt(4)
		ScaleformMovieMethodAddParamInt(3)
	    EndScaleformMovieMethod()

	 --    BeginScaleformMovieMethod(self.Scaleform, 'ADD_PLAYER')
	 --    ScaleformMovieMethodAddParamTextureNameString_2(name)
	 --    ScaleformMovieMethodAddParamInt(i)
		-- ScaleformMovieMethodAddParamInt(i)
	 --    EndScaleformMovieMethod()
	end
end