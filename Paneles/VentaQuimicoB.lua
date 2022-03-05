local sx,sy = guiGetScreenSize()
local px,py = 1440,900
local x,y =  (sx/px), (sy/py)
local Precio = nil
local panelVentQuimB = false

markertVentaQuimicosB = createMarker ( 122.2587890625, -319.599609375, 0.578125, "cylinder",1.8, 227, 13, 13, 255 )
createBlip (122.326171875, -308.61328125, 1.578125,23, 1, 255, 0, 0, 255, 0, 300)
function CargarDatosQuimicoB (Mostrar)
Precio = Mostrar
end
addEvent( "CargarDatosQuimicoB", true)
addEventHandler( "CargarDatosQuimicoB", getRootElement(), CargarDatosQuimicoB)

function PanelQuimicoB()
	window9 = guiCreateWindow(x*615, y*261, x*209, y*344, "Venta de Quimico B", false)
	guiWindowSetSizable(window9, false)
	panelVentQuimB = true
	local cantSemillasPanS = nil
	cantQuimicoB = getElementData(localPlayer,"quimicoB")
    labelSemillas = guiCreateLabel(x*38, y*47, x*140, y*32, "Quimico B Actual: " .. cantQuimicoB, false, window9)
    guiSetFont(labelSemillas, "default-bold-small")
    laberPrecSemillas = guiCreateLabel(x*38, y*79, x*140, y*28, "Valor 1 Quimico B: ".. Precio, false, window9)
    guiSetFont(laberPrecSemillas, "default-bold-small")    
    BotonUnaQB = guiCreateButton(x*22, y*117, x*161, y*57, "Comprar 1 Quimico B", false, window9)
    BotonDiezQB = guiCreateButton(x*22, y*190, x*161, y*57, "Comprar 10 Quimicos B", false, window9)
    BotonSalirQB = guiCreateButton(x*22, y*261, x*160, y*52, "Salir", false, window9)
	
	showCursor(true)
	addEventHandler("onClientGUIClick", BotonSalirQB, salir9, false)
	addEventHandler("onClientGUIClick", BotonUnaQB, CompUnQuimB, false)
	addEventHandler("onClientGUIClick", BotonUnaQB, salir9, false)
	addEventHandler("onClientGUIClick", BotonDiezQB, CompDiezQuimB, false)
	addEventHandler("onClientGUIClick", BotonDiezQB, salir9, false)
end

function CompUnQuimB()
local cantidadDinero = getPlayerMoney()
local valor = tonumber(Precio)
if (cantidadDinero>=valor) then
	triggerServerEvent ( "quitarPlataServer", getLocalPlayer(),valor)
	local cantSemil = getElementData(localPlayer,"quimicoB")
	setElementData(localPlayer, "quimicoB", cantSemil + 1)
	outputChatBox("[Laboratorio]#ffffffCompraste 1 Quimico B", 227, 13, 13,true)	
	else
	outputChatBox("[Laboratorio]#ffffffNo tienes la cantidad de dinero suficiente para comprar 1 Quimico B", 227, 13, 13,true)	
	end
end

function CompDiezQuimB()
local cantidadDinero = getPlayerMoney()
local valor = tonumber(Precio)
if (cantidadDinero>=valor*10) then
	local cantSemil = getElementData(localPlayer,"quimicoB")
	setElementData(localPlayer, "quimicoB", cantSemil + 10)
	triggerServerEvent ( "quitarPlataServer", getLocalPlayer(),valor*10)
	outputChatBox("[Laboratorio]#ffffffCompraste 10 Quimicos B", 227, 13, 13,true)	
	else
	outputChatBox("[Laboratorio]#ffffffNo tienes la cantidad de dinero suficiente para comprar 10 Quimicos B", 227, 13, 13,true)	
	end
end

function salir9()
	showCursor(false)
	destroyElement(window9)
	panelVentQuimB = false
end

addEventHandler('onClientMarkerHit', markertVentaQuimicosB,
function ( hitPlayer )
    if ( getElementType ( hitPlayer ) == "player" ) and ( hitPlayer == localPlayer ) then
		if(getElementData(localPlayer, "Ocupacion" ) == "Fabricante de drogas") then
			if(panelVentQuimB == false)then
				if(isPedInVehicle (getLocalPlayer()))then
					outputChatBox("[Laboratorio]#ffffffNo puedes interactuar si estas en un vehiculo", 227, 13, 13,true)
				else
					triggerEvent("SolicitarDatosXml",getLocalPlayer(),"QuimicoB")
					PanelQuimicoB()
				end
			end
		else
			outputChatBox("[Laboratorio]#ffffffNo puedes comprar si no eres Fabricante de drogas",227, 13, 13,true)		
		end
	end
end)