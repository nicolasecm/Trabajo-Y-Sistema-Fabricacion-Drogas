local sx,sy = guiGetScreenSize()
local px,py = 1440,900
local x,y =  (sx/px), (sy/py)
local bindDro = nil 

function CargarDatosBindPanDrog (BindReci)
bindDro = BindReci
end
addEvent( "CargarDatosBindPanDrog", true)
addEventHandler( "CargarDatosBindPanDrog", getRootElement(), CargarDatosBindPanDrog)

local server = setmetatable(
		{},
		{
			__index = function(t, k)
				t[k] = function(...) triggerServerEvent('onServerCall', resourceRoot, k, ...) end
				return t[k]
			end
		}
	)

function iniciarPanelLoginDrogas()
setTimer ( function()
		PanelDrogas()
		destruirPanelEntrada()
	end , 1000 , 1 )
end
addEvent( "iniciarPanelLoginDrogas", true)
addEventHandler( "iniciarPanelLoginDrogas", getRootElement(), iniciarPanelLoginDrogas)

function PanelDrogas()
	window13 = guiCreateWindow(x*402, y*263, x*675, y*243, "Drogas", false)
    guiWindowSetSizable(window13, false)
	guiSetAlpha(window13, 0.75)
	triggerEvent("SolicitarDatosXml",getLocalPlayer(),"BindVerDrogas")
	
	BotonUsarMeta = guiCreateButton(x*573, y*34, x*89, y*44, "Usar", false, window13)
    BotonUsarMari = guiCreateButton(x*573, y*88, x*89, y*44, "Usar", false, window13)
    BotonUsarExta = guiCreateButton(x*573, y*142, x*89, y*44, "Usar", false, window13)
    BotonUsarCrac = guiCreateButton(x*573, y*196, x*89, y*44, "Usar", false, window13)
    LabelInfoMeta = guiCreateLabel(x*69, y*44, x*494, y*34, "Metanfetamina: Velocidad Extra ", false, window13)
    guiSetFont(LabelInfoMeta, "default-bold-small")
	guiLabelSetColor(LabelInfoMeta, 8,8,255)
    LabelCantMeta = guiCreateLabel(x*21, y*44, x*48, y*34, "", false, window13)
    guiSetFont(LabelCantMeta, "default-bold-small")
    LabelCantidad = guiCreateLabel(x*17, y*25, x*58, y*24, "Cantidad", false, window13)
    guiSetFont(LabelCantidad, "default-bold-small")
    LabelInfoMari = guiCreateLabel(x*69, y*97, x*494, y*34, "Marihuana: Todo va mas lento ", false, window13)
    guiSetFont(LabelInfoMari, "default-bold-small")
	guiLabelSetColor(LabelInfoMari, 2,145,0)
    LabelCantMari = guiCreateLabel(x*21, y*97, x*48, y*34, "", false, window13)
    guiSetFont(LabelCantMari, "default-bold-small")
    LabelInfoExta = guiCreateLabel(x*69, y*151, x*494, y*34, "Extasis: Vida Extra ", false, window13)
    guiSetFont(LabelInfoExta, "default-bold-small")
	guiLabelSetColor(LabelInfoExta, 255, 135, 0)
    LabelCantExta = guiCreateLabel(x*21, y*151, x*48, y*34, "", false, window13)
    guiSetFont(LabelCantExta, "default-bold-small")
    LabelInfoCrack = guiCreateLabel(x*69, y*206, x*494, y*34, "Crack: Armadura Extra", false, window13)
    guiSetFont(LabelInfoCrack, "default-bold-small")
	guiLabelSetColor(LabelInfoCrack, 255, 0, 0)
    LabelCantCrack = guiCreateLabel(x*21, y*206, x*48, y*34, "", false, window13)
    guiSetFont(LabelCantCrack, "default-bold-small")
	setTimer(
		function() 
			guiSetText ( LabelCantMeta, "".. getElementData(localPlayer,"Metanfetamina") or 0 .."" )  
			guiSetText ( LabelCantMari, "".. getElementData(localPlayer,"Marihuana") or 0 .."" )  
			guiSetText ( LabelCantExta, "".. getElementData(localPlayer,"Extasis") or 0 .."" )  
			guiSetText ( LabelCantCrack, "".. getElementData(localPlayer,"Crack") or 0 .."" )  
		end,500,0)
	showCursor(true)
	addEventHandler("onClientGUIClick", BotonUsarMeta, UsoDrogaMeta, false)
	addEventHandler("onClientGUIClick", BotonUsarMari, UsoDrogaMari, false)
	addEventHandler("onClientGUIClick", BotonUsarExta, UsoDrogaExta, false)
	addEventHandler("onClientGUIClick", BotonUsarCrac, UsoDrogaCrack, false)
	repeat until bindKey(bindDro,"down",function()
		togglePanel(not guiGetVisible(window13))
	end )
