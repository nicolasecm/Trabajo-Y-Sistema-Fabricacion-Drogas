local sx,sy = guiGetScreenSize()
local px,py = 1440,900
local x,y =  (sx/px), (sy/py)
local panelTrabajoFabri = false
--------MARKER----------
markertFabriDrog = createMarker (-52.1240234375, 60.8701171875, 2.1171875, "cylinder",1.8, 227, 13, 13, 255 )
createBlip ( -52.1240234375, 60.8701171875, 2.1171875 ,56, 1, 255, 0, 0, 255, 0, 300 )

function PanelFabricante()
    window = guiCreateWindow(x*456, y*212, x*520, y*452, "Trabajo Fabricante de drogas", false)
    guiWindowSetSizable(window, false)
	panelTrabajoFabri = true
    local obtenernombreinicio = getPlayerName(getLocalPlayer())	
    memomision1 = guiCreateMemo(x*10, y*25, x*242, y*417, "" .. obtenernombreinicio ..  " a partir de ahora trabajaras como fabricante de drogas, tu decides si aceptar o no", false, window)
    guiMemoSetReadOnly(memomision1, true)
    botonaceptar = guiCreateButton(x*279, y*25, x*227, y*76, "Aceptar Trabajo", false, window)
    botonsalir = guiCreateButton(x*278, y*339, x*228, y*82, "Salir", false, window)
    
	showCursor(true)
	addEventHandler("onClientGUIClick", botonaceptar, empezartTrafi, false)
	addEventHandler("onClientGUIClick", botonaceptar, textoInicioTraf, false)
	addEventHandler("onClientGUIClick", botonaceptar, salir1, false)	
	addEventHandler("onClientGUIClick", botonsalir, salir1, false)
end

function textoInicioTraf(p)
	addEventHandler ("onClientRender", getRootElement(), IniciarTrabajo)
	setTimer(function() removeEventHandler("onClientRender",getRootElement(),IniciarTrabajo) end,8000,1)
end

function empezartTrafi ()
	showCursor(false)
	triggerServerEvent ( "CambiarTeamTrabajoFabricante", getLocalPlayer() ) 
	triggerServerEvent ( "CambiarOcupacionFabricante", getLocalPlayer() )
end

function IniciarTrabajo ()
    dxDrawText("Trabajo iniciado", 212, 611, 820, 646, tocolor(0, 0, 0, 255), 1.6, "sans", "center", "center", false, false, true, false, false)
    dxDrawText("Trabajo iniciado!", 212, 609, 820, 644, tocolor(0, 0, 0, 255), 1.6, "sans", "center", "center", false, false, true, false, false)
    dxDrawText("Trabajo iniciado!", 210, 611, 818, 646, tocolor(0, 0, 0, 255), 1.6, "sans", "center", "center", false, false, true, false, false)
    dxDrawText("Trabajo iniciado!", 210, 609, 818, 644, tocolor(0, 0, 0, 255), 1.6, "sans", "center", "center", false, false, true, false, false)
    dxDrawText("Trabajo iniciado!", 211, 610, 819, 645, tocolor(227, 13, 13, 255),1.6, "sans", "center", "center", false, false, true, false, false)
end

function salir1()
	showCursor(false)
	destroyElement(window)
	panelTrabajoFabri = false
end

addEventHandler('onClientMarkerHit', markertFabriDrog,
function ( hitPlayer )
    if ( getElementType ( hitPlayer ) == "player" ) and ( hitPlayer == localPlayer ) then
		if(getElementData(localPlayer, "Ocupacion" ) == "Fabricante de drogas") then
			outputChatBox("[Fabrica]#ffffffUsted ya tiene este trabajo", 227, 13, 13,true)
			else
			if(isPedInVehicle (getLocalPlayer()))then
				outputChatBox("[Fabrica]#ffffffNo puedes usarlo si estas en un vehiculo", 227, 13, 13,true)
			else
			if(getElementData(localPlayer, "Ocupacion" ) == "Civil") then
				if(panelTrabajoFabri== false)then
					PanelFabricante()
				end
				else
					outputChatBox("[Fabrica]#ffffff tienes que ser civil para tener este trabajo, usa el comando /civil", 227, 13, 13,true)
				end
			end
		end
    end
end )