local sx,sy = guiGetScreenSize()
local px,py = 1440,900
local x,y =  (sx/px), (sy/py)
local objeto1 = nil
local objeto2 = nil
local objeto3 = nil
local objeto4 = nil
local objeto5 = nil
local pedVisu = nil
local marcaObjVisu = nil
local objVisualPlan = nil
local precioObj1 = 0
local precioObj2 = 0
local precioObj3 = 0
local precioObj3 = 4
local panelMejorPlant = false

markertVentaMejoras = createMarker ( -56.099609375, 90.9541015625, 2.1171875, "cylinder",1.8, 227, 13, 13, 255 )

function CargarDatosMejoras (Mostrar1,Mostrar2,Mostrar3,Mostrar4)
precioObj1 = Mostrar1
precioObj2 = Mostrar2
precioObj3 = Mostrar3
precioObj4 = Mostrar4
end
addEvent( "CargarDatosMejoras", true)
addEventHandler( "CargarDatosMejoras", getRootElement(), CargarDatosMejoras)

function PanelMejorasPlantaciones()
	local TextoMemo = ""
	local pox,poy,poz,rotx,roty,rotz = nil
	
	panelMejorPlant = true
	window6 = guiCreateWindow(x*1000, y*254, x*383, y*363, "Mejoras Plantaciones", false)
    guiWindowSetSizable(window6, false)
    comboboxMejoras = guiCreateComboBox(x*179, y*49, x*194, y*222, "", false, window6)
    guiComboBoxAddItem(comboboxMejoras, "Dragon")
    guiComboBoxAddItem(comboboxMejoras, "Velocidad en germinacion")
	guiComboBoxAddItem(comboboxMejoras, "Tercera Planta")
	guiComboBoxAddItem(comboboxMejoras, "Cuarta Planta")
	guiComboBoxAddItem(comboboxMejoras, "1 Mejora de Produccion")
	guiComboBoxAddItem(comboboxMejoras, "2 Mejora de Produccion")
	guiComboBoxAddItem(comboboxMejoras, "3 Mejora de Produccion")
	guiComboBoxAddItem(comboboxMejoras, "4 Mejora de Produccion")
    memoMejoras = guiCreateMemo(x*11, y*49, x*158, y*165, TextoMemo, false, window6)
	guiMemoSetReadOnly(memoMejoras, true) 
    botonVisualizarMP = guiCreateButton(x*11, y*224, x*158, y*55, "Visualizar", false, window6)
	botonComprarMP = guiCreateButton(x*11, y*289, x*158, y*55, "Comprar", false, window6)
    botonSalirMP = guiCreateButton(x*205, y*289, x*158, y*55, "Salir", false, window6)
    labelDescri = guiCreateLabel(x*11, y*27, x*143, y*22, "Descripcion:", false, window6)
    labelPrecio = guiCreateLabel(x*179, y*27, x*149, y*26, "Precio: 0", false, window6)
    guiSetFont(labelDescri, "default-bold-small")
	guiSetFont(labelPrecio, "default-bold-small")
	guiSetProperty( botonVisualizarMP, "Disabled", "True" )
	guiSetProperty( botonComprarMP, "Disabled", "True" )
	showCursor(true)
	triggerEvent("SolicitarDatosXmlMejorasPlantacion",getLocalPlayer())
	addEventHandler ( "onClientGUIComboBoxAccepted", guiRoot,
    function ( comboBox )
        if ( comboBox == comboboxMejoras ) then
            local item = guiComboBoxGetSelected ( comboboxMejoras )
            local text = tostring ( guiComboBoxGetItemText ( comboboxMejoras , item ) )
            if ( text == "Dragon" ) then
                Precio = tonumber(precioObj1)
				pox,poy,poz,rotx,roty,rotz =  -81.103881835938,87.589157104492,-56.718852996826,12.187638282776,92.283409118652,-92.421180725098
				guiSetText ( labelPrecio, "Precio: ".. Precio )
				TextoMemo = "Este es un objeto decorativo que puedes agregar para tus Plantaciones"
				guiSetText ( memoMejoras, TextoMemo )
				objVisualPlan = "Dragon"
				guiSetProperty( botonVisualizarMP, "Disabled", "False" )
				if(getElementData(localPlayer, "fabobjetouno") == 1) then
					guiSetProperty( botonComprarMP, "Disabled", "True" )
				else
					guiSetProperty( botonComprarMP, "Disabled", "False" )
				end
			end
			if(text == "Velocidad en germinacion") then
                Precio = tonumber(precioObj2)
				pox,poy,poz,rotx,roty,rotz =  -64.171852111816,84.277252197266,-58.964374542236,-156.09030151367,119.71047973633,-76.154075622559
				guiSetText ( labelPrecio, "Precio: ".. Precio )
				TextoMemo = "Al comprar esta mejora se reducira el tiempo de la germinacion del material de 47 segundos a 40 segundos"
				guiSetText ( memoMejoras, TextoMemo )
				objVisualPlan = "Velocidad en germinacion"
				guiSetProperty( botonVisualizarMP, "Disabled", "False" )
				if(getElementData(localPlayer, "fabmejorauno") == 1) then
					guiSetProperty( botonComprarMP, "Disabled", "True" )
				else
					guiSetProperty( botonComprarMP, "Disabled", "False" )
				end
			end
			if(text == "Tercera Planta") then
                Precio = tonumber(precioObj3)
				pox,poy,poz,rotx,roty,rotz = -82.117805480957,90.190017700195,-62.933540344238,-162.70053100586,88.526260375977,-122.12522888184
				guiSetText ( labelPrecio, "Precio: ".. Precio )
				TextoMemo = "Al comprar esta mejora tendras una planta extra para la produccion de materia prima"
				guiSetText ( memoMejoras, TextoMemo )
				objVisualPlan = "Tercera Planta"
				guiSetProperty( botonVisualizarMP, "Disabled", "False" )
				if(getElementData(localPlayer, "fabmejorados") == 1) then
					guiSetProperty( botonComprarMP, "Disabled", "True" )
				else
					guiSetProperty( botonComprarMP, "Disabled", "False" )
				end
			end
			if(text == "Cuarta Planta") then
                Precio = tonumber(precioObj3)
				pox,poy,poz,rotx,roty,rotz = -81.499305725098,94.35489654541,-63.101043701172,-169.17477416992,77.183959960938,-108.02509307861
				guiSetText ( labelPrecio, "Precio: ".. Precio )
				TextoMemo = "Al comprar esta mejora tendras una planta extra para la produccion de materia prima"
				guiSetText ( memoMejoras, TextoMemo )
				objVisualPlan = "Cuarta Planta"
				guiSetProperty( botonVisualizarMP, "Disabled", "False" )
				if(getElementData(localPlayer, "fabmejoratres") == 1) then
					guiSetProperty( botonComprarMP, "Disabled", "True" )
				else
					guiSetProperty( botonComprarMP, "Disabled", "False" )
				end
			end
			if(text == "1 Mejora de Produccion") then
                Precio = tonumber(precioObj4)
				pox,poy,poz,rotx,roty,rotz = -74.49006652832,83.222938537598,-63.609832763672,15.027988433838,52.085536956787,-95.499961853027
				guiSetText ( labelPrecio, "Precio: ".. Precio )
				TextoMemo = "Al comprar esta mejora tendras un trabajador extra en tu plantacion y este generara mayor cantidad de materia prima"
				guiSetText ( memoMejoras, TextoMemo )
				objVisualPlan = "1 Mejora de Produccion"
				guiSetProperty( botonVisualizarMP, "Disabled", "False" )
				if(getElementData(localPlayer, "fabmejoracuat") == 1) then
					guiSetProperty( botonComprarMP, "Disabled", "True" )
				else
					guiSetProperty( botonComprarMP, "Disabled", "False" )
				end
			end
			if(text == "2 Mejora de Produccion") then
                Precio = tonumber(precioObj4)
				pox,poy,poz,rotx,roty,rotz = -76.831283569336,83.600059509277,-63.306648254395,-17.474737167358,25.993896484375,-119.50566864014
				guiSetText ( labelPrecio, "Precio: ".. Precio )
				TextoMemo = "Al comprar esta mejora tendras un trabajador extra en tu plantacion y este generara mayor cantidad de materia prima"
				guiSetText ( memoMejoras, TextoMemo )
				objVisualPlan = "2 Mejora de Produccion"
				guiSetProperty( botonVisualizarMP, "Disabled", "False" )
				if(getElementData(localPlayer, "fabmejoracinc") == 1) then
					guiSetProperty( botonComprarMP, "Disabled", "True" )
				else
					guiSetProperty( botonComprarMP, "Disabled", "False" )
				end
			end
			if(text == "3 Mejora de Produccion") then
                Precio = tonumber(precioObj4)
				pox,poy,poz,rotx,roty,rotz = -76.910308837891,92.369270324707,-63.179595947266,-9.9342622756958,157.13940429688,-99.498184204102
				guiSetText ( labelPrecio, "Precio: ".. Precio )
				TextoMemo = "Al comprar esta mejora tendras un trabajador extra en tu plantacion y este generara mayor cantidad de materia prima"
				guiSetText ( memoMejoras, TextoMemo )
				objVisualPlan = "3 Mejora de Produccion"
				guiSetProperty( botonVisualizarMP, "Disabled", "False" )
				if(getElementData(localPlayer, "fabmejoraseis") == 1) then
					guiSetProperty( botonComprarMP, "Disabled", "True" )
				else
					guiSetProperty( botonComprarMP, "Disabled", "False" )
				end
			end
			if(text == "4 Mejora de Produccion") then
                Precio = tonumber(precioObj4)
				pox,poy,poz,rotx,roty,rotz = -74.055503845215,92.407524108887,-63.205593109131,-2.2641403675079,150.56298828125,-101.46709442139
				guiSetText ( labelPrecio, "Precio: ".. Precio )
				TextoMemo = "Al comprar esta mejora tendras un trabajador extra en tu plantacion y este generara mayor cantidad de materia prima"
				guiSetText ( memoMejoras, TextoMemo )
				objVisualPlan = "4 Mejora de Produccion"
				guiSetProperty( botonVisualizarMP, "Disabled", "False" )
				if(getElementData(localPlayer, "fabmejorasiet") == 1) then
					guiSetProperty( botonComprarMP, "Disabled", "True" )
				else
					guiSetProperty( botonComprarMP, "Disabled", "False" )
				end
			end
        end
    end)
	
	addEventHandler("onClientGUIClick", botonSalirMP, salir6, false)
	addEventHandler("onClientGUIClick", botonVisualizarMP,
	function ()
		if(objVisualPlan == "Dragon") then
		objeto1 = createObject(3528,-65.3,88.9,-59.8,0,0,180)
		guiSetProperty( botonVisualizarMP, "Disabled", "True" )
		guiSetProperty( botonSalirMP, "Disabled", "True" )
		guiSetProperty( botonComprarMP, "Disabled", "True" )
		guiSetProperty( comboboxMejoras, "Disabled", "True")
		setCameraMatrix(pox,poy,poz,rotx,roty,rotz)
		setTimer (function ( )
				setCameraTarget (getLocalPlayer())
				guiSetProperty( botonVisualizarMP, "Disabled", "False" )
				guiSetProperty( botonSalirMP, "Disabled", "False" )
				guiSetProperty( comboboxMejoras, "Disabled", "False")
				if(getElementData(localPlayer, "fabobjetouno") == 0)then
					guiSetProperty( botonComprarMP, "Disabled", "False" )
				end
				destroyElement(objeto1)
		end,5000, 1)	
		end
		if(objVisualPlan == "Velocidad en germinacion") then
		objeto1 = createObject(14438,-81,84.599998474121,-57.700000762939,0,0,270)
		objeto2 = createObject(14438,-69.800003051758,84.599998474121,-57.700000762939,0,0,270)
		guiSetProperty( botonVisualizarMP, "Disabled", "True" )
		guiSetProperty( botonSalirMP, "Disabled", "True" )
		guiSetProperty( botonComprarMP, "Disabled", "True" )
		guiSetProperty( comboboxMejoras, "Disabled", "True")
		setCameraMatrix(pox,poy,poz,rotx,roty,rotz)
		setTimer (function ( )
				setCameraTarget (getLocalPlayer())
				guiSetProperty( botonVisualizarMP, "Disabled", "False" )
				guiSetProperty( botonSalirMP, "Disabled", "False" )
				guiSetProperty( comboboxMejoras, "Disabled", "False")
				if(getElementData(localPlayer, "fabmejorauno") == 0)then
					guiSetProperty( botonComprarMP, "Disabled", "False" )
				end
				destroyElement(objeto1)
				destroyElement(objeto2)
		end,5000, 1)	
		end
		if(objVisualPlan == "Tercera Planta") then
		objeto1 = createObject(743,-85.1435546875, 90.012306213379, -65.531253051758)
		marcaObjVisu= createMarker (-85.1435546875, 90.012306213379, -65.831253051758, "cylinder",1.2, 227, 13, 13, 255 )
		guiSetProperty( botonVisualizarMP, "Disabled", "True" )
		guiSetProperty( botonSalirMP, "Disabled", "True" )
		guiSetProperty( botonComprarMP, "Disabled", "True" )
		guiSetProperty( comboboxMejoras, "Disabled", "True")
		setCameraMatrix(pox,poy,poz,rotx,roty,rotz)
		setTimer (function ( )
				setCameraTarget (getLocalPlayer())
				guiSetProperty( botonVisualizarMP, "Disabled", "False" )
				guiSetProperty( botonSalirMP, "Disabled", "False" )
				guiSetProperty( comboboxMejoras, "Disabled", "False")
				if(getElementData(localPlayer, "fabmejorados") == 0)then
					guiSetProperty( botonComprarMP, "Disabled", "False" )
				end
				destroyElement(objeto1)
				destroyElement(marcaObjVisu)
		end,5000, 1)	
		end
		if(objVisualPlan == "Cuarta Planta") then
		objeto1 = createObject(743,-85.0771484375, 93.415626525879, -65.531253051758)
		marcaObjVisu= createMarker (-85.0771484375, 93.415626525879, -65.831253051758, "cylinder",1.2, 227, 13, 13, 255 )
		guiSetProperty( botonVisualizarMP, "Disabled", "True" )
		guiSetProperty( botonSalirMP, "Disabled", "True" )
		guiSetProperty( botonComprarMP, "Disabled", "True" )
		guiSetProperty( comboboxMejoras, "Disabled", "True")
		setCameraMatrix(pox,poy,poz,rotx,roty,rotz)
		setTimer (function ( )
				setCameraTarget (getLocalPlayer())
				guiSetProperty( botonVisualizarMP, "Disabled", "False" )
				guiSetProperty( botonSalirMP, "Disabled", "False" )
				guiSetProperty( comboboxMejoras, "Disabled", "False")
				if(getElementData(localPlayer, "fabmejoratres") == 0)then
					guiSetProperty( botonComprarMP, "Disabled", "False" )
				end
				destroyElement(objeto1)
				destroyElement(marcaObjVisu)
		end,5000, 1)	
		end
		if(objVisualPlan == "1 Mejora de Produccion") then
		objeto1 = createObject(941,-71.8,82.1,-65.4,0,0,0)
		objeto2 = createObject(1575,-71.1,82.5,-64.9,0,0,0)
		objeto3 = createObject(1575,-72,82.5,-64.9,0,0,0)
		objeto4 = createObject(1650,-72.5,81.7,-64.6,0,0,0)
		objeto5 = createObject(2035,-71,81.8,-64.9,0,0,0)
		pedVisu = createPed( 144, -71.5380859375, 83.070899963379, -64.831253051758 ,180)
		guiSetProperty( botonVisualizarMP, "Disabled", "True" )
		guiSetProperty( botonSalirMP, "Disabled", "True" )
		guiSetProperty( botonComprarMP, "Disabled", "True" )
		guiSetProperty( comboboxMejoras, "Disabled", "True")
		setCameraMatrix(pox,poy,poz,rotx,roty,rotz)
		setTimer (function ( )
				setCameraTarget (getLocalPlayer())
				guiSetProperty( botonVisualizarMP, "Disabled", "False" )
				guiSetProperty( botonSalirMP, "Disabled", "False" )
				guiSetProperty( comboboxMejoras, "Disabled", "False")
				if(getElementData(localPlayer, "fabmejoracuat") == 0)then
					guiSetProperty( botonComprarMP, "Disabled", "False" )
				end
				destroyElement(objeto1)
				destroyElement(objeto2)
				destroyElement(objeto3)
				destroyElement(objeto4)
				destroyElement(objeto5)
				destroyElement(pedVisu)
		end,5000, 1)	
		end
		if(objVisualPlan == "2 Mejora de Produccion") then
		objeto1 = createObject(941,-74.8,82.1,-65.4,0,0,0)
		objeto2 = createObject(1575,-74.1,82.5,-64.9,0,0,0)
		objeto3 = createObject(2044,-74.3,81.9,-64.9,0,0,0)
		objeto4 = createObject(1650,-75.2,81.7,-64.6,0,0,0)
		objeto5 = createObject(2709,-73.6,82.1,-64.8,0,0,0)
		pedVisu = createPed( 144, -74.501953125, 83.070899963379, -64.831253051758,180)
		setPedAnimation ( pedVisu , "casino", "dealone", -1,true, false, false, false, 250, false)
		guiSetProperty( botonVisualizarMP, "Disabled", "True" )
		guiSetProperty( botonSalirMP, "Disabled", "True" )
		guiSetProperty( botonComprarMP, "Disabled", "True" )
		guiSetProperty( comboboxMejoras, "Disabled", "True")
		setCameraMatrix(pox,poy,poz,rotx,roty,rotz)
		setTimer (function ( )
				setCameraTarget (getLocalPlayer())
				guiSetProperty( botonVisualizarMP, "Disabled", "False" )
				guiSetProperty( botonSalirMP, "Disabled", "False" )
				guiSetProperty( comboboxMejoras, "Disabled", "False")
				if(getElementData(localPlayer, "fabmejoracinc") == 0)then
					guiSetProperty( botonComprarMP, "Disabled", "False" )
				end
				destroyElement(objeto1)
				destroyElement(objeto2)
				destroyElement(objeto3)
				destroyElement(objeto4)
				destroyElement(objeto5)
				destroyElement(pedVisu)
		end,5000, 1)	
		end
		if(objVisualPlan == "3 Mejora de Produccion") then
		objeto1 = createObject(941,-74.8,94.5,-65.4,0,0,0)
		objeto2 = createObject(1575,-75,94.2,-64.9,0,0,0)
		objeto3 = createObject(1575,-74,94.2,-64.9,0,0,0)
		objeto4 = createObject(1650,-73.7,94.8,-64.6,0,0,0)
		objeto5 = createObject(2045,-75.5,94.4,-64.9,0,0,0)
		pedVisu = createPed( 144, -74.50390625, 93.563087463379, -64.831253051758,0)
		setPedAnimation ( pedVisu , "casino", "dealone", -1,true, false, false, false, 250, false)
		guiSetProperty( botonVisualizarMP, "Disabled", "True" )
		guiSetProperty( botonSalirMP, "Disabled", "True" )
		guiSetProperty( botonComprarMP, "Disabled", "True" )
		guiSetProperty( comboboxMejoras, "Disabled", "True")
		setCameraMatrix(pox,poy,poz,rotx,roty,rotz)
		setTimer (function ( )
				setCameraTarget (getLocalPlayer())
				guiSetProperty( botonVisualizarMP, "Disabled", "False" )
				guiSetProperty( botonSalirMP, "Disabled", "False" )
				guiSetProperty( comboboxMejoras, "Disabled", "False")
				if(getElementData(localPlayer, "fabmejoraseis") == 0)then
					guiSetProperty( botonComprarMP, "Disabled", "False" )
				end
				destroyElement(objeto1)
				destroyElement(objeto2)
				destroyElement(objeto3)
				destroyElement(objeto4)
				destroyElement(objeto5)
				destroyElement(pedVisu)
		end,5000, 1)	
		end
		if(objVisualPlan == "4 Mejora de Produccion") then
		objeto1 = createObject(941,-71.8,94.5,-65.4,0,0,0)
		objeto2 = createObject(1575,-72.1,94.2,-64.9,0,0,0)
		objeto3 = createObject(1575,-71.2,94.2,-64.9,0,0,0)
		objeto4 = createObject(1650,-70.6,94.9,-64.6,0,0,0)
		pedVisu = createPed( 144, -71.6005859375, 93.561134338379, -64.831253051758,0)
		setPedAnimation ( pedVisu , "casino", "dealone", -1,true, false, false, false, 250, false)
		guiSetProperty( botonVisualizarMP, "Disabled", "True" )
		guiSetProperty( botonSalirMP, "Disabled", "True" )
		guiSetProperty( botonComprarMP, "Disabled", "True" )
		guiSetProperty( comboboxMejoras, "Disabled", "True")
		setCameraMatrix(pox,poy,poz,rotx,roty,rotz)
		setTimer (function ( )
				setCameraTarget (getLocalPlayer())
				guiSetProperty( botonVisualizarMP, "Disabled", "False" )
				guiSetProperty( botonSalirMP, "Disabled", "False" )
				guiSetProperty( comboboxMejoras, "Disabled", "False")
				if(getElementData(localPlayer, "fabmejorasiet") == 0)then
					guiSetProperty( botonComprarMP, "Disabled", "False" )
				end
				destroyElement(objeto1)
				destroyElement(objeto2)
				destroyElement(objeto3)
				destroyElement(objeto4)
				destroyElement(pedVisu)
		end,5000, 1)	
		end
	end, false)
	
	addEventHandler("onClientGUIClick", botonComprarMP, 
	function()
	local cantidadDinero = getPlayerMoney()
	if(objVisualPlan == "Dragon") then
		if (cantidadDinero>=Precio) then
			triggerServerEvent ( "quitarPlataServer", getLocalPlayer(),Precio)
			setElementData  (getLocalPlayer(), "fabobjetouno", 1)
			outputChatBox("[Plantacion]#ffffffCompra realizada con exito", 227, 13, 13,true)
		else
			outputChatBox("[Plantacion]#ffffffNo tienes la cantidad de dinero suficiente para realizar la compra", 227, 13, 13,true)	
		end
	end
	if(objVisualPlan == "Velocidad en germinacion") then
		if (cantidadDinero>=Precio) then
			triggerServerEvent ( "quitarPlataServer", getLocalPlayer(),Precio)
			setElementData  (getLocalPlayer(), "fabmejorauno", 1)
			setElementData (getLocalPlayer(),"tiempoGermiPlant",1)
			outputChatBox("[Plantacion]#ffffffCompra realizada con exito", 227, 13, 13,true)
		else
			outputChatBox("[Plantacion]#ffffffNo tienes la cantidad de dinero suficiente para realizar la compra", 227, 13, 13,true)	
		end
	end
	if(objVisualPlan == "Tercera Planta") then
		if (cantidadDinero>=Precio) then
			triggerServerEvent ( "quitarPlataServer", getLocalPlayer(),Precio)
			setElementData  (getLocalPlayer(), "fabmejorados", 1)
			outputChatBox("[Plantacion]#ffffffCompra realizada con exito", 227, 13, 13,true)
		else
			outputChatBox("[Plantacion]#ffffffNo tienes la cantidad de dinero suficiente para realizar la compra", 227, 13, 13,true)	
		end
	end
	if(objVisualPlan == "Cuarta Planta") then
		if (cantidadDinero>=Precio) then
			triggerServerEvent ( "quitarPlataServer", getLocalPlayer(),Precio)
			setElementData  (getLocalPlayer(), "fabmejoratres", 1)
			outputChatBox("[Plantacion]#ffffffCompra realizada con exito", 227, 13, 13,true)
		else
			outputChatBox("[Plantacion]#ffffffNo tienes la cantidad de dinero suficiente para realizar la compra", 227, 13, 13,true)	
		end
	end
	if(objVisualPlan == "1 Mejora de Produccion") then
		if (cantidadDinero>=Precio) then
			triggerServerEvent ( "quitarPlataServer", getLocalPlayer(),Precio)
			local datafm4 = getElementData(getLocalPlayer(),"cantMejorPlan")
			setElementData(getLocalPlayer(), "cantMejorPlan", datafm4+1)
			setElementData(getLocalPlayer(), "fabmejoracuat", 1)
			outputChatBox("[Plantacion]#ffffffCompra realizada con exito", 227, 13, 13,true)
		else
			outputChatBox("[Plantacion]#ffffffNo tienes la cantidad de dinero suficiente para realizar la compra", 227, 13, 13,true)	
		end
	end
	if(objVisualPlan == "2 Mejora de Produccion") then
		if (cantidadDinero>=Precio) then
			triggerServerEvent ( "quitarPlataServer", getLocalPlayer(),Precio)
			local datafm4 = getElementData(getLocalPlayer(),"cantMejorPlan")
			setElementData(getLocalPlayer(), "cantMejorPlan", datafm4+1)
			setElementData(getLocalPlayer(), "fabmejoracinc", 1)
			outputChatBox("[Plantacion]#ffffffCompra realizada con exito", 227, 13, 13,true)
		else
			outputChatBox("[Plantacion]#ffffffNo tienes la cantidad de dinero suficiente para realizar la compra", 227, 13, 13,true)	
		end
	end
	if(objVisualPlan == "3 Mejora de Produccion") then
		if (cantidadDinero>=Precio) then
			triggerServerEvent ( "quitarPlataServer", getLocalPlayer(),Precio)
			local datafm4 = getElementData(getLocalPlayer(),"cantMejorPlan")
			setElementData(getLocalPlayer(), "cantMejorPlan", datafm4+1)
			setElementData(getLocalPlayer(), "fabmejoraseis", 1)
			outputChatBox("[Plantacion]#ffffffCompra realizada con exito", 227, 13, 13,true)
		else
			outputChatBox("[Plantacion]#ffffffNo tienes la cantidad de dinero suficiente para realizar la compra", 227, 13, 13,true)	
		end
	end
	if(objVisualPlan == "4 Mejora de Produccion") then
		if (cantidadDinero>=Precio) then
			triggerServerEvent ( "quitarPlataServer", getLocalPlayer(),Precio)
			local datafm4 = getElementData(getLocalPlayer(),"cantMejorPlan")
			setElementData(getLocalPlayer(), "cantMejorPlan", datafm4+1)
			setElementData(getLocalPlayer(), "fabmejorasiet", 1)
			outputChatBox("[Plantacion]#ffffffCompra realizada con exito", 227, 13, 13,true)
		else
			outputChatBox("[Plantacion]#ffffffNo tienes la cantidad de dinero suficiente para realizar la compra", 227, 13, 13,true)	
		end
	end
	end, false)
	addEventHandler("onClientGUIClick", botonComprarMP, salir6, false)
end

function salir6()
	showCursor(false)
	destroyElement(window6)
	panelMejorPlant = false
end

addEventHandler('onClientMarkerHit', markertVentaMejoras,
function ( hitPlayer )
	if ( getElementType ( hitPlayer ) == "player" ) and ( hitPlayer == localPlayer ) then
		if(getElementData(localPlayer, "Ocupacion" ) == "Fabricante de drogas") then
			if(panelMejorPlant == false) then
				if(isPedInVehicle (getLocalPlayer()))then
					outputChatBox("[Plantacion]#ffffffNo puedes interactuar si estas en un vehiculo", 227, 13, 13,true)
				else
					PanelMejorasPlantaciones()
				end
			end
		else
			outputChatBox("[Plantacion]#ffffffNo puedes comprar mejoras si no eres Fabricante de drogas",227, 13, 13,true)		
		end
	end
end)
