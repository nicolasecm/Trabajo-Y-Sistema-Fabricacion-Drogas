local sx,sy = guiGetScreenSize()
local px,py = 1440,900
local x,y =  (sx/px), (sy/py)
local Precio = nil
local panelVentSemi = false
markertVentaSemillas = createMarker ( -31.95703125, 55.24609375, 2.1171875, "cylinder",1.8, 227, 13, 13, 255 )

function CargarDatosSemi (Mostrar)
Precio = Mostrar
end
addEvent( "CargarDatosSemi", true)
addEventHandler( "CargarDatosSemi", getRootElement(), CargarDatosSemi)

function PanelSemillas()
	window3 = guiCreateWindow(x*615, y*261, x*209, y*344, "Venta de semillas", false)
	guiWindowSetSizable(window3, false)
	panelVentSemi = true
	local cantSemillasPanS = nil
	cantSemillasPanS = getElementData(localPlayer,"semillas")
    labelSemillas = guiCreateLabel(x*38, y*47, x*140, y*32, "Semillas Actuales: " .. cantSemillasPanS, false, window3)
    guiSetFont(labelSemillas, "default-bold-small")
    laberPrecSemillas = guiCreateLabel(x*38, y*79, x*140, y*28, "Valor 1 Semilla: ".. Precio, false, window3)
    guiSetFont(laberPrecSemillas, "default-bold-small")    
    BotonUnaSemilla = guiCreateButton(x*22, y*117, x*161, y*57, "Comprar 1 Semilla", false, window3)
    BotonDiezSemillas = guiCreateButton(x*22, y*190, x*161, y*57, "Comprar 10 Semilla", false, window3)
    BotonSalirS = guiCreateButton(x*22, y*261, x*160, y*52, "Salir", false, window3)
	
	showCursor(true)
	addEventHandler("onClientGUIClick", BotonSalirS, salir3, false)
	addEventHandler("onClientGUIClick", BotonUnaSemilla, CompUnaSem, false)
	addEventHandler("onClientGUIClick", BotonUnaSemilla, salir3, false)
	addEventHandler("onClientGUIClick", BotonDiezSemillas, CompDiezSem, false)
	addEventHandler("onClientGUIClick", BotonDiezSemillas, salir3, false)
end

function CompUnaSem()
local cantidadDinero = getPlayerMoney()
local valor = tonumber(Precio)
if (cantidadDinero>=valor) then
	triggerServerEvent ( "quitarPlataServer", getLocalPlayer(),valor)
	local cantSemil = getElementData(localPlayer,"semillas")
	setElementData(localPlayer, "semillas", cantSemil + 1)
	outputChatBox("[Tienda]#ffffffCompraste 1 semilla", 227, 13, 13,true)	
	else
	outputChatBox("[Tienda]#ffffffNo tienes la cantidad de dinero suficiente para comprar 1 semilla", 227, 13, 13,true)	
	end
end

function CompDiezSem()
local cantidadDinero = getPlayerMoney()
local valor = tonumber(Precio)
if (cantidadDinero>=valor*10) then
	local cantSemil = getElementData(localPlayer,"semillas")
	setElementData(localPlayer, "semillas", cantSemil + 10)
	triggerServerEvent ( "quitarPlataServer", getLocalPlayer(),valor*10)
	outputChatBox("[Tienda]#ffffffCompraste 10 semilla", 227, 13, 13,true)	
	else
	outputChatBox("[Tienda]#ffffffNo tienes la cantidad de dinero suficiente para comprar 10 semilla", 227, 13, 13,true)	
	end
end

function salir3()
	showCursor(false)
	destroyElement(window3)
	panelVentSemi = false
end

addEventHandler('onClientMarkerHit', markertVentaSemillas,
function ( hitPlayer )
    if ( getElementType ( hitPlayer ) == "player" ) and ( hitPlayer == localPlayer ) then
		if(getElementData(localPlayer, "Ocupacion" ) == "Fabricante de drogas") then
			if(panelVentSemi == false)then
				if(isPedInVehicle (getLocalPlayer()))then
					outputChatBox("[Tienda]#ffffffNo puedes interactuar si estas en un vehiculo", 227, 13, 13,true)
				else
					triggerEvent("SolicitarDatosXml",getLocalPlayer(),"Semillas")
					PanelSemillas()
				end
			end
		else
			outputChatBox("[Tienda]#ffffffNo puedes comprar si no eres Fabricante de drogas",227, 13, 13,true)		
		end
	end
end)