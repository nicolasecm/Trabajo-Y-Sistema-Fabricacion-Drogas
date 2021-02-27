local Maquina1 = nil
local markMa1 = nil
local markMa2 = nil
local markMa3 = nil
local markerProceso1 = nil
local markerProceso2 = nil
local Maquina2 = nil
local mark2Maq1 = nil
local mark2Maq2 = nil
local mark2Maq3 = nil
local marker2MaqProc1 = nil
local marker2MaqProc2 = nil
local Puerta1 = nil
local Puerta2 = nil
local objetoDroga = nil
local objetoDroga2 = nil
local objectf1 = nil
local objectf2 = nil
local objectf3 = nil
local objectf4 = nil
local objectf5 = nil
local objectf6 = nil
local objectf7 = nil
local objectf8 = nil
local objectf9 = nil
local objectf10 = nil
local objectf11 = nil
local objectf12 = nil
local objectf13 = nil
local objectf14 = nil
local objectf15 = nil
local objectf16 = nil
local pedMej1 = nil
local pedMej2 = nil
local pedMej3 = nil
local pedMej4 = nil
local panelFabricas = false
local sx,sy = guiGetScreenSize()
local px,py = 1440,900
local x,y =  (sx/px), (sy/py)

markertEntradaFabrica = createMarker (-49.86328125, -269.37109375, 7.633186340332, "arrow",1.8, 227, 13, 13, 255 )
createBlip ( -49.86328125, -269.37109375, 7.633186340332 ,51, 1, 255, 0, 0, 255, 0, 300 )
markertSalidaFabrica = createMarker (-54.261131286621, -269.84649658203, -100.598434448242, "cylinder",1.8, 227, 13, 13, 255 )

addEventHandler('onClientMarkerHit', markertSalidaFabrica,
function ( hitPlayer )
	if (getElementDimension(hitPlayer) == 0 ) then
	else
	if ( getElementType ( hitPlayer ) == "player" ) and ( hitPlayer == localPlayer ) then
		setElementPosition(localPlayer,-49.533203125, -271.494140625, 6.633186340332)
		setElementRotation ( localPlayer,0,0,180)
		setElementDimension(localPlayer,0)
		if(getElementData(Maquina1,"proceso1Compro") == true) then
				removeEventHandler("onClientRender",root,BarraProceso1)
		end
		if(getElementData(Maquina1,"proceso2Compro") == true) then
				removeEventHandler("onClientRender",root,BarraProceso2)
		end
		if(getElementData(Maquina2,"proceso1Compro") == true) then
				removeEventHandler("onClientRender",root,BarraProceso3)
		end
		if(getElementData(Maquina2,"proceso2Compro") == true) then
				removeEventHandler("onClientRender",root,BarraProceso4)
		end
		comprobarObjetoFab(Maquina1)
		comprobarObjetoFab(markMa1)
		comprobarObjetoFab(markMa2)
		comprobarObjetoFab(markMa3)
		comprobarObjetoFab(markerProceso1)
		comprobarObjetoFab(markerProceso2)
		comprobarObjetoFab(Maquina2)
		comprobarObjetoFab(mark2Maq1)
		comprobarObjetoFab(mark2Maq2)
		comprobarObjetoFab(mark2Maq3)
		comprobarObjetoFab(marker2MaqProc1)
		comprobarObjetoFab(marker2MaqProc2)
		comprobarObjetoFab(objetoDroga)
		comprobarObjetoFab(objetoDroga2)
		comprobarObjetoFab(Puerta1)
		comprobarObjetoFab(Puerta2)
		comprobarObjetoFab(objectf1)
		comprobarObjetoFab(objectf2)
		comprobarObjetoFab(objectf3)
		comprobarObjetoFab(objectf4)
		comprobarObjetoFab(objectf5)
		comprobarObjetoFab(objectf6)
		comprobarObjetoFab(objectf7)
		comprobarObjetoFab(objectf8)
		comprobarObjetoFab(objectf9)
		comprobarObjetoFab(objectf10)
		comprobarObjetoFab(pedMej1)
		comprobarObjetoFab(pedMej2)
		toggleControl ( "next_weapon", true ) 
		toggleControl ( "previous_weapon", true ) 
	end
	end
end)

