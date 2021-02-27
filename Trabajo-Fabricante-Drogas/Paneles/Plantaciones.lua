local ColorTexto = tocolor(255, 255, 255, 255)
local ColorTextoNe = tocolor(0, 0, 0, 255)
local Ma1 = nil
local Mat1 = nil
local markMa1 = nil
local Ma2 = nil
local Mat2 = nil
local markMa2 = nil
local Ma3 = nil
local Mat3 = nil
local markMa3 = nil
local Ma4 = nil
local Mat4 = nil
local canta = nil
local cantb = nil
local ProA = nil
local ProB = nil
local markMa4 = nil
local object1 = nil
local object2 = nil
local object3 = nil
local object4 = nil
local object5 = nil
local object6 = nil
local object7 = nil
local object8 = nil
local object9 = nil
local object10 = nil
local object11 = nil
local object12 = nil
local object13 = nil
local object14 = nil
local object15 = nil
local object16 = nil
local object17 = nil
local object18 = nil
local object19 = nil
local object20 = nil
local object21 = nil
local object22 = nil
local pedUno = nil
local pedDos = nil
local pedTres = nil
local pedCuatro = nil
local posObj1 = nil
local posObj2 = nil
local posObj3 = nil
local posObj4 = nil
local sx,sy = guiGetScreenSize()
local px,py = 1440,900
local x,y =  (sx/px), (sy/py)
local panelPlantAbi = false

markertInteriorUno = createMarker ( -60.32421875, 83.4541015625, 4.1171875, "arrow",1.8, 227, 13, 13, 255 )
markertInteriorUnoSalida = createMarker ( -64.6328125, 88.868751525879, -65.831253051758, "cylinder",1.5, 227, 13, 13, 255 )

function PanelPlantaciones1()
	window2 = guiCreateWindow(x*575, y*294, x*370, y*187, "Planta 1", false)
	guiWindowSetSizable(window2, false)
	local compPlanta = nil
	local BotPla = nil
	local BotRec = nil
	local cantSemillasPanP = nil
	panelPlantAbi = true
	cantSemillasPanP = getElementData(localPlayer,"semillas")
	compPlanta,BotPla,BotRec = comprobarPlantacion(Ma1)
	botonPlantarP = guiCreateButton(x*14, y*119, x*95, y*47, "Plantar", false, window2)
    botonSalirP = guiCreateButton(x*255, y*118, x*95, y*48, "Salir", false, window2)
    botonRecogerP = guiCreateButton(x*138, y*118, x*94, y*48, "Recoger", false, window2)
    textoSemillas = guiCreateLabel(x*14, y*51, x*109, y*25, "Semillas: " .. cantSemillasPanP, false, window2)
    guiSetFont(textoSemillas, "default-bold-small")
    textoDisponible = guiCreateLabel(x*14, y*28, x*154, y*23, "Disponible para plantar: " .. compPlanta , false, window2)
    guiSetFont(textoDisponible, "default-bold-small")
	guiSetProperty(botonPlantarP, "Disabled", BotPla)
	guiSetProperty(botonRecogerP, "Disabled", BotRec)

	showCursor(true)
	addEventHandler("onClientGUIClick", botonSalirP, salir2, false)
	addEventHandler("onClientGUIClick", botonRecogerP, funRecogP1, false)
	addEventHandler("onClientGUIClick", botonRecogerP, salir2, false)
	addEventHandler("onClientGUIClick", botonPlantarP, funPlantarP1, false)
	addEventHandler("onClientGUIClick", botonPlantarP, salir2, false)
end

function salir2()
	showCursor(false)
	destroyElement(window2)
	panelPlantAbi = false
end

function funRecogP1()
	if(getElementData(Ma1,"germinacion") >= 99)then
		local mater = getElementData(localPlayer,"materialD")
		ProA,ProB = ComprobarMejorasProduccion()
		rand = math.random ( ProA,ProB)
		setElementData(localPlayer,"materialD",mater+ rand)
		outputChatBox("[Plantacion]#ffffffObtuviste ".. rand .. " materiales", 227, 13, 13,true)
		setElementData(Ma1,"plantacion", false)
		setElementData(Ma1,"germinacion", 0)
		destroyElement(Mat1)
		removeEventHandler("onClientRender",root,BarraProcesoPlan1)
		setPedAnimation(getLocalPlayer(), "freeweights", "gym_free_putdown")
		setTimer (function ( )
			setPedAnimation(getLocalPlayer())
		end,2300, 1)
	else
		outputChatBox("[Plantacion]#ffffffEspera que termine de germinar", 227, 13, 13,true)
	end
end

