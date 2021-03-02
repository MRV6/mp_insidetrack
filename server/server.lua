-- Don't edit this file
local neededGameBuild = 2189
local currentGameBuild = GetConvarInt('sv_enforceGameBuild', 1604)

Citizen.CreateThread(function()
	if (currentGameBuild ~= neededGameBuild) then
		print('^3['..GetCurrentResourceName()..']^0: You need to use ^3' .. neededGameBuild .. '^0 game build to use this resource.')
	end
end)