addEventHandler('onClientMarkerHit', markertEntradaFabrica,
function ( hitPlayer )
    if ( getElementType ( hitPlayer ) == "player" ) and ( hitPlayer == localPlayer ) then
		if(getElementData(localPlayer, "Ocupacion" ) == "Fabricante de drogas") then
		if(isPedInVehicle (getLocalPlayer()))then
				outputChatBox("[Fabrica]#ffffffNo puedes entrar si estas en un vehiculo", 227, 13, 13,true)
			else
			dimJuga = getElementData(localPlayer,"DimensionTrafico")
			setElementDimension(localPlayer,dimJuga)
			Maquina1 = objetoConDimension(14584, -68.4,-277.60001,-98.8,0,0,0)
			setPedWeaponSlot ( localPlayer, 0 )
			toggleControl ( "next_weapon", false ) 
			toggleControl ( "previous_weapon", false ) 
			setElementData(	Maquina1,"enUso",false)
			setElementData(	Maquina1,"proceso1",0)
			setElementData(	Maquina1,"proceso2",0)
			setElementData(	Maquina1,"proceso1Compro",false)
			setElementData(	Maquina1,"proceso2Compro",false)
			setElementData( Maquina1,"droga","ninguna")
			markMa1= markerConDimension (-68.208396911621, -269.36993408203, -100.598434448242)
			markMa2= markerConDimension (-69.906639099121, -259.75274658203, -100.598434448242)
			markMa3= markerConDimension (-68.590232849121, -249.97245788574, -100.598434448242)
			markerProceso1 = markerConDimensionMak (-68.44921875, -264.0732421875, -99.621002197266)
			markerProceso2 = markerConDimensionMak (-68.3818359375, -255.267578125, -99.621002197266)
			Puerta1 = objetoConDimension(6959,-61.599998474121,-239.89999389648,-96.900001525879,90,0,0)
			Puerta2 = objetoConDimension(6959,-53.299999237061,-224.10000610352,-96.900001525879,90,90,0)
			if(getElementData(localPlayer, "Mejoffabobjetouno") == 1) then
				objectf1 = objetoConDimension(1691,-68.2,-254.7,-97.2,0,0,0)
				objectf2 = objetoConDimension(1691,-68.4,-265.10001,-97.2,0,0,0)
			end
			if(getElementData(localPlayer, "Mejoffabobjetotres") == 1) then
				objectf3 = objetoConDimension(1575,-54.4,-256.7,-99.6,0,0,0)
				objectf4 = objetoConDimension(1654,-53.9,-256.5,-99.4,0,0,270)
				objectf5 = objetoConDimension(2709,-54.5,-258.1,-99.5,0,0,0)
				pedMej1 = pedConDimension (144,-55.182029724121, -257.28302001953, -99.598434448242,270)
				setPedAnimation ( pedMej1 , "casino", "dealone", -1,true, false, false, false, 250, false)
				function cancelPedDamage ( attacker )
					cancelEvent()
				end
				addEventHandler ( "onClientPedDamage", pedMej1, cancelPedDamage )
			end
			if(getElementData(localPlayer, "Mejoffabobjetocuat") == 1) then
				objectf6 = objetoConDimension(2709,-54.5,-258.7,-99.50,0,0,0)
				objectf7 = objetoConDimension(1575,-54.4,-259.1,-99.6,0,0,0)
				objectf8 = objetoConDimension(2060,-54.2,-260.5,-99.5,0,0,0)
				pedMej2 = pedConDimension (144,-55.176170349121, -259.76153564453, -99.598434448242,270)
				setPedAnimation ( pedMej2 , "casino", "dealone", -1,true, false, false, false, 250, false)
				function cancelPedDamage ( attacker )
					cancelEvent()
				end
				addEventHandler ( "onClientPedDamage", pedMej2, cancelPedDamage )
			end
			if(getElementData(localPlayer, "Mejoffabobjetocinc") == 1) then
				Maquina2 = objetoConDimension(14584,-68.7,-207.8,-98.8,0,0,0)
				mark2Maq1= markerConDimension (-68.594139099121, -235.41484069824, -100.598434448242)
				mark2Maq2= markerConDimension (-70.524803161621, -225.66250610352, -100.591575622559)
				mark2Maq3= markerConDimension (-68.523826599121, -216.02090454102, -100.598434448242)
				marker2MaqProc1 = markerConDimensionMak (-68.6953125, -220.65234375, -99.621002197266)
				marker2MaqProc2 = markerConDimensionMak (-68.7294921875, -230.1181640625, -99.621002197266)
				setElementData(	Maquina2,"enUso",false)
				setElementData(	Maquina2,"proceso1",0)
				setElementData(	Maquina2,"proceso2",0)
				setElementData(	Maquina2,"proceso1Compro",false)
				setElementData(	Maquina2,"proceso2Compro",false)
				setElementData( Maquina2,"droga","ninguna")
				addEventHandler('onClientMarkerHit', mark2Maq1,
				function ( hitPlayer, matc )
					if(matc == true)then
						if(panelFabricas == false)then
							PanelFabricacionDrogasInicio2()
						end
					end
				end)
				addEventHandler('onClientMarkerHit', mark2Maq2,
				function ( hitPlayer, matc2 )
					if(matc2 == true)then
						if ( getElementType ( hitPlayer ) == "player" ) and ( hitPlayer == localPlayer ) then
							if(getElementData(	Maquina2,"proceso1Compro") == true) then
								if(panelFabricas == false)then
									PanelFabricacionDrogasMedio2()
								end
							else
							outputChatBox("[Fabrica]#ffffffNo puedes interactuar si no has comenzado o completado la fabricacion",227, 13, 13,true)		
						end
					end
				end
				end)
				addEventHandler('onClientMarkerHit', mark2Maq3,
				function ( hitPlayer, matc3 )
					if(matc3 == true)then
						if ( getElementType ( hitPlayer ) == "player" ) and ( hitPlayer == localPlayer ) then
							if(getElementData(	Maquina2,"proceso2Compro") == true) then
								if(panelFabricas == false)then
									PanelFabricacionDrogasFin2()
								end
							else
							outputChatBox("[Fabrica]#ffffffNo puedes interactuar si no has comenzado o completado la fabricacion",227, 13, 13,true)		
							end
						end
					end
				end)
			end				
			if(getElementData(localPlayer, "Mejoffabobjetodos") == 1) then
				destroyElement(Puerta1)
			end	
			addEventHandler('onClientMarkerHit', markMa1,
			function ( hitPlayer, matc )
				if(matc == true)then
					if(panelFabricas == false)then
						PanelFabricacionDrogasInicio()
					end
				end
			end)
			addEventHandler('onClientMarkerHit', markMa2,
			function ( hitPlayer, matc2 )
				if(matc2 == true)then
				if ( getElementType ( hitPlayer ) == "player" ) and ( hitPlayer == localPlayer ) then
					if(getElementData(	Maquina1,"proceso1Compro") == true) then
						if(panelFabricas == false)then
							PanelFabricacionDrogasMedio()
						end
					else
						outputChatBox("[Fabrica]#ffffffNo puedes interactuar si no has comenzado o completado la fabricacion",227, 13, 13,true)		
					end
				end
				end
			end)
			addEventHandler('onClientMarkerHit', markMa3,
				function ( hitPlayer, matc3 )
				if(matc3 == true)then
				if ( getElementType ( hitPlayer ) == "player" ) and ( hitPlayer == localPlayer ) then
					if(getElementData(	Maquina1,"proceso2Compro") == true) then
						if(panelFabricas == false)then
							PanelFabricacionDrogasFin()
						end
					else
						outputChatBox("[Fabrica]#ffffffNo puedes interactuar si no has comenzado o completado la fabricacion",227, 13, 13,true)		
					end
				end
				end
				end)
			if(getElementData(localPlayer, "Mejoffabobjetoseis") == 1) then
				objectf9 = objetoConDimension(1691,-68.8,-231.1,-97.2,0,0,0)
				objectf10 = objetoConDimension(1691,-68.5,-220.5,-97.2,0,0,0)
			end
			if(getElementData(localPlayer, "Mejoffabobjetosiet") == 1) then
				objectf11 = objetoConDimension(2709,-54.5,-216.5,-99.5,0,0,0)
				objectf12 = objetoConDimension(1575,-54.5,-217.4,-99.6,0,0,0)
				objectf13 = objetoConDimension(1650,-53.9,-218.4,-99.4,0,0,0)
				pedMej3 = pedConDimension (144,-55.173240661621, -217.58047485352, -99.591575622559,270)
				setPedAnimation ( pedMej3 , "casino", "dealone", -1,true, false, false, false, 250, false)
				function cancelPedDamage ( attacker )
					cancelEvent()
				end
				addEventHandler ( "onClientPedDamage", pedMej3, cancelPedDamage )
			end
			if(getElementData(localPlayer, "Mejoffabobjetoocho") == 1) then
				objectf14 = objetoConDimension(2709,-54.5,-218.9,-99.5,0,0,0)
				objectf15 = objetoConDimension(1575,-54.5,-219.6,-99.6,0,0,0)
				objectf16 = objetoConDimension(1279,-54.3,-220.7,-99.6,0,0,0)
				pedMej4 = pedConDimension (144,-55.176170349121, -219.83633422852, -99.598434448242,270)
				setPedAnimation ( pedMej4 , "casino", "dealone", -1,true, false, false, false, 250, false)
				function cancelPedDamage ( attacker )
					cancelEvent()
				end
				addEventHandler ( "onClientPedDamage", pedMej4, cancelPedDamage )
			end
			setElementPosition ( localPlayer,  -57.544334411621, -270.05450439453, -99.591575622559)
			setElementRotation ( localPlayer,0,0,-90)
			end
		else
			outputChatBox("[Fabrica]#ffffffNo puedes entrar si no eres Fabricante de drogas",227, 13, 13,true)		
		end
	end
end)

