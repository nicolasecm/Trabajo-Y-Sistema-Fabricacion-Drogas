g_RPCFunctions = {
	setPedGravity = { option = 'gravity.enabled', descr = 'Setting gravity' },
	setPedStat = { option = 'stats', descr = 'Changing stats' },
}

g_OptionDefaults = {
	gravity = {
		enabled = true
	},
	stats = true,
}

inicio = createMarker (-52.1240234375, 60.8701171875, 2.1171875, "cylinder",1.8, 227, 13, 13, 0 )

function CambiaarTeam()
	local team = getTeamFromName("Criminales")
	setPlayerTeam( source, team)
	local resp = getElementModel(source)
	setElementData  (source, "SkinF", resp)
	setPlayerNametagColor (source, 227, 13, 13)
end
addEvent( "CambiarTeamTrabajoFabricante", true)
addEventHandler( "CambiarTeamTrabajoFabricante", getRootElement(), CambiaarTeam)

function quitarPlataServer (total)
	takePlayerMoney ( source,total )
end
addEvent( "quitarPlataServer", true)
addEventHandler( "quitarPlataServer", getRootElement(), quitarPlataServer)

function DarVidaExtasis()
local vida = getElementHealth(source)
setElementHealth(source,vida+30)
end
addEvent( "DarVidaExtasis", true)
addEventHandler( "DarVidaExtasis", getRootElement(), DarVidaExtasis)

function DarArmaduraCrack()
local armadu = getPedArmor(source)
setPedArmor(source,armadu+30)
end
addEvent( "DarArmaduraCrack", true)
addEventHandler( "DarArmaduraCrack", getRootElement(), DarArmaduraCrack)

function CambiarVidaJugador()
setElementHealth(source,100)
end
addEvent( "CambiarVidaJugador", true)
addEventHandler( "CambiarVidaJugador", getRootElement(), CambiarVidaJugador)

function CambiarArmaduraJugador()
setPedArmor(source,100)
end
addEvent( "CambiarArmaduraJugador", true)
addEventHandler( "CambiarArmaduraJugador", getRootElement(), CambiarArmaduraJugador)

function CambiarOcupacion()
	local CS = getElementData(source, "semillas")
    setElementData(source,"Ocupacion", "Fabricante de drogas", true)
	setElementData(source,"VehiTrabajo", 0, true)
	sum = getElementData(inicio, "DimensionJuga")
	setElementData  (source, "DimensionTrafico", sum+1)
	setElementData  (inicio, "DimensionJuga", sum+1)
	if CS and tonumber(CS) ~= nil then else
		setElementData  (source, "semillas", 0)
	end
end
addEvent( "CambiarOcupacionFabricante", true)
addEventHandler( "CambiarOcupacionFabricante", getRootElement(), CambiarOcupacion)

function empezarFull()
	if source ~= getResourceRootElement(getThisResource()) then return end
	setElementData  (inicio, "DimensionJuga", 2)
end
addEventHandler( "onResourceStart", getRootElement(),empezarFull)

_setPlayerGravity = setPedGravity
function setPedGravity(player, grav)
		_setPlayerGravity(player, grav)
end

addEvent('onServerCall', true)
addEventHandler('onServerCall', resourceRoot,
	function(fnName, ...)
		source = client		-- Some called functions require 'source' to be set to the triggering client
		local fnInfo = g_RPCFunctions[fnName]

		if fnInfo and ((type(fnInfo) == 'boolean' and fnInfo) or (type(fnInfo) == 'table' and getOption(fnInfo.option))) then
			local fn = _G
			for i,pathpart in ipairs(fnName:split('.')) do
				fn = fn[pathpart]
			end
			fn(...)
		elseif type(fnInfo) == 'table' then
			errMsg(fnInfo.descr .. ' is not allowed', source)
		end
	end
)

function getOption(optionName)
	local option = get(optionName:gsub('%.', '/'))
	if option then
		if option == 'true' then
			option = true
		elseif option == 'false' then
			option = false
		end
		return option
	end
	option = g_OptionDefaults
	for i,part in ipairs(optionName:split('.')) do
		option = option[part]
	end
	return option
end

function string:split(separator)
	if separator == '.' then
		separator = '%.'
	end
	local result = {}
	for part in self:gmatch('(.-)' .. separator) do
		result[#result+1] = part
	end
	result[#result+1] = self:match('.*' .. separator .. '(.*)$') or self
	return result
end