function funPlantarP1()
	local cantSemillasFun = nil
	local tiempoMoverGermin = getTiempoGerminacion()
	cantSemillasFun = getElementData(localPlayer,"semillas")
	if(cantSemillasFun > 0)then
		setElementData(Ma1,"plantacion", true)
		setElementData(localPlayer, "semillas", cantSemillasFun - 1)
		outputChatBox("[Plantacion]#ffffffEspera a que germine", 227, 13, 13,true)
		addEventHandler("onClientRender",root,BarraProcesoPlan1)
		posObj1 = setTimer (function ( )
			setElementPosition(Mat1,-85.341796875, 84.318946838379, -65.531253051758)
		end,tiempoMoverGermin, 1)
		setPedAnimation(getLocalPlayer(), "freeweights", "gym_free_putdown")
		setTimer (function ( )
			setPedAnimation(getLocalPlayer())
		end,2300, 1)
	else
		outputChatBox("[Plantacion]#ffffffNo tienes semillas ve y compra afuera", 227, 13, 13,true)	
	end
end

function PanelPlantaciones2()
	window5 = guiCreateWindow(x*575, y*294, x*370, y*187, "Planta 2", false)
	guiWindowSetSizable(window5, false)
	local compPlanta = nil
	local BotPla = nil
	local BotRec = nil
	local cantSemillasPanP = nil
	panelPlantAbi = true
	cantSemillasPanP = getElementData(localPlayer,"semillas")
	compPlanta,BotPla,BotRec = comprobarPlantacion(Ma2)
	botonPlantarP2 = guiCreateButton(x*14, y*119, x*95, y*47, "Plantar", false, window5)
    botonSalirP2 = guiCreateButton(x*255, y*118, x*95, y*48, "Salir", false, window5)
    botonRecogerP2 = guiCreateButton(x*138, y*118, x*94, y*48, "Recoger", false, window5)
    textoSemillas2 = guiCreateLabel(x*14, y*51, x*109, y*25, "Semillas: " .. cantSemillasPanP, false, window5)
    guiSetFont(textoSemillas2, "default-bold-small")
    textoDisponible2 = guiCreateLabel(x*14, y*28, x*154, y*23, "Disponible para plantar: " .. compPlanta , false, window5)
    guiSetFont(textoDisponible2, "default-bold-small")
	guiSetProperty(botonPlantarP2, "Disabled", BotPla)
	guiSetProperty(botonRecogerP2, "Disabled", BotRec	)
	
	showCursor(true)
	addEventHandler("onClientGUIClick", botonSalirP2, salir5, false)
	addEventHandler("onClientGUIClick", botonRecogerP2, funRecogP2, false)
	addEventHandler("onClientGUIClick", botonRecogerP2, salir5, false)
	addEventHandler("onClientGUIClick", botonPlantarP2, funPlantarP2, false)
	addEventHandler("onClientGUIClick", botonPlantarP2, salir5, false)
end

function salir5()
	showCursor(false)
	destroyElement(window5)
	panelPlantAbi = false
end

function funRecogP2()
	if(getElementData(Ma2,"germinacion") >= 100)then
		destroyElement(Mat2)
		local mater = getElementData(localPlayer,"materialD")
		ProA,ProB = ComprobarMejorasProduccion()
		rand = math.random ( ProA,ProB)
		setElementData(localPlayer,"materialD",mater+ rand)
		outputChatBox("[Plantacion]#ffffffObtuviste ".. rand .. " materiales", 227, 13, 13,true)
		setElementData(Ma2,"plantacion", false)
		setElementData(Ma2,"germinacion", 0)
		removeEventHandler("onClientRender",root,BarraProcesoPlan2)
		setPedAnimation(getLocalPlayer(), "freeweights", "gym_free_putdown")
		setTimer (function ( )
			setPedAnimation(getLocalPlayer())
		end,2300, 1)
	else
		outputChatBox("[Plantacion]#ffffffEspera que termine de germinar", 227, 13, 13,true)
	end
end

function funPlantarP2()
	local cantSemillasFun = nil
	local tiempoMoveGermin = getTiempoGerminacion()
	cantSemillasFun = getElementData(localPlayer,"semillas")
	if(cantSemillasFun > 0)then
		setElementData(Ma2,"plantacion", true)
		setElementData(localPlayer, "semillas", cantSemillasFun - 1)
		outputChatBox("[Plantacion]#ffffffEspera a que germine", 227, 13, 13,true)
		addEventHandler("onClientRender",root,BarraProcesoPlan2)
		posObj2 = setTimer (function ( )
			setElementPosition(Mat2,-85.1376953125, 87.173439025879, -65.531253051758)
		end,tiempoMoveGermin, 1)
		setPedAnimation(getLocalPlayer(), "freeweights", "gym_free_putdown")
		setTimer (function ( )
			setPedAnimation(getLocalPlayer())
		end,2300, 1)
	else
		outputChatBox("[Plantacion]#ffffffNo tienes semillas ve y compra afuera", 227, 13, 13,true)	
	end
end