function PanelFabricacionDrogasInicio()
	window10 = guiCreateWindow(529, 318, 383, 317, "Fabricacion Drogas", false)
    guiWindowSetSizable(window10, false)
	panelFabricas = true
	local BotEmpDro = nil
	if(getElementData(Maquina1,"enUso") == false) then
		BotEmpDro = "False"
	else
		BotEmpDro = "True"
	end
	Label1Dro = guiCreateLabel(15, 31, 322, 29, "Selecciona una de las drogas para empezar la fabricacion:", false, window10)
    radiobuttonDrog1 = guiCreateRadioButton(15, 60, 105, 21, "Metanfetamina", false, window10)
	labelDroMetan = guiCreateLabel(15, 81, 356, 17, "Materiales:3 materia prima, 2 gasolina, 2 quimico A, 2 quimico B", false, window10)
	ColMe1,ColMe2,ColMe3 = comprobarMaterialesFabCol(3,2,2,2)
	guiLabelSetColor(labelDroMetan, ColMe1,ColMe2,ColMe3)
    radiobuttonDrog2 = guiCreateRadioButton(15, 98, 105, 21, "Extasis", false, window10)
	labelDroExta = guiCreateLabel(15, 119, 356, 19, "Materiales:2 materia prima,2 gasolina, 1 quimico A, 2 quimico B", false, window10)
	ColEx1,ColEx2,ColEx3 = comprobarMaterialesFabCol(2,2,1,2)
    guiLabelSetColor(labelDroExta, ColEx1,ColEx2,ColEx3)
    radiobuttonDrog3 = guiCreateRadioButton(15, 138, 105, 21, "Marihuana", false, window10)
    labelDroMarih = guiCreateLabel(15, 159, 355, 19, "Materiales:2 materia prima,2 gasolina, 1 quimico A, 1 quimico B", false, window10)
	ColMa1,ColMa2,ColMa3 = comprobarMaterialesFabCol(2,2,1,1)
    guiLabelSetColor(labelDroMarih, ColMa1,ColMa2,ColMa3)
    BotonEmpezarDrogFab = guiCreateButton(15, 243, 148, 57, "Empezar Creacion", false, window10)
    BotonSalirDrogFab = guiCreateButton(212, 243, 148, 57, "Salir", false, window10) 
	guiSetProperty(BotonEmpezarDrogFab, "Disabled", BotEmpDro)
	guiRadioButtonSetSelected(radiobuttonDrog1,true)
	radiobuttonDrog4 = guiCreateRadioButton(15, 177, 105, 21, "Crack", false, window10)
	labelDroCrack = guiCreateLabel(15, 198, 355, 19, "Materiales:4 materia prima,2 gasolina, 1 quimico A, 2 quimico B", false, window10)
	ColCr1,ColCr2,ColCr3 = comprobarMaterialesFabCol(4,2,1,2)
    guiLabelSetColor(labelDroCrack, ColCr1,ColCr2,ColCr3)   
	showCursor(true)
	addEventHandler("onClientGUIClick", BotonSalirDrogFab , salir10, false)
	addEventHandler("onClientGUIClick", BotonEmpezarDrogFab, 
	function ()
		if(guiRadioButtonGetSelected(radiobuttonDrog1))then
			local com1 = comprobarMaterialesFabCre(3,2,2,2)
			if(com1 == true)then
				quitarMaterialesFabri(3,2,2,2)
				ConfirmarInicioFab("Metanfetamina")
			else
				outputChatBox("[Fabrica]#ffffffNo tienes los materiales suficientes",227, 13, 13,true)
			end
		
		elseif(guiRadioButtonGetSelected(radiobuttonDrog2))then
			local com2 = comprobarMaterialesFabCre(2,2,1,2)
			if(com2 == true)then
				quitarMaterialesFabri(2,2,1,2)
				ConfirmarInicioFab("Extasis")
			else
				outputChatBox("[Fabrica]#ffffffNo tienes los materiales suficientes",227, 13, 13,true)
			end
		
		elseif(guiRadioButtonGetSelected(radiobuttonDrog3))then
			local com3 = comprobarMaterialesFabCre(2,2,1,1)
			if(com3 == true)then
				quitarMaterialesFabri(2,2,1,1)
				ConfirmarInicioFab("Marihuana")
			else
				outputChatBox("[Fabrica]#ffffffNo tienes los materiales suficientes",227, 13, 13,true)
			end
		elseif(guiRadioButtonGetSelected(radiobuttonDrog4))then
			local com4 = comprobarMaterialesFabCre(4,2,1,2)
			if(com4 == true)then
				quitarMaterialesFabri(4,2,1,2)
				ConfirmarInicioFab("Crack")
			else
				outputChatBox("[Fabrica]#ffffffNo tienes los materiales suficientes",227, 13, 13,true)
			end
		else
			outputChatBox("[Fabrica]#ffffffSelecciona una droga",227, 13, 13,true)
		end
	end
	, false)
	addEventHandler("onClientGUIClick", BotonEmpezarDrogFab, salir10, false)
