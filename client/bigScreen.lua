local screenTarget, bigScreenScaleform = -1, -1
local bigScreenRender, isBigScreenLoaded = false, false
local renderTargetName = 'casinoscreen_02' -- Do not edit

local function registerTarget(name, objectModel)
    if not IsNamedRendertargetRegistered(name) then
        RegisterNamedRendertarget(name, false)
    end

    if not IsNamedRendertargetLinked(objectModel) then
        LinkNamedRendertarget(objectModel)
    end

    return GetNamedRendertargetRenderId(name)
end

local function loadBigScreen()
    screenTarget = registerTarget(renderTargetName, `vw_vwint01_betting_screen`)
    
    bigScreenScaleform = RequestScaleformMovie('HORSE_RACING_WALL')

    while not HasScaleformMovieLoaded(bigScreenScaleform) do
        Wait(0)
    end

    BeginScaleformMovieMethod(bigScreenScaleform, 'SHOW_SCREEN')
    ScaleformMovieMethodAddParamInt(0)
    EndScaleformMovieMethod()
    SetScaleformFitRendertarget(bigScreenScaleform, true)

    Utils.AddHorses(bigScreenScaleform)

    isBigScreenLoaded = true
end

function Utils:HandleBigScreen()
    CreateThread(function()
        while not self.InsideTrackActive do
            Wait(0)

            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local distance = #(playerCoords - Utils.BigScreen.coords)
            
            if (distance <= 30.0) then
                if not isBigScreenLoaded then
                    loadBigScreen()
                end

                if not bigScreenRender then
                    bigScreenRender = true
                end

                if (screenTarget ~= -1) and (bigScreenScaleform ~= -1) then
                    SetTextRenderId(screenTarget)
                    SetScriptGfxDrawOrder(4)
                    SetScriptGfxDrawBehindPausemenu(true)
                    DrawScaleformMovieFullscreen(bigScreenScaleform, 255, 255, 255, 255)
                    SetTextRenderId(GetDefaultScriptRendertargetRenderId())
                end
            elseif bigScreenRender then
                bigScreenRender = false
                isBigScreenLoaded = false
                
                SetScaleformMovieAsNoLongerNeeded(bigScreenScaleform)
            end
        end
    end)
end

do
    if not Utils.BigScreen.enable then
        return
    end

    Utils:HandleBigScreen()
end