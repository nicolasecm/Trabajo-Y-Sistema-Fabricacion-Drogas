local sx,sy = guiGetScreenSize()
local px,py = 1440,900
local x,y =  (sx/px), (sy/py)
local precioObj1f = 0
local precioObj2f = 0
local precioObj3f = 0
local precioObj4f = 0
local objetoMF1 = nil
local objetoMF2 = nil
local objetoMF3 = nil
local objVisualF = nil
local pedVisMF = nil

markertVentaMejorasFabrica = createMarker (-23.0888671875, -270.2490234375, 4.4296875, "cylinder",1.8, 227, 13, 13, 255 )

function CargarDatosMejorasFab (MostrarF1,MostrarF2,MostrarF3,MostrarF4)
precioObj1f = MostrarF1
precioObj2f = MostrarF2
precioObj3f = MostrarF3
precioObj4f = MostrarF4
end
addEvent( "CargarDatosMejorasFab", true)
addEventHandler( "CargarDatosMejorasFab", getRootElement(), CargarDatosMejorasFab)

function PanelMejorasFabrica()
	local TextoMemoFab = ""
	local poxf,poyf,pozf,rotxf,rotyf,rotzf = nil
	triggerEvent("SolicitarDatosXmlMejorasFabrica",getLocalPlayer())
	
	window4 = guiCreateWindow(x*1000, y*254, x*383, y*363, "Mejoras Fabrica", false)
    guiWindowSetSizable(window4, false)
    comboboxMejorasF = guiCreateComboBox(x*179, y*49, x*194, y*222, "", false, window4)
    guiComboBoxAddItem(comboboxMejorasF, "Velocidad en Procesos sala 1")
	guiComboBoxAddItem(comboboxMejorasF, "Mejora Produccion sala 1")
	guiComboBoxAddItem(comboboxMejorasF, "2 Mejora Produccion sala 1")
    guiComboBoxAddItem(comboboxMejorasF, "Desbloquear Segunda Sala")
	guiComboBoxAddItem(comboboxMejorasF, "Desbloquear Maquina Segunda Sala")
	guiComboBoxAddItem(comboboxMejorasF, "Velocidad en Procesos sala 2")
	guiComboBoxAddItem(comboboxMejorasF, "Mejora Produccion sala 2")
	guiComboBoxAddItem(comboboxMejorasF, "2 Mejora Produccion sala 2")
    memoMejorasMF = guiCreateMemo(x*11, y*49, x*158, y*165, TextoMemoFab, false, window4)
	guiMemoSetReadOnly(memoMejorasMF, true)    
    botonVisualizarMF = guiCreateButton(x*11, y*224, x*158, y*55, "Visualizar", false, window4)
	botonComprarMF = guiCreateButton(x*11, y*289, x*158, y*55, "Comprar", false, window4)
    botonSalirMF = guiCreateButton(x*205, y*289, x*158, y*55, "Salir", false, window4)
    labelDescriMF = guiCreateLabel(x*11, y*27, x*143, y*22, "Descripcion:", false, window4)
    labelPrecioMF = guiCreateLabel(x*179, y*27, x*149, y*26, "Precio: 0", false, window4)
    guiSetFont(labelDescriMF, "default-bold-small")
	guiSetFont(labelPrecioMF, "default-bold-small")
	guiSetProperty( botonVisualizarMF, "Disabled", "True" )
	guiSetProperty( botonComprarMF, "Disabled", "True" )
	showCursor(true)
	addEventHandler ( "onClientGUIComboBoxAccepted", guiRoot,
    function ( comboBox )
        if ( comboBox == comboboxMejorasF ) then
            local item = guiComboBoxGetSelected ( comboboxMejorasF )
            local text = tostring ( guiComboBoxGetItemText ( comboboxMejorasF , item ) )
            if ( text == "Velocidad en Procesos sala 1" ) then
                Precio = tonumber(precioObj1f)
				poxf,poyf,pozf,rotxf,rotyf,rotzf =  -54.88094329834,-256.73852539063,-92.220146179199,-146.23597717285,-269.11236572266,-130.9647827148
				guiSetText ( labelPrecioMF, "Precio: ".. Precio )
				TextoMemoFab = "Al comprar esta mejora se reducira el tiempo de los procesos de creacion de drogas de 57 segundos a 47 segundos"
				guiSetText ( memoMejorasMF, TextoMemoFab )
				objVisualF = "Velocidad en Procesos sala 1"		
				guiSetProperty( botonVisualizarMF, "Disabled", "False" )
				if(getElementData(localPlayer, "Mejoffabobjetouno") == 1) then
					guiSetProperty( botonComprarMF, "Disabled", "True" )
				else
					guiSetProperty( botonComprarMF, "Disabled", "False" )
				end
			end
        end
		if ( comboBox == comboboxMejorasF ) then
            local item = guiComboBoxGetSelected ( comboboxMejorasF )
            local text = tostring ( guiComboBoxGetItemText ( comboboxMejorasF , item ) )
            if ( text == "Mejora Produccion sala 1" ) then
                Precio = tonumber(precioObj3f)
				poxf,poyf,pozf,rotxf,rotyf,rotzf = -56.421859741211,-260.67398071289,-96.976593017578,-7.8166799545288,-192.40379333496,-151.53590393066
				guiSetText ( labelPrecioMF, "Precio: ".. Precio )
				TextoMemoFab = "Al comprar esta mejora obtendras mayor cantidad de drogas al terminar los procesos de la sala 1"
				guiSetText ( memoMejorasMF, TextoMemoFab )
				objVisualF = "Mejora Produccion sala 1"		
				guiSetProperty( botonVisualizarMF, "Disabled", "False" )
				if(getElementData(localPlayer, "Mejoffabobjetotres") == 1) then
					guiSetProperty( botonComprarMF, "Disabled", "True" )
				else
					guiSetProperty( botonComprarMF, "Disabled", "False" )
				end
			end
        end
		if ( comboBox == comboboxMejorasF ) then
            local item = guiComboBoxGetSelected ( comboboxMejorasF )
            local text = tostring ( guiComboBoxGetItemText ( comboboxMejorasF , item ) )
            if ( text == "2 Mejora Produccion sala 1" ) then
                Precio = tonumber(precioObj3f)
				poxf,poyf,pozf,rotxf,rotyf,rotzf = -56.973373413086,-261.65335083008,-97.440826416016,8.1575365066528,-211.19801330566,-154.11730957031
				guiSetText ( labelPrecioMF, "Precio: ".. Precio )
				TextoMemoFab = "Al comprar esta mejora obtendras mayor cantidad de drogas al terminar los procesos de la sala 1"
				guiSetText ( memoMejorasMF, TextoMemoFab )
				objVisualF = "2 Mejora Produccion sala 1"		
				guiSetProperty( botonVisualizarMF, "Disabled", "False" )
				if(getElementData(localPlayer, "Mejoffabobjetocuat") == 1) then
					guiSetProperty( botonComprarMF, "Disabled", "True" )
				else
					guiSetProperty( botonComprarMF, "Disabled", "False" )
				end
			end
        end
		if ( comboBox == comboboxMejorasF ) then
            local item = guiComboBoxGetSelected ( comboboxMejorasF )
            local text = tostring ( guiComboBoxGetItemText ( comboboxMejorasF , item ) )
            if ( text == "Desbloquear Segunda Sala" ) then
                Precio = tonumber(precioObj2f)
				poxf,poyf,pozf,rotxf,rotyf,rotzf = -72.543495178223,-210.24462890625,-92.600486755371,-0.6608452796936,-264.71887207031,-135.79125976563
				guiSetText ( labelPrecioMF, "Precio: ".. Precio )
				TextoMemoFab = "Al comprar esta mejora desbloquearas la segunda sala de la fabrica"
				guiSetText ( memoMejorasMF, TextoMemoFab )
				objVisualF = "Desbloquear Segunda Sala"		
				guiSetProperty( botonVisualizarMF, "Disabled", "False" )
				if(getElementData(localPlayer, "Mejoffabobjetodos") == 1) then
					guiSetProperty( botonComprarMF, "Disabled", "True" )
				else
					guiSetProperty( botonComprarMF, "Disabled", "False" )
				end
			end
        end
		if ( comboBox == comboboxMejorasF ) then
            local item = guiComboBoxGetSelected ( comboboxMejorasF )
            local text = tostring ( guiComboBoxGetItemText ( comboboxMejorasF , item ) )
            if ( text == "Desbloquear Maquina Segunda Sala" ) then
                Precio = tonumber(precioObj4f)
				poxf,poyf,pozf,rotxf,rotyf,rotzf = -58.519779205322,-235.35673522949,-94.714569091797,-136.31175231934,-176.44677734375,-116.57839202881
				guiSetText ( labelPrecioMF, "Precio: ".. Precio )
				TextoMemoFab = "Al comprar esta mejora desbloquearas la segunda maquina para fabricar las drogas en la segunda sala(compra la sala antes)"
				guiSetText ( memoMejorasMF, TextoMemoFab )
				objVisualF = "Desbloquear Maquina Segunda Sala"		
				guiSetProperty( botonVisualizarMF, "Disabled", "False" )
				if(getElementData(localPlayer, "Mejoffabobjetocinc") == 1) then
					guiSetProperty( botonComprarMF, "Disabled", "True" )
				else
					guiSetProperty( botonComprarMF, "Disabled", "False" )
				end
			end
        end
		if ( comboBox == comboboxMejorasF ) then
            local item = guiComboBoxGetSelected ( comboboxMejorasF )
            local text = tostring ( guiComboBoxGetItemText ( comboboxMejorasF , item ) )
            if ( text == "Velocidad en Procesos sala 2" ) then
                Precio = tonumber(precioObj1f)
				poxf,poyf,pozf,rotxf,rotyf,rotzf =  -58.519779205322,-235.35673522949,-94.714569091797,-136.31175231934,-176.44677734375,-116.57839202881
				guiSetText ( labelPrecioMF, "Precio: ".. Precio )
				TextoMemoFab = "Al comprar esta mejora se reducira el tiempo de los procesos de creacion de drogas de 57 segundos a 47 segundos en la segunda maquina"
				guiSetText ( memoMejorasMF, TextoMemoFab )
				objVisualF = "Velocidad en Procesos sala 2"		
				guiSetProperty( botonVisualizarMF, "Disabled", "False" )
				if(getElementData(localPlayer, "Mejoffabobjetoseis") == 1) then
					guiSetProperty( botonComprarMF, "Disabled", "True" )
				else
					guiSetProperty( botonComprarMF, "Disabled", "False" )
				end
			end
        end
		if ( comboBox == comboboxMejorasF ) then
            local item = guiComboBoxGetSelected ( comboboxMejorasF )
            local text = tostring ( guiComboBoxGetItemText ( comboboxMejorasF , item ) )
            if ( text == "Mejora Produccion sala 2" ) then
                Precio = tonumber(precioObj3f)
				poxf,poyf,pozf,rotxf,rotyf,rotzf = -55.524940490723,-219.61483764648,-97.918182373047,-20.433250427246,-147.54135131836,-157.70100402832
				guiSetText ( labelPrecioMF, "Precio: ".. Precio )
				TextoMemoFab = "Al comprar esta mejora obtendras mayor cantidad de drogas al terminar los procesos de la sala 2"
				guiSetText ( memoMejorasMF, TextoMemoFab )
				objVisualF = "Mejora Produccion sala 2"		
				guiSetProperty( botonVisualizarMF, "Disabled", "False" )
				if(getElementData(localPlayer, "Mejoffabobjetosiet") == 1) then
					guiSetProperty( botonComprarMF, "Disabled", "True" )
				else
					guiSetProperty( botonComprarMF, "Disabled", "False" )
				end
			end
        end
		if ( comboBox == comboboxMejorasF ) then
            local item = guiComboBoxGetSelected ( comboboxMejorasF )
            local text = tostring ( guiComboBoxGetItemText ( comboboxMejorasF , item ) )
            if ( text == "2 Mejora Produccion sala 2" ) then
                Precio = tonumber(precioObj3f)
				poxf,poyf,pozf,rotxf,rotyf,rotzf = -55.958969116211,-222.53326416016,-97.458068847656,-9.4494590759277,-155.41313171387,-155.1794128418
				guiSetText ( labelPrecioMF, "Precio: ".. Precio )
				TextoMemoFab = "Al comprar esta mejora obtendras mayor cantidad de drogas al terminar los procesos de la sala 2"
				guiSetText ( memoMejorasMF, TextoMemoFab )
				objVisualF = "2 Mejora Produccion sala 2"		
				guiSetProperty( botonVisualizarMF, "Disabled", "False" )
				if(getElementData(localPlayer, "Mejoffabobjetoocho") == 1) then
					guiSetProperty( botonComprarMF, "Disabled", "True" )
				else
					guiSetProperty( botonComprarMF, "Disabled", "False" )
				end
			end
        end
    end)
	
	addEventHandler("onClientGUIClick", botonSalirMF, salir4, false)
	addEventHandler("onClientGUIClick", botonVisualizarMF,
	function ()
		if(objVisualF == "Velocidad en Procesos sala 1") then
		objetoMF1 = createObject(14584, -68.4,-277.60001,-98.8)
		objetoMF2 = createObject(1691,-68.2,-254.7,-97.2)
		objetoMF3 = createObject(1691,-68.4,-265.10001,-97.2)
		guiSetProperty( botonVisualizarMF, "Disabled", "True" )
		guiSetProperty( botonSalirMF, "Disabled", "True" )
		guiSetProperty( botonComprarMF, "Disabled", "True" )
		guiSetProperty( comboboxMejorasF, "Disabled", "True")
		setCameraMatrix(poxf,poyf,pozf,rotxf,rotyf,rotzf)
		setTimer (function ( )
				setCameraTarget (getLocalPlayer())
				guiSetProperty( botonVisualizarMF, "Disabled", "False" )
				guiSetProperty( botonSalirMF, "Disabled", "False" )
				guiSetProperty( comboboxMejorasF, "Disabled", "False")
				if(getElementData(localPlayer, "Mejoffabobjetouno") == 0)then
					guiSetProperty( botonComprarMF, "Disabled", "False" )
				end
				destroyElement(objetoMF1)
				destroyElement(objetoMF2)
				destroyElement(objetoMF3)
		end,5000, 1)
		end
		if(objVisualF == "Mejora Produccion sala 1") then
		objetoMF1 = createObject(1575,-54.4,-256.7,-99.6,0,0,0)
		objetoMF2 = createObject(1654,-53.9,-256.5,-99.4,0,0,270)
		objetoMF3 = createObject(2709,-54.5,-258.1,-99.5,0,0,0)
		pedVisMF = createPed (144,-55.182029724121, -257.28302001953, -99.598434448242,270)
		setPedAnimation ( pedVisMF , "casino", "dealone", -1,true, false, false, false, 250, false)
		guiSetProperty( botonVisualizarMF, "Disabled", "True" )
		guiSetProperty( botonSalirMF, "Disabled", "True" )
		guiSetProperty( botonComprarMF, "Disabled", "True" )
		guiSetProperty( comboboxMejorasF, "Disabled", "True")
		setCameraMatrix(poxf,poyf,pozf,rotxf,rotyf,rotzf)
		setTimer (function ( )
				setCameraTarget (getLocalPlayer())
				guiSetProperty( botonVisualizarMF, "Disabled", "False" )
				guiSetProperty( botonSalirMF, "Disabled", "False" )
				guiSetProperty( comboboxMejorasF, "Disabled", "False")
				if(getElementData(localPlayer, "Mejoffabobjetotres") == 0)then
					guiSetProperty( botonComprarMF, "Disabled", "False" )
				end
				destroyElement(objetoMF1)
				destroyElement(objetoMF2)
				destroyElement(objetoMF3)
				destroyElement(pedVisMF)
		end,5000, 1)
		end
		if(objVisualF == "2 Mejora Produccion sala 1") then
		objetoMF1 = createObject(2709,-54.5,-258.7,-99.50,0,0,0)
		objetoMF2 = createObject(1575,-54.4,-259.1,-99.6,0,0,0)
		objetoMF3 = createObject(2060,-54.2,-260.5,-99.5,0,0,0)
		pedVisMF = createPed (144,-55.176170349121, -259.76153564453, -99.598434448242,270)
		setPedAnimation ( pedVisMF , "casino", "dealone", -1,true, false, false, false, 250, false)
		guiSetProperty( botonVisualizarMF, "Disabled", "True" )
		guiSetProperty( botonSalirMF, "Disabled", "True" )
		guiSetProperty( botonComprarMF, "Disabled", "True" )
		guiSetProperty( comboboxMejorasF, "Disabled", "True")
		setCameraMatrix(poxf,poyf,pozf,rotxf,rotyf,rotzf)
		setTimer (function ( )
				setCameraTarget (getLocalPlayer())
				guiSetProperty( botonVisualizarMF, "Disabled", "False" )
				guiSetProperty( botonSalirMF, "Disabled", "False" )
				guiSetProperty( comboboxMejorasF, "Disabled", "False")
				if(getElementData(localPlayer, "Mejoffabobjetocuat") == 0)then
					guiSetProperty( botonComprarMF, "Disabled", "False" )
				end
				destroyElement(objetoMF1)
				destroyElement(objetoMF2)
				destroyElement(objetoMF3)
				destroyElement(pedVisMF)
		end,5000, 1)
		end
		if(objVisualF == "Desbloquear Segunda Sala") then
		objetoMF1 = createObject(6959,-53.299999237061,-224.10000610352,-96.900001525879,90,90,0)
		guiSetProperty( botonVisualizarMF, "Disabled", "True" )
		guiSetProperty( botonSalirMF, "Disabled", "True" )
		guiSetProperty( botonComprarMF, "Disabled", "True" )
		guiSetProperty( comboboxMejorasF, "Disabled", "True")
		setCameraMatrix(poxf,poyf,pozf,rotxf,rotyf,rotzf)
		setTimer (function ( )
				setCameraTarget (getLocalPlayer())
				guiSetProperty( botonVisualizarMF, "Disabled", "False" )
				guiSetProperty( botonSalirMF, "Disabled", "False" )
				guiSetProperty( comboboxMejorasF, "Disabled", "False")
				if(getElementData(localPlayer, "Mejoffabobjetodos") == 0)then
					guiSetProperty( botonComprarMF, "Disabled", "False" )
				end
				destroyElement(objetoMF1)
		end,5000, 1)
		end
		if(objVisualF == "Desbloquear Maquina Segunda Sala") then
		objetoMF1 = createObject(14584,-68.7,-207.8,-98.8,0,0,0)
		guiSetProperty( botonVisualizarMF, "Disabled", "True" )
		guiSetProperty( botonSalirMF, "Disabled", "True" )
		guiSetProperty( botonComprarMF, "Disabled", "True" )
		guiSetProperty( comboboxMejorasF, "Disabled", "True")
		setCameraMatrix(poxf,poyf,pozf,rotxf,rotyf,rotzf)
		setTimer (function ( )
				setCameraTarget (getLocalPlayer())
				guiSetProperty( botonVisualizarMF, "Disabled", "False" )
				guiSetProperty( botonSalirMF, "Disabled", "False" )
				guiSetProperty( comboboxMejorasF, "Disabled", "False")
				if(getElementData(localPlayer, "Mejoffabobjetocinc") == 0)then
					guiSetProperty( botonComprarMF, "Disabled", "False" )
				end
				destroyElement(objetoMF1)
		end,5000, 1)
		end
		if(objVisualF == "Velocidad en Procesos sala 2") then
		objetoMF1 = createObject(1691,-68.8,-231.1,-97.2,0,0,0)
		objetoMF2 = createObject(1691,-68.5,-220.5,-97.2,0,0,0)
		objetoMF3 = createObject(14584,-68.7,-207.8,-98.8,0,0,0)
		guiSetProperty( botonVisualizarMF, "Disabled", "True" )
		guiSetProperty( botonSalirMF, "Disabled", "True" )
		guiSetProperty( botonComprarMF, "Disabled", "True" )
		guiSetProperty( comboboxMejorasF, "Disabled", "True")
		setCameraMatrix(poxf,poyf,pozf,rotxf,rotyf,rotzf)
		setTimer (function ( )
				setCameraTarget (getLocalPlayer())
				guiSetProperty( botonVisualizarMF, "Disabled", "False" )
				guiSetProperty( botonSalirMF, "Disabled", "False" )
				guiSetProperty( comboboxMejorasF, "Disabled", "False")
				if(getElementData(localPlayer, "Mejoffabobjetoseis") == 0)then
					guiSetProperty( botonComprarMF, "Disabled", "False" )
				end
				destroyElement(objetoMF1)
				destroyElement(objetoMF2)
				destroyElement(objetoMF3)
		end,5000, 1)
		end
		if(objVisualF == "Mejora Produccion sala 2") then
		objetoMF1 = createObject(2709,-54.5,-216.5,-99.5,0,0,0)
		objetoMF2 = createObject(1575,-54.5,-217.4,-99.6,0,0,0)
		objetoMF3 = createObject(1650,-53.9,-218.4,-99.4,0,0,0)
		pedVisMF = createPed (144,-55.173240661621, -217.58047485352, -99.591575622559,270)
		setPedAnimation ( pedVisMF , "casino", "dealone", -1,true, false, false, false, 250, false)
		guiSetProperty( botonVisualizarMF, "Disabled", "True" )
		guiSetProperty( botonSalirMF, "Disabled", "True" )
		guiSetProperty( botonComprarMF, "Disabled", "True" )
		guiSetProperty( comboboxMejorasF, "Disabled", "True")
		setCameraMatrix(poxf,poyf,pozf,rotxf,rotyf,rotzf)
		setTimer (function ( )
				setCameraTarget (getLocalPlayer())
				guiSetProperty( botonVisualizarMF, "Disabled", "False" )
				guiSetProperty( botonSalirMF, "Disabled", "False" )
				guiSetProperty( comboboxMejorasF, "Disabled", "False")
				if(getElementData(localPlayer, "Mejoffabobjetosiet") == 0)then
					guiSetProperty( botonComprarMF, "Disabled", "False" )
				end
				destroyElement(objetoMF1)
				destroyElement(objetoMF2)
				destroyElement(objetoMF3)
				destroyElement(pedVisMF)
		end,5000, 1)
		end
		if(objVisualF == "2 Mejora Produccion sala 2") then
		objetoMF1 = createObject(2709,-54.5,-218.9,-99.5,0,0,0)
		objetoMF2 = createObject(1575,-54.5,-219.6,-99.6,0,0,0)
		objetoMF3 = createObject(1279,-54.3,-220.7,-99.6,0,0,0)
		pedVisMF = createPed (144,-55.176170349121, -219.83633422852, -99.598434448242,270)
		setPedAnimation ( pedVisMF , "casino", "dealone", -1,true, false, false, false, 250, false)
		guiSetProperty( botonVisualizarMF, "Disabled", "True" )
		guiSetProperty( botonSalirMF, "Disabled", "True" )
		guiSetProperty( botonComprarMF, "Disabled", "True" )
		guiSetProperty( comboboxMejorasF, "Disabled", "True")
		setCameraMatrix(poxf,poyf,pozf,rotxf,rotyf,rotzf)
		setTimer (function ( )
				setCameraTarget (getLocalPlayer())
				guiSetProperty( botonVisualizarMF, "Disabled", "False" )
				guiSetProperty( botonSalirMF, "Disabled", "False" )
				guiSetProperty( comboboxMejorasF, "Disabled", "False")
				if(getElementData(localPlayer, "Mejoffabobjetoocho") == 0)then
					guiSetProperty( botonComprarMF, "Disabled", "False" )
				end
				destroyElement(objetoMF1)
				destroyElement(objetoMF2)
				destroyElement(objetoMF3)
				destroyElement(pedVisMF)
		end,5000, 1)
		end
		end, false)
	
	addEventHandler("onClientGUIClick", botonComprarMF, 
	function()
	local cantidadDinero = getPlayerMoney()
	if(objVisualF == "Velocidad en Procesos sala 1") then 
		if (cantidadDinero>=Precio) then
			if(getElementData(getLocalPlayer(),"tiempoProcesosFabri") == 0)then
				triggerServerEvent ( "quitarPlataServer", getLocalPlayer(),Precio)
				setElementData (getLocalPlayer(), "Mejoffabobjetouno", 1)
				setElementData (getLocalPlayer(), "tiempoProcesosFabri", 1)
				outputChatBox("[Fabrica]#ffffffCompra realizada con exito", 227, 13, 13,true)
			end
		else
			outputChatBox("[Fabrica]#ffffffNo tienes la cantidad de dinero suficiente para realizar la compra", 227, 13, 13,true)	
		end
	end
	if(objVisualF == "Mejora Produccion sala 1") then 
		if (cantidadDinero>=Precio) then
			triggerServerEvent ( "quitarPlataServer", getLocalPlayer(),Precio)
			local cMM1 = getElementData (getLocalPlayer(), "cantMejorMaq1")
			setElementData (getLocalPlayer(), "Mejoffabobjetotres", 1)
			setElementData (getLocalPlayer(), "cantMejorMaq1", cMM1+1)
			outputChatBox("[Fabrica]#ffffffCompra realizada con exito", 227, 13, 13,true)
		else
			outputChatBox("[Fabrica]#ffffffNo tienes la cantidad de dinero suficiente para realizar la compra", 227, 13, 13,true)	
		end
	end
	if(objVisualF == "2 Mejora Produccion sala 1") then 
		if (cantidadDinero>=Precio) then
			triggerServerEvent ( "quitarPlataServer", getLocalPlayer(),Precio)
			local cMM1 = getElementData (getLocalPlayer(), "cantMejorMaq1")
			setElementData (getLocalPlayer(), "Mejoffabobjetocuat", 1)
			setElementData (getLocalPlayer(), "cantMejorMaq1", cMM1+1)
			outputChatBox("[Fabrica]#ffffffCompra realizada con exito", 227, 13, 13,true)
		else
			outputChatBox("[Fabrica]#ffffffNo tienes la cantidad de dinero suficiente para realizar la compra", 227, 13, 13,true)	
		end
	end
	if(objVisualF == "Desbloquear Segunda Sala") then 
		if (cantidadDinero>=Precio) then
			triggerServerEvent ( "quitarPlataServer", getLocalPlayer(),Precio)
			setElementData (getLocalPlayer(), "Mejoffabobjetodos", 1)
			outputChatBox("[Fabrica]#ffffffCompra realizada con exito", 227, 13, 13,true)
		else
			outputChatBox("[Fabrica]#ffffffNo tienes la cantidad de dinero suficiente para realizar la compra", 227, 13, 13,true)	
		end
	end
	if(objVisualF == "Desbloquear Maquina Segunda Sala") then 
		if (cantidadDinero>=Precio) then
			triggerServerEvent ( "quitarPlataServer", getLocalPlayer(),Precio)
			setElementData (getLocalPlayer(), "Mejoffabobjetocinc", 1)
			outputChatBox("[Fabrica]#ffffffCompra realizada con exito", 227, 13, 13,true)
		else
			outputChatBox("[Fabrica]#ffffffNo tienes la cantidad de dinero suficiente para realizar la compra", 227, 13, 13,true)	
		end
	end
	if(objVisualF == "Velocidad en Procesos sala 2") then 
		if (cantidadDinero>=Precio) then
			if(getElementData(getLocalPlayer(),"tiempoProcesosFabri2") == 0)then
				triggerServerEvent ( "quitarPlataServer", getLocalPlayer(),Precio)
				setElementData (getLocalPlayer(), "Mejoffabobjetoseis", 1)
				setElementData (getLocalPlayer(), "tiempoProcesosFabri2", 1)
				outputChatBox("[Fabrica]#ffffffCompra realizada con exito", 227, 13, 13,true)
			end
		else
			outputChatBox("[Fabrica]#ffffffNo tienes la cantidad de dinero suficiente para realizar la compra", 227, 13, 13,true)	
		end
	end
	if(objVisualF == "Mejora Produccion sala 2") then 
		if (cantidadDinero>=Precio) then
			triggerServerEvent ( "quitarPlataServer", getLocalPlayer(),Precio)
			local cMM1 = getElementData (getLocalPlayer(), "cantMejorMaq2")
			setElementData (getLocalPlayer(), "Mejoffabobjetosiet", 1)
			setElementData (getLocalPlayer(), "cantMejorMaq2", cMM1+1)
			outputChatBox("[Fabrica]#ffffffCompra realizada con exito", 227, 13, 13,true)
		else
			outputChatBox("[Fabrica]#ffffffNo tienes la cantidad de dinero suficiente para realizar la compra", 227, 13, 13,true)	
		end
	end
	if(objVisualF == "2 Mejora Produccion sala 2") then 
		if (cantidadDinero>=Precio) then
			triggerServerEvent ( "quitarPlataServer", getLocalPlayer(),Precio)
			local cMM1 = getElementData (getLocalPlayer(), "cantMejorMaq2")
			setElementData (getLocalPlayer(), "Mejoffabobjetoocho", 1)
			setElementData (getLocalPlayer(), "cantMejorMaq2", cMM1+1)
			outputChatBox("[Fabrica]#ffffffCompra realizada con exito", 227, 13, 13,true)
		else
			outputChatBox("[Fabrica]#ffffffNo tienes la cantidad de dinero suficiente para realizar la compra", 227, 13, 13,true)	
		end
	end
	end, false)
	addEventHandler("onClientGUIClick", botonComprarMF, salir4, false)