function PanelPlantaciones3()
	window14 = guiCreateWindow(x*575, y*294, x*370, y*187, "Planta 3", false)
	guiWindowSetSizable(window14, false)
	local compPlanta = nil
	local BotPla = nil
	local BotRec = nil
	local cantSemillasPanP = nil
	panelPlantAbi = true
	cantSemillasPanP = getElementData(localPlayer,"semillas")
	compPlanta,BotPla,BotRec = comprobarPlantacion(Ma3)
	botonPlantarP3 = guiCreateButton(x*14, y*119, x*95, y*47, "Plantar", false, window14)
    botonSalirP3 = guiCreateButton(x*255, y*118, x*95, y*48, "Salir", false, window14)
    botonRecogerP3 = guiCreateButton(x*138, y*118, x*94, y*48, "Recoger", false, window14)
    textoSemillas3 = guiCreateLabel(x*14, y*51, x*109, y*25, "Semillas: " .. cantSemillasPanP, false, window14)
    guiSetFont(textoSemillas3, "default-bold-small")
    textoDisponible3 = guiCreateLabel(x*14, y*28, x*154, y*23, "Disponible para plantar: " .. compPlanta , false, window14)
    guiSetFont(textoDisponible3, "default-bold-small")
	guiSetProperty(botonPlantarP3, "Disabled", BotPla)
	guiSetProperty(botonRecogerP3, "Disabled", BotRec)

	showCursor(true)
	addEventHandler("onClientGUIClick", botonSalirP3, salir14, false)
	addEventHandler("onClientGUIClick", botonRecogerP3, funRecogP3, false)
	addEventHandler("onClientGUIClick", botonRecogerP3, salir14, false)
	addEventHandler("onClientGUIClick", botonPlantarP3, funPlantarP3, false)
	addEventHandler("onClientGUIClick", botonPlantarP3, salir14, false)
end

function salir14()
	showCursor(false)
	destroyElement(window14)
	panelPlantAbi = false
end

function funRecogP3()
	if(getElementData(Ma3,"germinacion") >= 99)then
		local mater = getElementData(localPlayer,"materialD")
		ProA,ProB = ComprobarMejorasProduccion()
		rand = math.random ( ProA,ProB)
		setElementData(localPlayer,"materialD",mater+ rand)
		outputChatBox("[Plantacion]#ffffffObtuviste ".. rand .. " materiales", 227, 13, 13,true)
		setElementData(Ma3,"plantacion", false)
		setElementData(Ma3,"germinacion", 0)
		destroyElement(Mat3)
		removeEventHandler("onClientRender",root,BarraProcesoPlan3)
		setPedAnimation(getLocalPlayer(), "freeweights", "gym_free_putdown")
		setTimer (function ( )
			setPedAnimation(getLocalPlayer())
		end,2300, 1)
	else
		outputChatBox("[Plantacion]#ffffffEspera que termine de germinar", 227, 13, 13,true)
	end
end

function funPlantarP3()
	local cantSemillasFun = nil
	local tiempoMoverGermin = getTiempoGerminacion()
	cantSemillasFun = getElementData(localPlayer,"semillas")
	if(cantSemillasFun > 0)then
		setElementData(Ma3,"plantacion", true)
		setElementData(localPlayer, "semillas", cantSemillasFun - 1)
		outputChatBox("[Plantacion]#ffffffEspera a que germine", 227, 13, 13,true)
		addEventHandler("onClientRender",root,BarraProcesoPlan3)
		posObj3 = setTimer (function ( )
			setElementPosition(Mat3,-85.1435546875, 90.012306213379, -65.531253051758)
		end,tiempoMoverGermin, 1)
		setPedAnimation(getLocalPlayer(), "freeweights", "gym_free_putdown")
		setTimer (function ( )
			setPedAnimation(getLocalPlayer())
		end,2300, 1)
	else
		outputChatBox("[Plantacion]#ffffffNo tienes semillas ve y compra afuera", 227, 13, 13,true)	
	end
end

function PanelPlantaciones4()
	window15 = guiCreateWindow(x*575, y*294, x*370, y*187, "Planta 4", false)
	guiWindowSetSizable(window15, false)
	local compPlanta = nil
	local BotPla = nil
	local BotRec = nil
	local cantSemillasPanP = nil
	panelPlantAbi = true
	cantSemillasPanP = getElementData(localPlayer,"semillas")
	compPlanta,BotPla,BotRec = comprobarPlantacion(Ma4)
	botonPlantarP4 = guiCreateButton(x*14, y*119, x*95, y*47, "Plantar", false, window15)
    botonSalirP4 = guiCreateButton(x*255, y*118, x*95, y*48, "Salir", false, window15)
    botonRecogerP4 = guiCreateButton(x*138, y*118, x*94, y*48, "Recoger", false, window15)
    textoSemillas4 = guiCreateLabel(x*14, y*51, x*109, y*25, "Semillas: " .. cantSemillasPanP, false, window15)
    guiSetFont(textoSemillas4, "default-bold-small")
    textoDisponible4 = guiCreateLabel(x*14, y*28, x*154, y*23, "Disponible para plantar: " .. compPlanta , false, window15)
    guiSetFont(textoDisponible4, "default-bold-small")
	guiSetProperty(botonPlantarP4, "Disabled", BotPla)
	guiSetProperty(botonRecogerP4, "Disabled", BotRec)

	showCursor(true)
	addEventHandler("onClientGUIClick", botonSalirP4, salir15, false)
	addEventHandler("onClientGUIClick", botonRecogerP4, funRecogP4, false)
	addEventHandler("onClientGUIClick", botonRecogerP4, salir15, false)
	addEventHandler("onClientGUIClick", botonPlantarP4, funPlantarP4, false)
	addEventHandler("onClientGUIClick", botonPlantarP4, salir15, false)