end

function salir10()
	showCursor(false)
	destroyElement(window10)
	panelFabricas = false
end

function ConfirmarInicioFab(droga)
	local tiempoMovePrimer = getTiempoProceso()
	dimJugaElem = getElementData(localPlayer,"DimensionTrafico")
	setElementData(Maquina1,"droga",droga)
	objetoDroga = createObject(1575,-68.3798828125, -268.4697265625, -99.392646789551)
	setElementDimension(objetoDroga,dimJugaElem)
	moveObject(objetoDroga,tiempoMovePrimer,-68.10546875, -259.7373046875, -99.392646789551)
	addEventHandler("onClientRender",root,BarraProceso1)
	setElementData(	Maquina1,"enUso",true)
	setElementData(	Maquina1,"proceso1Compro",true)
	outputChatBox("[Fabrica]#ffffffProceso 1 iniciado",227, 13, 13,true)
end

function PanelFabricacionDrogasInicio2()
	window20 = guiCreateWindow(529, 318, 383, 317, "Fabricacion Drogas", false)
    guiWindowSetSizable(window20, false)
	panelFabricas = true
	local BotEmpDro2 = nil
	if(getElementData(Maquina2,"enUso") == false) then
		BotEmpDro2 = "False"
	else
		BotEmpDro2 = "True"
	end
	Label1Dro = guiCreateLabel(15, 31, 322, 29, "Selecciona una de las drogas para empezar la fabricacion:", false, window20)
    radiobuttonDrog1 = guiCreateRadioButton(15, 60, 105, 21, "Metanfetamina", false, window20)
	labelDroMetan = guiCreateLabel(15, 81, 356, 17, "Materiales:3 materia prima, 2 gasolina, 2 quimico A, 2 quimico B", false, window20)
	ColMe1,ColMe2,ColMe3 = comprobarMaterialesFabCol(3,2,2,2)
	guiLabelSetColor(labelDroMetan, ColMe1,ColMe2,ColMe3)
    radiobuttonDrog2 = guiCreateRadioButton(15, 98, 105, 21, "Extasis", false, window20)
	labelDroExta = guiCreateLabel(15, 119, 356, 19, "Materiales:2 materia prima,2 gasolina, 1 quimico A, 2 quimico B", false, window20)
	ColEx1,ColEx2,ColEx3 = comprobarMaterialesFabCol(2,2,1,2)
    guiLabelSetColor(labelDroExta, ColEx1,ColEx2,ColEx3)
    radiobuttonDrog3 = guiCreateRadioButton(15, 138, 105, 21, "Marihuana", false, window20)
    labelDroMarih = guiCreateLabel(15, 159, 355, 19, "Materiales:2 materia prima,2 gasolina, 1 quimico A, 1 quimico B", false, window20)
	ColMa1,ColMa2,ColMa3 = comprobarMaterialesFabCol(2,2,1,1)
    guiLabelSetColor(labelDroMarih, ColMa1,ColMa2,ColMa3)
    BotonEmpezarDrogFab = guiCreateButton(15, 243, 148, 57, "Empezar Creacion", false, window20)
    BotonSalirDrogFab = guiCreateButton(212, 243, 148, 57, "Salir", false, window20) 
	guiSetProperty(BotonEmpezarDrogFab, "Disabled", BotEmpDro2)
	guiRadioButtonSetSelected(radiobuttonDrog1,true)
	radiobuttonDrog4 = guiCreateRadioButton(15, 177, 105, 21, "Crack", false, window20)
	labelDroCrack = guiCreateLabel(15, 198, 355, 19, "Materiales:4 materia prima,2 gasolina, 1 quimico A, 2 quimico B", false, window20)
	ColCr1,ColCr2,ColCr3 = comprobarMaterialesFabCol(4,2,1,2)
    guiLabelSetColor(labelDroCrack, ColCr1,ColCr2,ColCr3)   
	showCursor(true)
	addEventHandler("onClientGUIClick", BotonSalirDrogFab , salir20, false)
	addEventHandler("onClientGUIClick", BotonEmpezarDrogFab, 
	function ()
		if(guiRadioButtonGetSelected(radiobuttonDrog1))then
			local com1 = comprobarMaterialesFabCre(3,2,2,2)
			if(com1 == true)then
				quitarMaterialesFabri(3,2,2,2)
				ConfirmarInicioFab2("Metanfetamina")
			else
				outputChatBox("[Fabrica]#ffffffNo tienes los materiales suficientes",227, 13, 13,true)
			end
		
		elseif(guiRadioButtonGetSelected(radiobuttonDrog2))then
			local com2 = comprobarMaterialesFabCre(2,2,1,2)
			if(com2 == true)then
				quitarMaterialesFabri(2,2,1,2)
				ConfirmarInicioFab2("Extasis")
			else
				outputChatBox("[Fabrica]#ffffffNo tienes los materiales suficientes",227, 13, 13,true)
			end
		
		elseif(guiRadioButtonGetSelected(radiobuttonDrog3))then
			local com3 = comprobarMaterialesFabCre(2,2,1,1)
			if(com3 == true)then
				quitarMaterialesFabri(2,2,1,1)
				ConfirmarInicioFab2("Marihuana")
			else
				outputChatBox("[Fabrica]#ffffffNo tienes los materiales suficientes",227, 13, 13,true)
			end
		elseif(guiRadioButtonGetSelected(radiobuttonDrog4))then
			local com4 = comprobarMaterialesFabCre(4,2,1,2)
			if(com4 == true)then
				quitarMaterialesFabri(4,2,1,2)
				ConfirmarInicioFab2("Crack")
			else
				outputChatBox("[Fabrica]#ffffffNo tienes los materiales suficientes",227, 13, 13,true)
			end
		else
			outputChatBox("[Fabrica]#ffffffSelecciona una droga",227, 13, 13,true)
		end
	end
	, false)
	addEventHandler("onClientGUIClick", BotonEmpezarDrogFab, salir20, false)
