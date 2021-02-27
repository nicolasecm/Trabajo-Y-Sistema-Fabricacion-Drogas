local PrecioGasolina = nil
local PrecioSemillas = nil
local PrecioQuimicoA = nil
local PrecioQuimicoB = nil
local PrecioMejoraPlantacionDragon = nil
local PrecioMejoraPlantacionVelGer = nil
local PrecioMejoraPlantacionPlanta = nil
local PrecioMejoraPlantacionProduc = nil
local PrecioMejoraFabricaVelProducSala1 = nil
local PrecioMejoraFabricaProducSala1 = nil
local PrecioMejoraFabrica2Sala = nil
local PrecioMejoraFabrica2Maqui = nil
local BindPanelDroga = nil
local BindPanelAyuda = nil


function InicioResourceVG()
if source ~= getResourceRootElement() then return end
Archivo = xmlLoadFile ( "config.xml", true) 
if Archivo then
		local XmlGasolina = xmlFindChild(Archivo,"PrecioGasolina",0)
		local XmlSemillas = xmlFindChild(Archivo,"PrecioSemillas",0)
		local XmlQuimicoA = xmlFindChild(Archivo,"PrecioQuimicoA",0)
		local XmlQuimicoB = xmlFindChild(Archivo,"PrecioQuimicoB",0)
		local XmlMPDragon = xmlFindChild(Archivo,"PrecioMejoraPlantacionDragon",0)
		local XmlMPVelGer = xmlFindChild(Archivo,"PrecioMejoraPlantacionVelGer",0)
		local XmlMPTerPla = xmlFindChild(Archivo,"PrecioMejoraPlantacionPlanta",0)
		local XmlMPProduc = xmlFindChild(Archivo,"PrecioMejoraPlantacionProduc",0)
		local XmlMFVelPro = xmlFindChild(Archivo,"PrecioMejoraFabricaVelProducSala1",0)
		local XmlMFProduc = xmlFindChild(Archivo,"PrecioMejoraFabricaProducSala1",0)
		local XmlMFPuerta = xmlFindChild(Archivo,"PrecioMejoraFabrica2Sala",0)
		local XmlMF2Maqui = xmlFindChild(Archivo,"PrecioMejoraFabrica2Maqui",0)
		local XmlMFBinDro = xmlFindChild(Archivo,"BindPanelDroga",0)
		local XmlMFBinHel = xmlFindChild(Archivo,"BindPanelAyuda",0)
		PrecioGasolina = xmlNodeGetValue (XmlGasolina)
		PrecioSemillas = xmlNodeGetValue (XmlSemillas)
		PrecioQuimicoA = xmlNodeGetValue (XmlQuimicoA)
		PrecioQuimicoB = xmlNodeGetValue (XmlQuimicoB)
		PrecioMejoraPlantacionDragon = xmlNodeGetValue (XmlMPDragon)
		PrecioMejoraPlantacionVelGer = xmlNodeGetValue (XmlMPVelGer)
		PrecioMejoraPlantacionPlanta = xmlNodeGetValue (XmlMPTerPla)
		PrecioMejoraPlantacionProduc = xmlNodeGetValue (XmlMPProduc)
		PrecioMejoraFabricaVelProducSala1 = xmlNodeGetValue (XmlMFVelPro)
		PrecioMejoraFabricaProducSala1 = xmlNodeGetValue (XmlMFProduc)
		PrecioMejoraFabrica2Sala = xmlNodeGetValue (XmlMFPuerta)
		PrecioMejoraFabrica2Maqui = xmlNodeGetValue (XmlMF2Maqui)
		BindPanelDroga = xmlNodeGetValue (XmlMFBinDro)
		BindPanelAyuda = xmlNodeGetValue (XmlMFBinHel)
		xmlUnloadFile(Archivo)
else
	outputChatBox ( "Error al cargar los datos de config.xml" )
end
end
addEventHandler ( "onClientResourceStart", root, InicioResourceVG )

addEvent( "SolicitarDatosXml", true)
addEventHandler( "SolicitarDatosXml", getRootElement(), 
function (dato)
if(dato == "Semillas")then
	triggerEvent("CargarDatosSemi",getLocalPlayer(),PrecioSemillas)
end
if(dato == "Gasolina")then
	triggerEvent("CargarDatosGaso",getLocalPlayer(),PrecioGasolina)
end
if(dato == "QuimicoA")then
	triggerEvent("CargarDatosQuimicoA",getLocalPlayer(),PrecioQuimicoA)
end
if(dato == "QuimicoB")then
	triggerEvent("CargarDatosQuimicoB",getLocalPlayer(),PrecioQuimicoB)
end
if(dato == "BindVerDrogas")then
	triggerEvent("CargarDatosBindPanDrog",getLocalPlayer(),tostring(BindPanelDroga))
end
if(dato == "BindVerAyuda")then
	triggerEvent("CargarDatosBindPanHelp",getLocalPlayer(),tostring(BindPanelAyuda))
end
end)

addEvent( "SolicitarDatosXmlMejorasPlantacion", true)
addEventHandler( "SolicitarDatosXmlMejorasPlantacion", getRootElement(), 
function ()
		triggerEvent("CargarDatosMejoras",getLocalPlayer(),PrecioMejoraPlantacionDragon,PrecioMejoraPlantacionVelGer,PrecioMejoraPlantacionPlanta,PrecioMejoraPlantacionProduc)
end)

addEvent( "SolicitarDatosXmlMejorasFabrica", true)
addEventHandler( "SolicitarDatosXmlMejorasFabrica", getRootElement(), 
function ()
		triggerEvent("CargarDatosMejorasFab",getLocalPlayer(),PrecioMejoraFabricaVelProducSala1,PrecioMejoraFabrica2Sala,PrecioMejoraFabricaProducSala1,PrecioMejoraFabrica2Maqui)
end)