end

function verCamaraAca()
--setElementData  (localPlayer, "Mejoffabobjetotres", 0)
--setElementData  (localPlayer, "Mejoffabobjetocuat", 0)
as = getElementData (localPlayer, "cantMejorMaq1")
--setElementData  (localPlayer, "Mejoffabobjetouno", 0)
outputChatBox(" ".. as, 227, 13, 13,true)
end

addCommandHandler("fa",verCamaraAca)

function verCamara()
local x, y, z, lx, ly, lz = getCameraMatrix()
outputChatBox(" " .. x .. "," .. y .. "," .. z .. "," .. lx .. "," .. ly .. "," .. lz, 227, 13, 13,true)
end

addCommandHandler("cam",verCamara)

function salir4()
	showCursor(false)
	destroyElement(window4)
end

addEventHandler('onClientMarkerHit', markertVentaMejorasFabrica,
function ( hitPlayer )
	if ( getElementType ( hitPlayer ) == "player" ) and ( hitPlayer == localPlayer ) then
		if(getElementData(localPlayer, "Ocupacion" ) == "Fabricante de drogas") then
			if(isPedInVehicle (getLocalPlayer()))then
				outputChatBox("[Fabrica]#ffffffNo puedes interactuar si estas en un vehiculo", 227, 13, 13,true)
			else
			PanelMejorasFabrica()
			end
		else
			outputChatBox("[Fabrica]#ffffffNo puedes comprar mejoras si no eres Fabricante de drogas",227, 13, 13,true)		
		end
	end
end)