end

function salir20()
	showCursor(false)
	destroyElement(window20)
	panelFabricas = false
end

function ConfirmarInicioFab2(droga)
	local tiempoMovePrimer = getTiempoProceso()
	dimJugaElem = getElementData(localPlayer,"DimensionTrafico")
	setElementData(Maquina2,"droga",droga)
	objetoDroga2 = createObject(1575,-68.57421875, -234.55078125, -99.392646789551)
	setElementDimension(objetoDroga2,dimJugaElem)
	moveObject(objetoDroga2,tiempoMovePrimer,-68.4541015625, -225.728515625, -99.392646789551)
	addEventHandler("onClientRender",root,BarraProceso3)
	setElementData(	Maquina2,"enUso",true)
	setElementData(	Maquina2,"proceso1Compro",true)
	outputChatBox("[Fabrica]#ffffffProceso 1 iniciado",227, 13, 13,true)
end

function PanelFabricacionDrogasMedio()
    window11 = guiCreateWindow(623, 325, 313, 165, "Agregar Quimicos", false)
    guiWindowSetSizable(window11, false)
	panelFabricas = true
	
	local nomDrog = getElementData(Maquina1,"droga")
	BotonAgregarQuimicosFa = guiCreateButton(30, 77, 112, 59, "Agregar Quimicos", false, window11)
    LabelQuimi = guiCreateLabel(28, 26, 257, 41, "Estas creando "..nomDrog.." Agrega los quimicos", false, window11)
    BotonSalirInter = guiCreateButton(175, 77, 112, 59, "Salir", false, window11)
	
	showCursor(true)
	addEventHandler("onClientGUIClick", BotonSalirInter , salir11, false)
	addEventHandler("onClientGUIClick", BotonAgregarQuimicosFa, ConfirmarMedioFab, false)
	addEventHandler("onClientGUIClick", BotonAgregarQuimicosFa, salir11, false)
end

function salir11()
	showCursor(false)
	destroyElement(window11)
	panelFabricas = false
end

function ConfirmarMedioFab()
local porcentajeProceso = getElementData(Maquina1,"proceso1")
	if(porcentajeProceso >= 100)then
		removeEventHandler("onClientRender",root,BarraProceso1)
		addEventHandler("onClientRender",root,BarraProceso2)
		outputChatBox("[Fabrica]#ffffffProceso 2 iniciado",227, 13, 13,true)
		setElementData(	Maquina1,"proceso1Compro",false)
		setElementData(	Maquina1,"proceso2Compro",true)
		setElementData(	Maquina1,"proceso1",0)
		destroyElement(objetoDroga)
		if(getElementData(Maquina1,"droga") == "Marihuana")then
		crarDrogaFab(1578)
		end
		if(getElementData(Maquina1,"droga") == "Extasis")then
		crarDrogaFab(1576)
		end
		if(getElementData(Maquina1,"droga") == "Metanfetamina")then
		crarDrogaFab(1579)
		end
		if(getElementData(Maquina1,"droga") == "Crack")then
		crarDrogaFab(1580)
		end
	else
		outputChatBox("[Fabrica]#ffffffNo se ha terminado el proceso 1",227, 13, 13,true)		
	end
end

function PanelFabricacionDrogasMedio2()
    window21 = guiCreateWindow(623, 325, 313, 165, "Agregar Quimicos", false)
    guiWindowSetSizable(window21, false)
	panelFabricas = true
	
	local nomDrog = getElementData(Maquina2,"droga")
	BotonAgregarQuimicosFa2 = guiCreateButton(30, 77, 112, 59, "Agregar Quimicos", false, window21)
    LabelQuimi = guiCreateLabel(28, 26, 257, 41, "Estas creando "..nomDrog.." Agrega los quimicos", false, window21)
    BotonSalirInter2 = guiCreateButton(175, 77, 112, 59, "Salir", false, window21)
	
	showCursor(true)
	addEventHandler("onClientGUIClick", BotonSalirInter2 , salir21, false)
	addEventHandler("onClientGUIClick", BotonAgregarQuimicosFa2, ConfirmarMedioFab2, false)
	addEventHandler("onClientGUIClick", BotonAgregarQuimicosFa2, salir21, false)