end

function salir15()
	showCursor(false)
	destroyElement(window15)
	panelPlantAbi = false
end

function funRecogP4()
	if(getElementData(Ma4,"germinacion") >= 99)then
		local mater = getElementData(localPlayer,"materialD")
		ProA,ProB = ComprobarMejorasProduccion()
		rand = math.random ( ProA,ProB)
		setElementData(localPlayer,"materialD",mater+ rand)
		outputChatBox("[Plantacion]#ffffffObtuviste ".. rand .. " materiales", 227, 13, 13,true)
		setElementData(Ma4,"plantacion", false)
		setElementData(Ma4,"germinacion", 0)
		destroyElement(Mat4)
		removeEventHandler("onClientRender",root,BarraProcesoPlan4)
		setPedAnimation(getLocalPlayer(), "freeweights", "gym_free_putdown")
		setTimer (function ( )
			setPedAnimation(getLocalPlayer())
		end,2300, 1)
	else
		outputChatBox("[Plantacion]#ffffffEspera que termine de germinar", 227, 13, 13,true)
	end
end

function funPlantarP4()
	local cantSemillasFun = nil
	local tiempoMoverGermin = getTiempoGerminacion()
	cantSemillasFun = getElementData(localPlayer,"semillas")
	if(cantSemillasFun > 0)then
		setElementData(Ma4,"plantacion", true)
		setElementData(localPlayer, "semillas", cantSemillasFun - 1)
		outputChatBox("[Plantacion]#ffffffEspera a que germine", 227, 13, 13,true)
		addEventHandler("onClientRender",root,BarraProcesoPlan4)
		posObj4 = setTimer (function ( )
			setElementPosition(Mat4,-85.0771484375, 93.415626525879, -65.531253051758)
		end,tiempoMoverGermin, 1)
		setPedAnimation(getLocalPlayer(), "freeweights", "gym_free_putdown")
		setTimer (function ( )
			setPedAnimation(getLocalPlayer())
		end,2300, 1)
	else
		outputChatBox("[Plantacion]#ffffffNo tienes semillas ve y compra afuera", 227, 13, 13,true)	
	end
end

function BarraProcesoPlan1()
if(getElementData(Ma1,"plantacion") == true ) then
	local PosX, PosY, PosZ = getElementPosition(markMa1)
	local Pcx, Pcy, Pcz = getCameraMatrix( )
	LocationX, LocationY = getScreenFromWorldPosition(PosX, PosY, PosZ,200)
	local min_distance = getDistanceBetweenPoints3D( Pcx, Pcy, Pcz, PosX, PosY, PosZ )
	porcentajeProcesoPlan = getElementData(Ma1,"germinacion")
	if(porcentajeProcesoPlan < 100)then
		if(getElementData(getLocalPlayer(),"tiempoGermiPlant") == 0)then
			setElementData(Ma1,"germinacion",porcentajeProcesoPlan+0.06)
		else
			setElementData(Ma1,"germinacion",porcentajeProcesoPlan+0.07)
		end
	end
	aproximadoPorcentaje = math.floor(porcentajeProcesoPlan)
	if min_distance < 7 then
		if LocationX then
			rect2 = dxDrawRectangle(LocationX+250-102.5,LocationY-50-52.5,1025/4,25,tocolor(0,0,0,127.5))
			dxDrawRectangle(LocationX+250-100,LocationY-50-50,porcentajeProcesoPlan* 2.5,20,tocolor(0,127.5,0,127.5))
			dxDrawText("Germinacion Planta 1: "..aproximadoPorcentaje.."%", LocationX+250-50-35, LocationY-50-50, 0, 0, tocolor(255,255,255,127.5), 1, "default-bold")
		end
	end
end
end