end

function UsoDrogaMeta()
local UsDrogMet = getElementData(localPlayer,"UsandoMetanfetamina")
local CantDrogMet = getElementData(localPlayer,"Metanfetamina")
	if(UsDrogMet == 0) then
		if(CantDrogMet > 0)then
			setGameSpeed(1.3)
			setElementData(localPlayer,"UsandoMetanfetamina",UsDrogMet+1)
			TemporizadorMetanfetamina(nil,nil,40,"%02s")
			setElementData(localPlayer,"Metanfetamina",CantDrogMet-1)
		else
			outputChatBox("No tienes Metanfetamina para usar", 255, 0, 0,true)
		end
	else
		outputChatBox("Toma una droga a la vez", 255, 0, 0,true)	
	end
end

function CancelarDrogaMeta()
	setGameSpeed(1.0)
	setElementData(localPlayer,"UsandoMetanfetamina",0)
end

function UsoDrogaMari()
local UsDrogMar = getElementData(localPlayer,"UsandoMarihuana")
local CantDrogMar = getElementData(localPlayer,"Marihuana")
	if(UsDrogMar == 0) then
		if(CantDrogMar > 0)then
			setGameSpeed(0.8)
			server.setPedGravity(localPlayer, 0.004)
			local UsDrogMa = getElementData(localPlayer,"UsandoMarihuana")
			setElementData(localPlayer,"UsandoMarihuana",UsDrogMa+1)
			TemporizadorMarihuana(nil,nil,40,"%02s")
			setElementData(localPlayer,"Marihuana",CantDrogMar-1)
		else
			outputChatBox("No tienes Marihuana para usar", 255, 0, 0,true)
		end
	else
		outputChatBox("Toma una droga a la vez", 255, 0, 0,true)
	end
end

	function CancelarDrogaMari()
		if(getElementData(localPlayer,"UsandoMetanfetamina") ~= 0) then
			server.setPedGravity(localPlayer, 0.008)
			setElementData(localPlayer,"UsandoMarihuana",0)
		else
			setGameSpeed(1.0)
			server.setPedGravity(localPlayer, 0.008)
			setElementData(localPlayer,"UsandoMarihuana",0)
		end
	end

function UsoDrogaExta()
local UsDrogExt = getElementData(localPlayer,"UsandoExtasis")
local CantDrogExt = getElementData(localPlayer,"Extasis")
	if(UsDrogExt == 0) then
		if (CantDrogExt > 0)then
			local UsDrogMa = getElementData(localPlayer,"UsandoExtasis")
			setElementData(localPlayer,"UsandoExtasis",UsDrogMa+1)
			server.setPedStat(localPlayer, 24, 785)
			triggerServerEvent( "DarVidaExtasis", getLocalPlayer())
			TemporizadorExtasis(nil,nil,40,"%02s")
			setElementData(localPlayer,"Extasis",CantDrogExt-1)
		else
			outputChatBox("No tienes Extasis para usar", 255, 0, 0,true)
		end
	else
		outputChatBox("Toma una droga a la vez", 255, 0, 0,true)
	end
end