end

function salir21()
	showCursor(false)
	destroyElement(window21)
	panelFabricas = false
end

function ConfirmarMedioFab2()
local porcentajeProceso = getElementData(Maquina2,"proceso1")
	if(porcentajeProceso >= 100)then
		removeEventHandler("onClientRender",root,BarraProceso3)
		addEventHandler("onClientRender",root,BarraProceso4)
		outputChatBox("[Fabrica]#ffffffProceso 2 iniciado",227, 13, 13,true)
		setElementData(	Maquina2,"proceso1Compro",false)
		setElementData(	Maquina2,"proceso2Compro",true)
		setElementData(	Maquina2,"proceso1",0)
		destroyElement(objetoDroga2)
		if(getElementData(Maquina2,"droga") == "Marihuana")then
		crarDroga2Fab(1578)
		end
		if(getElementData(Maquina2,"droga") == "Extasis")then
		crarDroga2Fab(1576)
		end
		if(getElementData(Maquina2,"droga") == "Metanfetamina")then
		crarDroga2Fab(1579)
		end
		if(getElementData(Maquina2,"droga") == "Crack")then
		crarDroga2Fab(1580)
		end
	else
		outputChatBox("[Fabrica]#ffffffNo se ha terminado el proceso 1",227, 13, 13,true)		
	end
end

function PanelFabricacionDrogasFin()
    window12 = guiCreateWindow(623, 325, 313, 165, "Recoger Droga", false)
    guiWindowSetSizable(window12, false)
	panelFabricas = true
	
	BotonSacarProductoFa = guiCreateButton(30, 77, 112, 59, "Recoger", false, window12)
    LabelSacar = guiCreateLabel(28, 26, 257, 41, "Saca el producto Final", false, window12)
    BotonSalirFinal = guiCreateButton(175, 77, 112, 59, "Salir", false, window12)
	
	showCursor(true)
	addEventHandler("onClientGUIClick", BotonSalirFinal , salir12, false)
	addEventHandler("onClientGUIClick", BotonSacarProductoFa, ConfirmarFinFab, false)
	addEventHandler("onClientGUIClick", BotonSacarProductoFa, salir12, false)
end

function salir12()
	showCursor(false)
	destroyElement(window12)
	panelFabricas = false
end

function ConfirmarFinFab()
local porcentajeProceso = getElementData(Maquina1,"proceso2")
	if(porcentajeProceso >= 100)then
		removeEventHandler("onClientRender",root,BarraProceso2)
		local Ndrog = getElementData(Maquina1, "droga")
		CantDrogFinal = getElementData(localPlayer,"cantMejorMaq1")
		local cantDrog = 0
		if (CantDrogFinal == 0) then
			cantDrog = 10
		end
		if (CantDrogFinal == 1) then
			cantDrog = 20
		end
		if (CantDrogFinal == 2) then
			cantDrog = 30
		end
		outputChatBox("[Fabrica]#ffffffHas recogido " ..cantDrog .." de "..Ndrog.." correctamente",227, 13, 13,true)
		setElementData(	Maquina1,"proceso2",0)
		setElementData(	Maquina1,"proceso2Compro",false)
		setElementData(	Maquina1,"enUso",false)
		destroyElement(objetoDroga)
		tipoDrogFin = getElementData(Maquina1,"droga")
		darDrogaFinalLab(tipoDrogFin)
	else
		outputChatBox("[Fabrica]#ffffffNo se ha terminado el proceso 2",227, 13, 13,true)		
	end
end

function PanelFabricacionDrogasFin2()
    window22 = guiCreateWindow(623, 325, 313, 165, "Recoger Droga", false)
    guiWindowSetSizable(window22, false)
	panelFabricas = true
	
	BotonSacarProductoFa2 = guiCreateButton(30, 77, 112, 59, "Recoger", false, window22)
    LabelSacar = guiCreateLabel(28, 26, 257, 41, "Saca el producto Final", false, window22)
    BotonSalirFinal2 = guiCreateButton(175, 77, 112, 59, "Salir", false, window22)
	
	showCursor(true)
	addEventHandler("onClientGUIClick", BotonSalirFinal2 , salir22, false)
	addEventHandler("onClientGUIClick", BotonSacarProductoFa2, ConfirmarFinFab2, false)
	addEventHandler("onClientGUIClick", BotonSacarProductoFa2, salir22, false)
end

function salir22()
	showCursor(false)
	destroyElement(window22)
	panelFabricas = false
end

function ConfirmarFinFab2()
local porcentajeProceso = getElementData(Maquina2,"proceso2")
	if(porcentajeProceso >= 100)then
		removeEventHandler("onClientRender",root,BarraProceso4)
		local Ndrog = getElementData(Maquina2, "droga")
		CantDrogFinal = getElementData(localPlayer,"cantMejorMaq2")
		local cantDrog = 0
		if (CantDrogFinal == 0) then
			cantDrog = 10
		end
		if (CantDrogFinal == 1) then
			cantDrog = 20
		end
		if (CantDrogFinal == 2) then
			cantDrog = 30
		end
		outputChatBox("[Fabrica]#ffffffHas recogido " ..cantDrog .." de "..Ndrog.." correctamente",227, 13, 13,true)
		setElementData(	Maquina2,"proceso2",0)
		setElementData(	Maquina2,"proceso2Compro",false)
		setElementData(	Maquina2,"enUso",false)
		destroyElement(objetoDroga2)
		tipoDrogFin = getElementData(Maquina2,"droga")
		darDrogaFinalLab2(tipoDrogFin)
	else
		outputChatBox("[Fabrica]#ffffffNo se ha terminado el proceso 2",227, 13, 13,true)		
	end