function BarraProcesoPlan2()
if(getElementData(Ma2,"plantacion") == true ) then
	local PosX, PosY, PosZ = getElementPosition(markMa2)
	local Pcx, Pcy, Pcz = getCameraMatrix( )
	LocationX, LocationY = getScreenFromWorldPosition(PosX, PosY, PosZ,200)
	local min_distance = getDistanceBetweenPoints3D( Pcx, Pcy, Pcz, PosX, PosY, PosZ )
	porcentajeProcesoPlan2 = getElementData(Ma2,"germinacion")
	if(porcentajeProcesoPlan2 < 100)then
		if(getElementData(getLocalPlayer(),"tiempoGermiPlant") == 0)then
			setElementData(Ma2,"germinacion",porcentajeProcesoPlan2+0.06)
		else
			setElementData(Ma2,"germinacion",porcentajeProcesoPlan2+0.07)
		end
	else
	end
	aproximadoPorcentaje2 = math.floor(porcentajeProcesoPlan2)
	if min_distance < 7 then
		if LocationX then
			rect2 = dxDrawRectangle(LocationX+250-102.5,LocationY-50-52.5,1025/4,25,tocolor(0,0,0,127.5))
			dxDrawRectangle(LocationX+250-100,LocationY-50-50,porcentajeProcesoPlan2* 2.5,20,tocolor(0,127.5,0,127.5))
			dxDrawText("Germinacion Planta 2: "..aproximadoPorcentaje2.."%", LocationX+250-50-35, LocationY-50-50, 0, 0, tocolor(255,255,255,127.5), 1, "default-bold")
		end
	end
end
end

function BarraProcesoPlan3()
if(getElementData(Ma3,"plantacion") == true ) then
	local PosX, PosY, PosZ = getElementPosition(markMa3)
	local Pcx, Pcy, Pcz = getCameraMatrix( )
	LocationX, LocationY = getScreenFromWorldPosition(PosX, PosY, PosZ,200)
	local min_distance = getDistanceBetweenPoints3D( Pcx, Pcy, Pcz, PosX, PosY, PosZ )
	porcentajeProcesoPlan3 = getElementData(Ma3,"germinacion")
	if(porcentajeProcesoPlan3 < 100)then
		if(getElementData(getLocalPlayer(),"tiempoGermiPlant") == 0)then
			setElementData(Ma3,"germinacion",porcentajeProcesoPlan3+0.06)
		else
			setElementData(Ma3,"germinacion",porcentajeProcesoPlan3+0.07)
		end
	else
	end
	aproximadoPorcentaje3 = math.floor(porcentajeProcesoPlan3)
	if min_distance < 7 then
		if LocationX then
			rect2 = dxDrawRectangle(LocationX+250-102.5,LocationY-50-52.5,1025/4,25,tocolor(0,0,0,127.5))
			dxDrawRectangle(LocationX+250-100,LocationY-50-50,porcentajeProcesoPlan3* 2.5,20,tocolor(0,127.5,0,127.5))
			dxDrawText("Germinacion Planta 3: "..aproximadoPorcentaje3.."%", LocationX+250-50-35, LocationY-50-50, 0, 0, tocolor(255,255,255,127.5), 1, "default-bold")
		end
	end
end
end

function BarraProcesoPlan4()
if(getElementData(Ma4,"plantacion") == true ) then
	local PosX, PosY, PosZ = getElementPosition(markMa4)
	local Pcx, Pcy, Pcz = getCameraMatrix( )
	LocationX, LocationY = getScreenFromWorldPosition(PosX, PosY, PosZ,200)
	local min_distance = getDistanceBetweenPoints3D( Pcx, Pcy, Pcz, PosX, PosY, PosZ )
	porcentajeProcesoPlan4 = getElementData(Ma4,"germinacion")
	if(porcentajeProcesoPlan4 < 100)then
		if(getElementData(getLocalPlayer(),"tiempoGermiPlant") == 0)then
			setElementData(Ma4,"germinacion",porcentajeProcesoPlan4+0.06)
		else
			setElementData(Ma4,"germinacion",porcentajeProcesoPlan4+0.07)
		end
	else
	end
	aproximadoPorcentaje4 = math.floor(porcentajeProcesoPlan4)
	if min_distance < 7 then
		if LocationX then
			rect2 = dxDrawRectangle(LocationX+250-102.5,LocationY-50-52.5,1025/4,25,tocolor(0,0,0,127.5))
			dxDrawRectangle(LocationX+250-100,LocationY-50-50,porcentajeProcesoPlan4* 2.5,20,tocolor(0,127.5,0,127.5))
			dxDrawText("Germinacion Planta 4: "..aproximadoPorcentaje4.."%", LocationX+250-50-35, LocationY-50-50, 0, 0, tocolor(255,255,255,127.5), 1, "default-bold")
		end
	end
end
end