function CancelarDrogaExta()
	setElementData(localPlayer,"UsandoExtasis",0)
	if(getElementHealth(localPlayer) > 100)then
		triggerServerEvent( "CambiarVidaJugador", getLocalPlayer())
	end
	server.setPedStat(localPlayer, 24, 569)
end

function UsoDrogaCrack()
local UsDrogCra = getElementData(localPlayer,"UsandoCrack")
local CantDrogCra = getElementData(localPlayer,"Crack")
	if(UsDrogCra == 0) then
		if (CantDrogCra > 0)then
			local UsDrogMa = getElementData(localPlayer,"UsandoCrack")
			setElementData(localPlayer,"UsandoCrack",UsDrogMa+1)
			triggerServerEvent( "DarArmaduraCrack", getLocalPlayer())
			TemporizadorCrack(nil,nil,40,"%02s")
			setElementData(localPlayer,"Crack",CantDrogCra-1)
		else
			outputChatBox("No tienes Crack para usar", 255, 0, 0,true)
		end
	else
		outputChatBox("Toma una droga a la vez", 255, 0, 0,true)
	end
end

function CancelarDrogaCrack()
	setElementData(localPlayer,"UsandoCrack",0)
	if(getPedArmor(localPlayer) > 100)then
		triggerServerEvent( "CambiarArmaduraJugador", getLocalPlayer())
	end
end

function TemporizadorMetanfetamina(hh, mm, ss, format)
    local function convertSecondsToMinutes(ms)
        local hours = math.floor (ms/3600000)
        local mins = math.floor (ms/60000)
        local secs = math.floor ((ms/1000) % 60)
        return string.format ( format, secs ) 
    end 
    local function countdownFin() 
		CancelarDrogaMeta()
    end 
    direction = 0
    if (direction ~= nil) then
        if (ss ~= nil) then
            if (ss <= 60) and ((ss >= 0)) then
                ss = ss * 1000
                direction = direction + ss
            else
                direction = nil
            end
        end
    end
    if (direction ~= nil) then
        countDownTimesDMe = (direction / 1000) -- Convert direction into seconds to prevent debug warnings by setTimer function
        countdownDme = setTimer(countdownFin, direction+1000, 1)
    end
    local function drawText(text)
        local function drawTextZG()
            dxDrawText("|Metanfetamina:"..text.."|", x*293, y*1, x*526, y*30, tocolor(255, 255, 255, 255), 0.70, "bankgothic", "left", "top", false, false, true, false, false)		
		end
        addEventHandler ( "onClientPreRender", root, drawTextZG) -- draw evrey screen render
        setTimer(
            function()
                removeEventHandler ( "onClientPreRender", root, drawTextZG) -- remove text after each second
            end
        , 1000, 1) -- do this function evrey second once
    end
    if (direction ~= nil) then
        setTimer( 
            function() 
                drawText(convertSecondsToMinutes(getTimerDetails(countdownDme))) -- sends hh:mm:ss foramt to dx draw function
            end
        , 1000, countDownTimesDMe-1)
    end
end

function TemporizadorMarihuana(hh, mm, ss, format)
    local function convertSecondsToMinutes(ms)
        local hours = math.floor (ms/3600000)
        local mins = math.floor (ms/60000)
        local secs = math.floor ((ms/1000) % 60)
        return string.format ( format, secs )
    end 
    local function countdownFin() 
		CancelarDrogaMari()
    end 
    direction = 0
    if (direction ~= nil) then
        if (ss ~= nil) then
            if (ss <= 60) and ((ss >= 0)) then
                ss = ss * 1000
                direction = direction + ss
            else
                direction = nil
            end
        end
    end
    if (direction ~= nil) then
        countDownTimesDMa = (direction / 1000)
        countdownDMa = setTimer(countdownFin, direction+1000, 1)
    end
    local function drawText(text)
        local function drawTextZG()
            dxDrawText("|Marihuana:".. text.."|", x*506, y*1, x*739, y*30, tocolor(255, 255, 255, 255), 0.70, "bankgothic", "left", "top", false, false, true, false, false)		
		end
        addEventHandler ( "onClientPreRender", root, drawTextZG)
        setTimer(
            function()
                removeEventHandler ( "onClientPreRender", root, drawTextZG)
            end
        , 1000, 1)
    end
    if (direction ~= nil) then
        setTimer( 
            function() 
                drawText(convertSecondsToMinutes(getTimerDetails(countdownDMa)))
            end
        , 1000, countDownTimesDMa-1)
    end