end

function darDrogaFinalLab(drogaFija)
MostrarCantDrog = getElementData(localPlayer,drogaFija)
CantDrogFinal = getElementData(localPlayer,"cantMejorMaq1")
if (CantDrogFinal == 0) then
	setElementData( localPlayer,drogaFija,MostrarCantDrog+10)
end
if (CantDrogFinal == 1) then
	setElementData( localPlayer,drogaFija,MostrarCantDrog+20)
end
if (CantDrogFinal == 2) then
	setElementData( localPlayer,drogaFija,MostrarCantDrog+30)
end
end

function darDrogaFinalLab2(drogaFija)
MostrarCantDrog = getElementData(localPlayer,drogaFija)
CantDrogFinal2 = getElementData(localPlayer,"cantMejorMaq2")
if (CantDrogFinal2 == 0) then
	setElementData( localPlayer,drogaFija,MostrarCantDrog+10)
end
if (CantDrogFinal2 == 1) then
	setElementData( localPlayer,drogaFija,MostrarCantDrog+20)
end
if (CantDrogFinal2 == 2) then
	setElementData( localPlayer,drogaFija,MostrarCantDrog+30)
end
end

function BarraProceso1()
if(getElementData(Maquina1,"enUso") == true ) then
	local PosX, PosY, PosZ = getElementPosition(markerProceso1)
	local Pcx, Pcy, Pcz = getCameraMatrix( )
	LocationX, LocationY = getScreenFromWorldPosition(PosX, PosY, PosZ,200)
	local min_distance = getDistanceBetweenPoints3D( Pcx, Pcy, Pcz, PosX, PosY, PosZ )
	porcentajeProceso = getElementData(Maquina1,"proceso1")
	if(porcentajeProceso < 100)then
		if(getElementData(getLocalPlayer(),"tiempoProcesosFabri") == 0)then
			setElementData(Maquina1,"proceso1",porcentajeProceso+0.05)
		else
			setElementData(Maquina1,"proceso1",porcentajeProceso+0.06)
		end
	end
	aproximadoPorcentaje = math.floor(porcentajeProceso)
	if min_distance < 7 then
		if LocationX then
			rect2 = dxDrawRectangle(LocationX+250-102.5,LocationY-50-52.5,1025/4,25,tocolor(0,0,0,127.5))
			dxDrawRectangle(LocationX+250-100,LocationY-50-50,porcentajeProceso* 2.5,20,tocolor(0,127.5,0,127.5))
			dxDrawText("Proceso: "..aproximadoPorcentaje.."%", LocationX+250-50-35, LocationY-50-50, 0, 0, tocolor(255,255,255,127.5), 1, "default-bold")
		end
	end
	end
end

function BarraProceso2()
if(getElementData(Maquina1,"enUso") == true ) then
	local PosX2, PosY2, PosZ2 = getElementPosition(markerProceso2)
	local Pcx2, Pcy2, Pcz2 = getCameraMatrix( )
	LocationX2, LocationY2 = getScreenFromWorldPosition(PosX2, PosY2, PosZ2,200)
	local min_distance = getDistanceBetweenPoints3D( Pcx2, Pcy2, Pcz2, PosX2, PosY2, PosZ2 )
	porcentajeProceso2 = getElementData(Maquina1,"proceso2")
	if(porcentajeProceso2 < 100)then
		if(getElementData(getLocalPlayer(),"tiempoProcesosFabri") == 0)then
			setElementData(Maquina1,"proceso2",porcentajeProceso2+0.05)
		else
			setElementData(Maquina1,"proceso2",porcentajeProceso2+0.06)
		end
	end
	aproximadoPorcentaje2 = math.floor(porcentajeProceso2)
	if min_distance < 7 then
		if LocationX2 then
			rect2 = dxDrawRectangle(LocationX2+250-102.5,LocationY2-50-52.5,1025/4,25,tocolor(0,0,0,127.5))
			dxDrawRectangle(LocationX2+250-100,LocationY2-50-50,porcentajeProceso2* 2.5,20,tocolor(0,127.5,0,127.5))
			dxDrawText("Proceso: "..aproximadoPorcentaje2.."%", LocationX2+250-50-35, LocationY2-50-50, 0, 0, tocolor(255,255,255,127.5), 1, "default-bold")
		end
	end
end
end

function BarraProceso3()
if(getElementData(Maquina2,"enUso") == true ) then
	local PosX, PosY, PosZ = getElementPosition(marker2MaqProc2)
	local Pcx, Pcy, Pcz = getCameraMatrix( )
	LocationX, LocationY = getScreenFromWorldPosition(PosX, PosY, PosZ,200)
	local min_distance = getDistanceBetweenPoints3D( Pcx, Pcy, Pcz, PosX, PosY, PosZ )
	porcentajeProceso = getElementData(Maquina2,"proceso1")
	if(porcentajeProceso < 100)then
		if(getElementData(getLocalPlayer(),"tiempoProcesosFabri2") == 0)then
			setElementData(Maquina2,"proceso1",porcentajeProceso+0.05)
		else
			setElementData(Maquina2,"proceso1",porcentajeProceso+0.06)
		end
	end
	aproximadoPorcentaje = math.floor(porcentajeProceso)
	if min_distance < 7 then
		if LocationX then
			rect2 = dxDrawRectangle(LocationX+250-102.5,LocationY-50-52.5,1025/4,25,tocolor(0,0,0,127.5))
			dxDrawRectangle(LocationX+250-100,LocationY-50-50,porcentajeProceso* 2.5,20,tocolor(0,127.5,0,127.5))
			dxDrawText("Proceso: "..aproximadoPorcentaje.."%", LocationX+250-50-35, LocationY-50-50, 0, 0, tocolor(255,255,255,127.5), 1, "default-bold")
		end
	end
	end