function EliminarObjetoFin( hitPlayer )
if (getElementDimension(hitPlayer) == 0 ) then
else
	if ( getElementType ( hitPlayer ) == "player" ) and ( hitPlayer == localPlayer ) then
		comprobarTempPlant(posObj1)
		comprobarTempPlant(posObj2)
		comprobarTempPlant(posObj3)
		comprobarTempPlant(posObj4)
		comprobarElementoPlant(markMa1)
		comprobarElementoPlant(Mat1)
		comprobarElementoPlant(markMa2)
		comprobarElementoPlant(Mat2)
		comprobarElementoPlant(object1)
		comprobarElementoPlant(object2)
		comprobarElementoPlant(object3)
		comprobarElementoPlant(object4)
		comprobarElementoPlant(object5)
		comprobarElementoPlant(object6)
		comprobarElementoPlant(object7)
		comprobarElementoPlant(object8)
		comprobarElementoPlant(object9)
		comprobarElementoPlant(object10)
		comprobarElementoPlant(object11)
		comprobarElementoPlant(object12)
		comprobarElementoPlant(object13)
		comprobarElementoPlant(object14)
		comprobarElementoPlant(object15)
		comprobarElementoPlant(object16)
		comprobarElementoPlant(object17)
		comprobarElementoPlant(object18)
		comprobarElementoPlant(object19)
		comprobarElementoPlant(object20)
		comprobarElementoPlant(object21)
		comprobarElementoPlant(object22)
		comprobarElementoPlant(pedUno)
		comprobarElementoPlant(pedDos)
		comprobarElementoPlant(pedTres)
		comprobarElementoPlant(pedCuatro)
		ComprobarMataCompleta(Ma1,BarraProcesoPlan1)
		ComprobarMataCompleta(Ma2,BarraProcesoPlan2)
		ComprobarMataCompleta(Ma3,BarraProcesoPlan3)
		ComprobarMataCompleta(Ma4,BarraProcesoPlan4)
		comprobarElementoPlant(markMa3)
		comprobarElementoPlant(Mat3)
		setElementPosition(localPlayer,-56.1748046875, 82.400390625, 3.1171875)
		setElementDimension(localPlayer,0)
		toggleControl ( "next_weapon", true ) 
		toggleControl ( "previous_weapon", true ) 
	end
end
end
addEventHandler('onClientMarkerHit', markertInteriorUnoSalida,EliminarObjetoFin)

function EliminarObjetoKill()
	comprobarTempPlant(posObj1)
	comprobarTempPlant(posObj2)
	comprobarTempPlant(posObj3)
	comprobarTempPlant(posObj4)
	comprobarElementoPlant(markMa1)
	comprobarElementoPlant(Mat1)
	comprobarElementoPlant(markMa2)
	comprobarElementoPlant(Mat2)
	ComprobarMataCompleta(Ma1,BarraProcesoPlan1)
	ComprobarMataCompleta(Ma2,BarraProcesoPlan2)
	comprobarElementoPlant(object1)
	comprobarElementoPlant(object2)
	comprobarElementoPlant(object3)
	comprobarElementoPlant(object4)
	comprobarElementoPlant(object5)
	comprobarElementoPlant(object6)
	comprobarElementoPlant(object7)
	comprobarElementoPlant(object8)
	comprobarElementoPlant(object9)
	comprobarElementoPlant(object10)
	comprobarElementoPlant(object11)
	comprobarElementoPlant(object12)
	comprobarElementoPlant(object13)
	comprobarElementoPlant(object14)
	comprobarElementoPlant(object15)
	comprobarElementoPlant(object16)
	comprobarElementoPlant(object17)
	comprobarElementoPlant(object18)
	comprobarElementoPlant(object19)
	comprobarElementoPlant(object20)
	comprobarElementoPlant(object21)
	comprobarElementoPlant(object22)
	comprobarElementoPlant(pedUno)
	comprobarElementoPlant(pedDos)
	comprobarElementoPlant(pedTres)
	comprobarElementoPlant(pedCuatro)
	ComprobarMataCompleta(Ma3,BarraProcesoPlan3)
	ComprobarMataCompleta(Ma4,BarraProcesoPlan4)
	comprobarElementoPlant(markMa3)
	comprobarElementoPlant(Mat3)
	setElementDimension(localPlayer,0)
	toggleControl ( "next_weapon", true ) 
	toggleControl ( "previous_weapon", true ) 
end
addEventHandler("onClientPlayerWasted", getLocalPlayer(), EliminarObjetoKill)

