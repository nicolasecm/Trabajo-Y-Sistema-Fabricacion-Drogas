local sx,sy = guiGetScreenSize()
local px,py = 1440,900
local x,y =  (sx/px), (sy/py)
local bindHelp = nil 

function CargarDatosBindPanHelp (BindReciMeta)
bindHelp = BindReciMeta
end
addEvent( "CargarDatosBindPanHelp", true)
addEventHandler( "CargarDatosBindPanHelp", getRootElement(), CargarDatosBindPanHelp)

function iniciarPanelLoginAyuda()
setTimer ( function()
		panelAyuda()
		destruirPanelEntraHelp()
	end , 1000 , 1 )
end
addEvent( "iniciarPanelLoginAyuda", true)
addEventHandler( "iniciarPanelLoginAyuda", getRootElement(), iniciarPanelLoginAyuda)

function panelAyuda()
	window26 = guiCreateWindow(511, 190, 439, 494, "Ayuda Trabajo Fabricante Drogas", false)
    guiWindowSetSizable(window26, false)
	triggerEvent("SolicitarDatosXml",getLocalPlayer(),"BindVerAyuda")

    TabPanel1 = guiCreateTabPanel(9, 25, 420, 459, false, window26)
	MaterialesTab = guiCreateTab("Materiales", TabPanel1)

    labelSemiHelp = guiCreateLabel(10, 10, 126, 23, "Semillas: 40", false, MaterialesTab)
    labelMapriHelp = guiCreateLabel(10, 33, 126, 23, "Materia Prima: 40", false, MaterialesTab)
    labelQuimAHelp = guiCreateLabel(10, 56, 126, 23, "Quimico A: 3400", false, MaterialesTab)
    labelQuimBHelp = guiCreateLabel(10, 79, 126, 23, "Quimico B: 3400", false, MaterialesTab)
    labelGasoHelp = guiCreateLabel(10, 102, 126, 23, "Gasolina: 3400", false, MaterialesTab)

    MapaTab = guiCreateTab("Mapa Ayuda", TabPanel1)
    ImagenMapa = guiCreateStaticImage(0, 0, 420, 435, "Imagenes/Mapa.png", false, MapaTab)    
	
	setTimer(
		function() 
			guiSetText ( labelSemiHelp, "Semillas: ".. getElementData(localPlayer,"semillas") or 0 .."" )  
			guiSetText ( labelMapriHelp, "Materia Prima: ".. getElementData(localPlayer,"materialD") or 0 .."" )  
			guiSetText ( labelQuimAHelp, "Quimico A: ".. getElementData(localPlayer,"quimicoA") or 0 .."" )  
			guiSetText ( labelQuimBHelp, "Quimico B: ".. getElementData(localPlayer,"quimicoB") or 0 .."" )
			guiSetText ( labelGasoHelp, "Gasolina: ".. getElementData(localPlayer,"galonGaso") or 0 .."" )			
		end,500,0)
	showCursor(true)
	repeat until bindKey(bindHelp,"down",function()
		togglePanelAyuda(not guiGetVisible(window26))
	end )
end

function togglePanelAyuda(Viss)
		if Viss == false then
			guiSetVisible(window26,false)
			showCursor(false)
			guiSetInputMode("allow_binds")
		else
			if getAccountName(localPlayer) ~= false then
				guiSetVisible(window26,true)
				showCursor(true)
				guiSetInputMode("no_binds_when_editing")
			else
				outputChatBox("Usted debe estar logueado para abrir el panel!")
			end
		end
end

function destruirPanelEntraHelp()
	showCursor(false)
	guiSetVisible(window26,false)
end