end

function BarraProceso4()
if(getElementData(Maquina2,"enUso") == true ) then
	local PosX2, PosY2, PosZ2 = getElementPosition(marker2MaqProc1)
	local Pcx2, Pcy2, Pcz2 = getCameraMatrix( )
	LocationX2, LocationY2 = getScreenFromWorldPosition(PosX2, PosY2, PosZ2,200)
	local min_distance = getDistanceBetweenPoints3D( Pcx2, Pcy2, Pcz2, PosX2, PosY2, PosZ2 )
	porcentajeProceso2 = getElementData(Maquina2,"proceso2")
	if(porcentajeProceso2 < 100)then
		if(getElementData(getLocalPlayer(),"tiempoProcesosFabri2") == 0)then
			setElementData(Maquina2,"proceso2",porcentajeProceso2+0.05)
		else
			setElementData(Maquina2,"proceso2",porcentajeProceso2+0.06)
		end
	end
	aproximadoPorcentaje2 = math.floor(porcentajeProceso2)
	if min_distance < 7 then
		if LocationX2 then
			rect2 = dxDrawRectangle(LocationX2+250-102.5,LocationY2-50-52.5,1025/4,25,tocolor(0,0,0,127.5))
			dxDrawRectangle(LocationX2+250-100,LocationY2-50-50,porcentajeProceso2* 2.5,20,tocolor(0,127.5,0,127.5))
			dxDrawText("Proceso: "..aproximadoPorcentaje2.."%", LocationX2+250-50-35, LocationY2-50-50, 0, 0, tocolor(255,255,255,127.5), 1, "default-bold")
		end
	end
end
end

function quitarMaterialesFabri(m1,m2,m3,m4)
	local DataMater = getElementData(localPlayer,"materialD")
	local DataGalon = getElementData(localPlayer,"galonGaso")
	local DataQuimA = getElementData(localPlayer,"quimicoA")
	local DataQuimB = getElementData(localPlayer,"quimicoB")
	setElementData(localPlayer,"materialD",DataMater-m1)
	setElementData(localPlayer,"galonGaso",DataGalon-m2)
	setElementData(localPlayer,"quimicoA",DataQuimA-m3)
	setElementData(localPlayer,"quimicoB",DataQuimB-m4)
end

function getTiempoProceso()
local tiempoProceso = nil 
	if(getElementData(getLocalPlayer(),"tiempoProcesosFabri") == 0)then
		tiempoProceso = 56000
		return tiempoProceso
	else
		tiempoProceso = 47000
		return tiempoProceso
	end
end

function crarDrogaFab(id)
	local tiempoMoveMedio = getTiempoProceso()
	dimJugaElem = getElementData(localPlayer,"DimensionTrafico")
	objetoDroga = createObject(id,-68.10546875, -259.7373046875, -99.392646789551)
	setElementDimension(objetoDroga,dimJugaElem)
	moveObject(objetoDroga,tiempoMoveMedio,-68.16796875, -250.7412109375, -99.392646789551)
end

function crarDroga2Fab(id)
	local tiempoMoveMedio = getTiempoProceso()
	dimJugaElem = getElementData(localPlayer,"DimensionTrafico")
	objetoDroga2 = createObject(id,-68.4541015625, -225.728515625, -99.392646789551)
	setElementDimension(objetoDroga2,dimJugaElem)
	moveObject(objetoDroga2,tiempoMoveMedio,-68.529296875, -216.787109375, -99.392646789551)
end

function comprobarObjetoFab(objeto)
	if(isElement(objeto) == true)then
		destroyElement(objeto)
	end
end

function comprobarMaterialesFabCol(cantMat1,cantMat2,cantMat3,cantMat4)
	if(getElementData(localPlayer,"materialD") >= cantMat1 and getElementData(localPlayer,"galonGaso") >= cantMat2 and getElementData(localPlayer,"quimicoA") >= cantMat3 and getElementData(localPlayer,"quimicoB")>= cantMat4)then
		return 0, 255, 0
	else
		return 255, 0, 0
	end
end

function comprobarMaterialesFabCre(cantMat1,cantMat2,cantMat3,cantMat4)
	if(getElementData(localPlayer,"materialD") >= cantMat1 and getElementData(localPlayer,"galonGaso") >= cantMat2 and getElementData(localPlayer,"quimicoA") >= cantMat3 and getElementData(localPlayer,"quimicoB")>= cantMat4)then
		return true
	else
		return false
	end
end

function markerConDimensionMak(Pmx, Pmy, Pmz)
local dimJugObj = getElementData(localPlayer,"DimensionTrafico")
local devolMarkM = createMarker (Pmx, Pmy, Pmz, "cylinder",1.2, 227, 13, 13, 0 )
setElementDimension(devolMarkM,dimJugObj)
return devolMarkM
end

function verData()
d = getElementData(localPlayer,"materialD")
a = getElementData(localPlayer,"galonGaso")
b = getElementData(localPlayer,"quimicoA")
c = getElementData(localPlayer,"quimicoB")
outputChatBox(d)
outputChatBox(b)
outputChatBox(c)
outputChatBox(a)
end
addCommandHandler("k", verData)

function cambiar()
setElementData(localPlayer,"materialD",50)
setElementData(localPlayer,"galonGaso",50)
setElementData(localPlayer,"quimicoA",50)
setElementData(localPlayer,"quimicoB",50)
end
addCommandHandler("l", cambiar)