addEventHandler('onClientMarkerHit', markertInteriorUno,
function ( hitPlayer )
    if ( getElementType ( hitPlayer ) == "player" ) and ( hitPlayer == localPlayer ) then
		if(getElementData(localPlayer, "Ocupacion" ) == "Fabricante de drogas") then
		if(isPedInVehicle (getLocalPlayer()))then
				outputChatBox("[Plantacion]#ffffffNo puedes entrar si estas en un vehiculo", 227, 13, 13,true)
			else
			outputChatBox("[Plantacion]#ff0000Si sales de las plantaciones perderas el progreso de las plantas que tengas",255, 255, 255,true)
			dimJuga = getElementData(localPlayer,"DimensionTrafico")
			setElementDimension(localPlayer,dimJuga)
			Ma1 = objetoConDimension(743,-85.341796875, 84.318946838379, -65.531253051758,0,0,0)
			setElementData(	Ma1,"plantacion",false)
			setElementData(	Ma1,"germinacion",0)
			Ma2 = objetoConDimension(743,-85.1376953125, 87.173439025879, -65.531253051758,0,0,0)
			setElementData(	Ma2,"plantacion",false)
			setElementData(	Ma2,"germinacion",0)
			setPedWeaponSlot ( localPlayer, 0 )
			toggleControl ( "next_weapon", false ) 
			toggleControl ( "previous_weapon", false ) 
			markMa1= markerConDimension (-85.341796875, 84.318946838379, -65.831253051758)
			markMa2= markerConDimension (-85.1376953125, 87.173439025879, -65.831253051758)
			Mat1 = objetoConDimension(861,-85.341796875, 84.318946838379, -67.531253051758,0,0,0)
			Mat2 = objetoConDimension(861,-85.1376953125, 87.173439025879, -67.531253051758,0,0,0)
			if(getElementData(localPlayer, "fabobjetouno") >= 1) then
			object1 = objetoConDimension(3528,-65.3,88.9,-59.8,0,0,180)
			end
			if(getElementData(localPlayer, "fabmejorauno") >= 1) then
				object2 = objetoConDimension(14438,-81,84.599998474121,-57.700000762939,0,0,270)
				object3 = objetoConDimension(14438,-69.800003051758,84.599998474121,-57.700000762939,0,0,270)
			end
			if(getElementData(localPlayer, "fabmejorados") >= 1) then	
				Ma3 = objetoConDimension(743,-85.1435546875, 90.012306213379, -65.531253051758,0,0,0)
				Mat3 = objetoConDimension(861,-85.1435546875, 90.012306213379, -67.531253051758,0,0,0)
				markMa3= markerConDimension (-85.1435546875, 90.012306213379, -65.831253051758)
				setElementData(	Ma3,"plantacion",false)
				setElementData(	Ma3,"germinacion",0)
				addEventHandler('onClientMarkerHit', markMa3,
				function ( hitPlayer, matc3 )
				if(matc3 == true)then
					if(panelPlantAbi == false)then
						PanelPlantaciones3()
					end
				end
				end)
			end
			if(getElementData(localPlayer, "fabmejoratres") >= 1) then	
				Ma4 = objetoConDimension(743,-85.0771484375, 93.415626525879, -65.531253051758,0,0,0)
				Mat4 = objetoConDimension(861,-85.0771484375, 93.415626525879, -67.531253051758,0,0,0)
				markMa4 = markerConDimension (-85.0771484375, 93.415626525879, -65.831253051758)
				setElementData(	Ma4,"plantacion",false)
				setElementData(	Ma4,"germinacion",0)
				addEventHandler('onClientMarkerHit', markMa4,
				function ( hitPlayer, matc4 )
				if(matc4 == true)then
					if(panelPlantAbi == false)then
						PanelPlantaciones4()
					end
				end
				end)
			end
			if(getElementData(localPlayer, "fabmejoracuat") >= 1) then	
				object4 = objetoConDimension(941,-71.8,82.1,-65.4,0,0,0)
				object5 = objetoConDimension(1575,-71.1,82.5,-64.9,0,0,0)
				object6 = objetoConDimension(1575,-72,82.5,-64.9,0,0,0)
				object7 = objetoConDimension(1650,-72.5,81.7,-64.6,0,0,0)
				object8 = objetoConDimension(2035,-71,81.8,-64.9,0,0,0)
				pedUno = pedConDimension( 144, -71.5380859375, 83.070899963379, -64.831253051758 ,180)
				setPedAnimation ( pedUno , "casino", "dealone", -1,true, false, false, false, 250, false)
				function cancelPedDamage ( attacker )
					cancelEvent()
				end
				addEventHandler ( "onClientPedDamage", pedUno, cancelPedDamage )
			end
			if(getElementData(localPlayer, "fabmejoracinc") >= 1) then	
				object9 = objetoConDimension(941,-74.8,82.1,-65.4,0,0,0)
				object10 = objetoConDimension(1575,-74.1,82.5,-64.9,0,0,0)
				object11 = objetoConDimension(2044,-74.3,81.9,-64.9,0,0,0)
				object12 = objetoConDimension(1650,-75.2,81.7,-64.6,0,0,0)
				object13 = objetoConDimension(2709,-73.6,82.1,-64.8,0,0,0)
				pedDos = pedConDimension( 144, -74.501953125, 83.070899963379, -64.831253051758,180)
				setPedAnimation ( pedDos , "casino", "dealone", -1,true, false, false, false, 250, false)
				function cancelPedDamage ( attacker )
					cancelEvent()
				end
				addEventHandler ( "onClientPedDamage", pedDos, cancelPedDamage )
			end
			if(getElementData(localPlayer, "fabmejoraseis") >= 1) then	
				object14 = objetoConDimension(941,-74.8,94.5,-65.4,0,0,0)
				object15 = objetoConDimension(1575,-75,94.2,-64.9,0,0,0)
				object16 = objetoConDimension(1575,-74,94.2,-64.9,0,0,0)
				object17 = objetoConDimension(1650,-73.7,94.8,-64.6,0,0,0)
				object18 = objetoConDimension(2045,-75.5,94.4,-64.9,0,0,0)
				pedTres = pedConDimension( 144, -74.50390625, 93.563087463379, -64.831253051758,0)
				setPedAnimation ( pedTres , "casino", "dealone", -1,true, false, false, false, 250, false)
				function cancelPedDamage ( attacker )
					cancelEvent()
				end
				addEventHandler ( "onClientPedDamage", pedTres, cancelPedDamage )
			end
			if(getElementData(localPlayer, "fabmejorasiet") >= 1) then	
				objeto19 = objetoConDimension(941,-71.8,94.5,-65.4,0,0,0)
				objeto20 = objetoConDimension(1575,-72.1,94.2,-64.9,0,0,0)
				objeto21 = objetoConDimension(1575,-71.2,94.2,-64.9,0,0,0)
				objeto22 = objetoConDimension(1650,-70.6,94.9,-64.6,0,0,0)
				pedCuatro = pedConDimension( 144, -71.6005859375, 93.561134338379, -64.831253051758,0)
				setPedAnimation ( pedCuatro , "casino", "dealone", -1,true, false, false, false, 250, false)
				function cancelPedDamage ( attacker )
					cancelEvent()
				end
				addEventHandler ( "onClientPedDamage", pedCuatro, cancelPedDamage )
			end
			addEventHandler('onClientMarkerHit', markMa1,
				function ( hitPlayer, matc )
				if(matc == true)then
					if(panelPlantAbi == false)then
						PanelPlantaciones1()
					end
				end
				end)
			addEventHandler('onClientMarkerHit', markMa2,
				function ( hitPlayer, matc2 )
				if(matc2 == true)then
					if(panelPlantAbi == false)then
						PanelPlantaciones2()
					end
				end
				end)
			setElementPosition ( localPlayer, -69.162109375, 89.084571838379, -64.831253051758)
			end
		else
			outputChatBox("[Plantacion]#ffffffNo puedes entrar si no eres Fabricante de drogas",227, 13, 13,true)		
		end
	end
end)

