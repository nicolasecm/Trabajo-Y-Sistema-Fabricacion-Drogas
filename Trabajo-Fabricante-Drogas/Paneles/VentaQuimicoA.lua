local sx,sy = guiGetScreenSize()
local px,py = 1440,900
local x,y =  (sx/px), (sy/py)
local Precio = nil
local panelVentQuimA = false
markertVentaQuimicosA = createMarker ( 122.16796875, -294.3486328125, 0.578125, "cylinder",1.8, 227, 13, 13, 255 )

function CargarDatosQuimicosA (Mostrar)
Precio = Mostrar
end
addEvent( "CargarDatosQuimicoA", true)
addEventHandler( "CargarDatosQuimicoA", getRootElement(), CargarDatosQuimicosA)

function PanelQuimicoA()
	window8 = guiCreateWindow(x*615, y*261, x*209, y*344, "Venta de Quimico A", false)
	guiWindowSetSizable(window8, false)
	local cantSemillasPanS = nil
	panelVentQuimA = true
	cantQuimicoA = getElementData(localPlayer,"quimicoA")
    labelSemillas = guiCreateLabel(x*38, y*47, x*140, y*32, "Quimico A Actual: " .. cantQuimicoA, false, window8)
    guiSetFont(labelSemillas, "default-bold-small")
    laberPrecSemillas = guiCreateLabel(x*38, y*79, x*140, y*28, "Valor 1 Quimico A: ".. Precio, false, window8)
    guiSetFont(laberPrecSemillas, "default-bold-small")    
    BotonUnaQA = guiCreateButton(x*22, y*117, x*161, y*57, "Comprar 1 Quimico A", false, window8)
    BotonDiezQA = guiCreateButton(x*22, y*190, x*161, y*57, "Comprar 10 Quimicos A", false, window8)
    BotonSalirQA = guiCreateButton(x*22, y*261, x*160, y*52, "Salir", false, window8)
	
	showCursor(true)
	addEventHandler("onClientGUIClick", BotonSalirQA, salir8, false)
	addEventHandler("onClientGUIClick", BotonUnaQA, CompUnQuimA, false)
	addEventHandler("onClientGUIClick", BotonUnaQA, salir8, false)
	addEventHandler("onClientGUIClick", BotonDiezQA, CompDiezQuimA, false)
	addEventHandler("onClientGUIClick", BotonDiezQA, salir8, false)
end

function CompUnQuimA()
local cantidadDinero = getPlayerMoney()
local valor = tonumber(Precio)
if (cantidadDinero>=valor) then
	triggerServerEvent ( "quitarPlataServer", getLocalPlayer(),valor)
	local cantSemil = getElementData(localPlayer,"quimicoA")
	setElementData(localPlayer, "quimicoA", cantSemil + 1)
	outputChatBox("[Laboratorio]#ffffffCompraste 1 Quimico A", 227, 13, 13,true)	
	else
	outputChatBox("[Laboratorio]#ffffffNo tienes la cantidad de dinero suficiente para comprar 1 Quimico A", 227, 13, 13,true)	
	end
end

function CompDiezQuimA()
local cantidadDinero = getPlayerMoney()
local valor = tonumber(Precio)
if (cantidadDinero>=valor) then
	local cantSemil = getElementData(localPlayer,"quimicoA")
	setElementData(localPlayer, "quimicoA", cantSemil + 10)
	triggerServerEvent ( "quitarPlataServer", getLocalPlayer(),valor*10)
	outputChatBox("[Laboratorio]#ffffffCompraste 10 Quimicos A", 227, 13, 13,true)	
	else
	outputChatBox("[Laboratorio]#ffffffNo tienes la cantidad de dinero suficiente para comprar 10 Quimicos A", 227, 13, 13,true)	
	end
end

function salir8()
	showCursor(false)
	destroyElement(window8)
	panelVentQuimA = false
end

addEventHandler('onClientMarkerHit', markertVentaQuimicosA,
function ( hitPlayer )
    if ( getElementType ( hitPlayer ) == "player" ) and ( hitPlayer == localPlayer ) then
		if(getElementData(localPlayer, "Ocupacion" ) == "Fabricante de drogas") then
			if (panelVentQuimA == false) then
				if(isPedInVehicle (getLocalPlayer()))then
					outputChatBox("[Laboratorio]#ffffffNo puedes interactuar si estas en un vehiculo", 227, 13, 13,true)
				else
				triggerEvent("SolicitarDatosXml",getLocalPlayer(),"QuimicoA")
				PanelQuimicoA()
				end
			end
		else
			outputChatBox("[Laboratorio]#ffffffNo puedes comprar si no eres Fabricante de drogas",227, 13, 13,true)		
		end
	end
end)