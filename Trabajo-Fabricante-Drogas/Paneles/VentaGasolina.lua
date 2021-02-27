local sx,sy = guiGetScreenSize()
local px,py = 1440,900
local x,y =  (sx/px), (sy/py)
local Precio = nil
local panelVentGaso = false
markertVentaGasolina1 = createMarker (1382.9296875, 464.9345703125, 19.200037002563, "cylinder",1.2, 227, 13, 13, 255 )
markertVentaGasolina2 = createMarker (661.216796875, -573.4296875, 15.3359375, "cylinder",1.2, 227, 13, 13, 255 )
markertVentaGasolina3 = createMarker (-82.720703125, -1178.9775390625, 0.9547624588013, "cylinder",1.2, 227, 13, 13, 255 )

function CargarDatosGaso(Mostrar)
Precio = Mostrar
end
addEvent( "CargarDatosGaso", true)
addEventHandler( "CargarDatosGaso", getRootElement(), CargarDatosGaso)

function PanelVGasolina()
	window7 = guiCreateWindow(x*615, y*261, x*209, y*344, "Venta de Gasolina", false)
	guiWindowSetSizable(window7, false)
	panelVentGaso = true
	local cantGalonesGasolina = getElementData(localPlayer,"galonGaso")
    labelSemillas = guiCreateLabel(x*38, y*47, x*140, y*32, "Galones Gasolina: " .. cantGalonesGasolina, false, window7)
    guiSetFont(labelSemillas, "default-bold-small")
    laberPrecSemillas = guiCreateLabel(x*38, y*79, x*140, y*28, "Valor 1 Galon: ".. Precio, false, window7)
    guiSetFont(laberPrecSemillas, "default-bold-small")    
    BotonUnaSemilla = guiCreateButton(x*22, y*117, x*161, y*57, "Comprar 1 Galon de gasolina", false, window7)
    BotonDiezSemillas = guiCreateButton(x*22, y*190, x*161, y*57, "Comprar 10 Galones de gasolina", false, window7)
    BotonSalirS = guiCreateButton(x*22, y*261, x*160, y*52, "Salir", false, window7)
	
	showCursor(true)
	addEventHandler("onClientGUIClick", BotonSalirS, salir7, false)
	addEventHandler("onClientGUIClick", BotonUnaSemilla, CompUnGalonGaso, false)
	addEventHandler("onClientGUIClick", BotonUnaSemilla, salir7, false)
	addEventHandler("onClientGUIClick", BotonDiezSemillas, CompDiezGalonGaso, false)
	addEventHandler("onClientGUIClick", BotonDiezSemillas, salir7, false)
end

function CompUnGalonGaso()
local cantidadDinero = getPlayerMoney()
local valorG = tonumber(Precio)
if (cantidadDinero>=valorG) then
	triggerServerEvent ( "quitarPlataServer", getLocalPlayer(),valorG)
	local cantGasol = getElementData(localPlayer,"galonGaso")
	setElementData(localPlayer, "galonGaso", cantGasol + 1)
	outputChatBox("[Gasolinera]#ffffffCompraste 1 Galon de gasolina", 227, 13, 13,true)	
	else
	outputChatBox("[Gasolinera]#ffffffNo tienes la cantidad de dinero suficiente para comprar 1 Galon de gasolina", 227, 13, 13,true)	
	end
end

function CompDiezGalonGaso()
local cantidadDinero = getPlayerMoney()
local valorG = tonumber(Precio)
if (cantidadDinero>=valorG*10) then
	triggerServerEvent ( "quitarPlataServer", getLocalPlayer(),valorG*10)
	local cantGasol = getElementData(localPlayer,"galonGaso")
	setElementData(localPlayer, "galonGaso", cantGasol + 10)
	outputChatBox("[Gasolinera]#ffffffCompraste 10 Galones de gasolina", 227, 13, 13,true)	
	else
	outputChatBox("[Gasolinera]#ffffffNo tienes la cantidad de dinero suficiente para comprar 10 Galones de gasolina", 227, 13, 13,true)	
	end
end

function salir7()
	showCursor(false)
	destroyElement(window7)
	panelVentGaso = false
end

addEventHandler('onClientMarkerHit', markertVentaGasolina1,
function ( hitPlayer )
    if ( getElementType ( hitPlayer ) == "player" ) and ( hitPlayer == localPlayer ) then
		if(getElementData(localPlayer, "Ocupacion" ) == "Fabricante de drogas") then
			if (panelVentGaso == false) then
				if(isPedInVehicle (getLocalPlayer()))then
					outputChatBox("[Gasolinera]#ffffffNo puedes interactuar si estas en un vehiculo", 227, 13, 13,true)
				else
					triggerEvent("SolicitarDatosXml",getLocalPlayer(),"Gasolina")
					PanelVGasolina()
				end
			end
		else
			outputChatBox("[Gasolinera]#ffffffNo puedes comprar si no eres Fabricante de drogas",227, 13, 13,true)		
		end
	end
end)

addEventHandler('onClientMarkerHit', markertVentaGasolina2,
function ( hitPlayer )
    if ( getElementType ( hitPlayer ) == "player" ) and ( hitPlayer == localPlayer ) then
		if(getElementData(localPlayer, "Ocupacion" ) == "Fabricante de drogas") then
			if (panelVentGaso == false) then
				if(isPedInVehicle (getLocalPlayer()))then
					outputChatBox("[Gasolinera]#ffffffNo puedes interactuar si estas en un vehiculo", 227, 13, 13,true)
				else
					triggerEvent("SolicitarDatosXml",getLocalPlayer(),"Gasolina")
					PanelVGasolina()
				end
			end
		else
			outputChatBox("[Gasolinera]#ffffffNo puedes comprar si no eres Fabricante de drogas",227, 13, 13,true)		
		end
	end
end)

addEventHandler('onClientMarkerHit', markertVentaGasolina3,
function ( hitPlayer )
    if ( getElementType ( hitPlayer ) == "player" ) and ( hitPlayer == localPlayer ) then
		if(getElementData(localPlayer, "Ocupacion" ) == "Fabricante de drogas") then
			if (panelVentGaso == false) then
				if(isPedInVehicle (getLocalPlayer()))then
					outputChatBox("[Gasolinera]#ffffffNo puedes interactuar si estas en un vehiculo", 227, 13, 13,true)
				else
					triggerEvent("SolicitarDatosXml",getLocalPlayer(),"Gasolina")
					PanelVGasolina()
				end
			end
		else
			outputChatBox("[Gasolinera]#ffffffNo puedes comprar si no eres Fabricante de drogas",227, 13, 13,true)		
		end
	end
end)