end

function TemporizadorExtasis(hh, mm, ss, format)
    local function convertSecondsToMinutes(ms)
        local hours = math.floor (ms/3600000)
        local mins = math.floor (ms/60000)
        local secs = math.floor ((ms/1000) % 60)
        return string.format ( format, secs )
    end 
    local function countdownFin() 
		CancelarDrogaExta()
    end 
    direction = 0
    if (direction ~= nil) then
        if (ss ~= nil) then
            if (ss <= 60) and ((ss >= 0)) then
                ss = ss * 1000
                direction = direction + ss
            else
                direction = nil
            end
        end
    end
    if (direction ~= nil) then
        countDownTimesDEx = (direction / 1000)
        countdownDEx = setTimer(countdownFin, direction+1000, 1)
    end
    local function drawText(text)
        local function drawTextZG()
            dxDrawText("|Extasis:".. text.."|", x*674, y*1, x*907, y*30, tocolor(255, 255, 255, 255), 0.70, "bankgothic", "left", "top", false, false, true, false, false)		
		end
        addEventHandler ( "onClientPreRender", root, drawTextZG)
        setTimer(
            function()
                removeEventHandler ( "onClientPreRender", root, drawTextZG)
            end
        , 1000, 1)
    end
    if (direction ~= nil) then
        setTimer( 
            function() 
                drawText(convertSecondsToMinutes(getTimerDetails(countdownDEx)))
            end
        , 1000, countDownTimesDEx-1)
    end
end

function TemporizadorCrack(hh, mm, ss, format)
    local function convertSecondsToMinutes(ms)
        local hours = math.floor (ms/3600000)
        local mins = math.floor (ms/60000)
        local secs = math.floor ((ms/1000) % 60)
        return string.format ( format, secs )
    end 
    local function countdownFin() 
		CancelarDrogaCrack()
    end 
    direction = 0
    if (direction ~= nil) then
        if (ss ~= nil) then
            if (ss <= 60) and ((ss >= 0)) then
                ss = ss * 1000
                direction = direction + ss
            else
                direction = nil
            end
        end
    end
    if (direction ~= nil) then
        countDownTimesDCr = (direction / 1000)
        countdownDCr = setTimer(countdownFin, direction+1000, 1)
    end
    local function drawText(text)
        local function drawTextZG()
            dxDrawText("|Crack:".. text.."|", x*805, y*1, x*1038, y*30, tocolor(255, 255, 255, 255), 0.70, "bankgothic", "left", "top", false, false, true, false, false)		
		end
        addEventHandler ( "onClientPreRender", root, drawTextZG)
        setTimer(
            function()
                removeEventHandler ( "onClientPreRender", root, drawTextZG)
            end
        , 1000, 1)
    end
    if (direction ~= nil) then
        setTimer( 
            function() 
                drawText(convertSecondsToMinutes(getTimerDetails(countdownDCr)))
            end
        , 1000, countDownTimesDCr-1)
    end
end

function getAccountName(p)
	return getElementData(p,"Cuenta") or false
end

function togglePanel(Vis)
		if Vis == false then
			guiSetVisible(window13,false)
			showCursor(false)
			guiSetInputMode("allow_binds")
		else
			if getAccountName(localPlayer) ~= false then
				guiSetVisible(window13,true)
				showCursor(true)
				guiSetInputMode("no_binds_when_editing")
			else
				outputChatBox("Usted debe estar logueado para abrir el panel!")
			end
		end
end

function destruirPanelEntrada()
	showCursor(false)
	guiSetVisible(window13,false)
end