function objetoConDimension(idObj,Pox,Poy,Poz,Rox,Roy,Roz)
local dimJugObj = getElementData(localPlayer,"DimensionTrafico")
local devolObj = createObject(idObj,Pox,Poy,Poz,Rox,Roy,Roz)
setElementDimension(devolObj,dimJugObj)
return devolObj
end

function pedConDimension(idSkin,Psx,Psy,Psz,rotP)
local dimJugObj = getElementData(localPlayer,"DimensionTrafico")
local devolPed = createPed(idSkin,Psx,Psy,Psz,rotP)
setElementDimension(devolPed,dimJugObj)
return devolPed
end

function markerConDimension(Pmx, Pmy, Pmz)
local dimJugObj = getElementData(localPlayer,"DimensionTrafico")
local devolMark = createMarker (Pmx, Pmy, Pmz, "cylinder",1.2, 227, 13, 13, 255 )
setElementDimension(devolMark,dimJugObj)
return devolMark
end

function ComprobarMataCompleta(IdMataC,EventoComple)
if(isElement(IdMataC) == true) then
		if (getElementData(	IdMataC,"plantacion") == true)then
			removeEventHandler("onClientRender",root,EventoComple)
		end
		destroyElement(IdMataC)
	end
end

function comprobarElementoPlant(objPlant)
	if(isElement(objPlant) == true) then
		destroyElement(objPlant)
	end
end

function comprobarTempPlant(temCom)
	if (isTimer(temCom))then
		killTimer(temCom)
	end
end

function comprobarPlantacion(objMata)
	if(getElementData(objMata,"plantacion") == false) then
		return "Si", "False", "True"
	else
		return "No", "True" ,"False"
	end
end

function getTiempoGerminacion()
local tiempoGerminacion = nil 
	if(getElementData(getLocalPlayer(),"tiempoGermiPlant") == 0)then
		tiempoGerminacion = 47000
		return tiempoGerminacion
	else
		tiempoGerminacion = 40000
		return tiempoGerminacion
	end
end

function ComprobarMejorasProduccion()
local cantProduc = getElementData(getLocalPlayer(),"cantMejorPlan")
local canta = 0
local cantb = 0
if(cantProduc == 0)then
 canta = 1
 cantb = 2
end
if(cantProduc == 1)then
 canta = 2
 cantb = 3
end
if(cantProduc == 2)then
 canta = 3
 cantb = 4
end
if(cantProduc == 3)then
 canta = 4
 cantb = 5
end
if(cantProduc == 4)then
 canta = 5
 cantb = 6
end
return canta, cantb
end
