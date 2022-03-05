addEventHandler("onPlayerLogin", root, 
function ()
	setElementData (source, "Cuenta", getAccountName(getPlayerAccount(source)))
	setTimer (function (source)
		local se = getElementData(source, "semillas")
		local md = getElementData(source, "materialD")
		local qa = getElementData(source, "quimicoA")
		local qb = getElementData(source, "quimicoB")
		local gg = getElementData(source, "galonGaso")
		local jme = getElementData(source, "Metanfetamina")
		local jma = getElementData(source, "Marihuana")
		local je = getElementData(source, "Extasis")
		local jc = getElementData(source, "Crack")
		local ujme = getElementData(source, "UsandoMetanfetamina")
		local ujma = getElementData(source, "UsandoMarihuana")
		local uje = getElementData(source, "UsandoExtasis")
		local ujc = getElementData(source, "UsandoCrack")
		local du = getElementData(source, "DrogasUsadas")
		local fo1 = getElementData(source, "fabobjetouno")
		local mp1 = getElementData(source, "fabmejorauno")
		local mp2 = getElementData(source, "fabmejorados")
		local mp3 = getElementData(source, "fabmejoratres")
		local mp4 = getElementData(source, "fabmejoracuat")
		local mp5 = getElementData(source, "fabmejoracinc")
		local mp6 = getElementData(source, "fabmejoraseis")
		local mp7 = getElementData(source, "fabmejorasiet")
		local cmp = getElementData(source, "cantMejorPlan")
		local mffo1 = getElementData(source, "Mejoffabobjetouno")
		local mffo2 = getElementData(source, "Mejoffabobjetodos")
		local mffo3 = getElementData(source, "Mejoffabobjetotres")
		local mffo4 = getElementData(source, "Mejoffabobjetocuat")
		local mffo5 = getElementData(source, "Mejoffabobjetocinc")
		local mffo6 = getElementData(source, "Mejoffabobjetoseis")
		local mffo7 = getElementData(source, "Mejoffabobjetosiet")
		local mffo8 = getElementData(source, "Mejoffabobjetoocho")
		local cmm1 = getElementData(source, "cantMejorMaq1")
		local cmm2 = getElementData(source, "cantMejorMaq2")
		local tprofab = getElementData(source, "tiempoProcesosFabri")
		local tprofab2 = getElementData(source, "tiempoProcesosFabri2")
		local tgerplan = getElementData(source, "tiempoGermiPlant")
		if se and tonumber(se) ~= nil then else
			setElementData  (source, "semillas", 0)
		end
		if md and tonumber(md) ~= nil then else
			setElementData  (source, "materialD", 0)
		end
		if gg and tonumber(gg) ~= nil then else
			setElementData  (source, "galonGaso", 0)
		end
		if qa and tonumber(qa) ~= nil then else
			setElementData  (source, "quimicoA", 0)
		end 
		if qb and tonumber(qb) ~= nil then else
			setElementData  (source, "quimicoB", 0)
		end
		if jme and tonumber(jme) ~= nil then else
			setElementData  (source, "Metanfetamina", 0)
		end
		if jma and tonumber(jma) ~= nil then else
			setElementData  (source, "Marihuana", 0)
		end
		if je and tonumber(je) ~= nil then else
			setElementData  (source, "Extasis", 0)
		end
		if jc and tonumber(jc) ~= nil then else
			setElementData  (source, "Crack", 0)
		end
		if ujme and tonumber(ujme) ~= nil then else
			setElementData  (source, "UsandoMetanfetamina", 0)
		end
		if ujma and tonumber(ujma) ~= nil then else
			setElementData  (source, "UsandoMarihuana", 0)
		end
		if uje and tonumber(uje) ~= nil then else
			setElementData  (source, "UsandoExtasis", 0)
		end
		if ujc and tonumber(ujc) ~= nil then else
			setElementData  (source, "UsandoCrack", 0)
		end
		if du and tonumber(du) ~= nil then else
			setElementData  (source, "DrogasUsadas", 0)
		end
		if mffo1 and tonumber(mffo1) ~= nil then else
			setElementData  (source, "Mejoffabobjetouno", 0)
		end
		if mffo2 and tonumber(mffo2) ~= nil then else
			setElementData  (source, "Mejoffabobjetodos", 0)
		end
		if mffo3 and tonumber(mffo3) ~= nil then else
			setElementData  (source, "Mejoffabobjetotres", 0)
		end
		if mffo4 and tonumber(mffo4) ~= nil then else
			setElementData  (source, "Mejoffabobjetocuat", 0)
		end
		if mffo5 and tonumber(mffo5) ~= nil then else
			setElementData  (source, "Mejoffabobjetocinc", 0)
		end
		if mffo6 and tonumber(mffo6) ~= nil then else
			setElementData  (source, "Mejoffabobjetoseis", 0)
		end
		if mffo7 and tonumber(mffo7) ~= nil then else
			setElementData  (source, "Mejoffabobjetosiet", 0)
		end
		if mffo8 and tonumber(mffo8) ~= nil then else
			setElementData  (source, "Mejoffabobjetoocho", 0)
		end
		if cmm1 and tonumber(cmm1) ~= nil then else
			setElementData  (source, "cantMejorMaq1", 0)
		end
		if cmm2 and tonumber(cmm2) ~= nil then else
			setElementData  (source, "cantMejorMaq2", 0)
		end
		if tprofab and tonumber(tprofab) ~= nil then else
			setElementData  (source, "tiempoProcesosFabri", 0)
		end
		if tprofab2 and tonumber(tprofab2) ~= nil then else
			setElementData  (source, "tiempoProcesosFabri2", 0)
		end
		if tgerplan and tonumber(tgerplan) ~= nil then else
			setElementData  (source, "tiempoGermiPlant", 0)
		end
		if fo1 and tonumber(fo1) ~= nil then else
			setElementData  (source, "fabobjetouno", 0)
		end
		if mp1 and tonumber(mp1) ~= nil then else
			setElementData  (source, "fabmejorauno", 0)
		end
		if mp2 and tonumber(mp2) ~= nil then else
			setElementData  (source, "fabmejorados", 0)
		end
		if mp3 and tonumber(mp3) ~= nil then else
			setElementData  (source, "fabmejoratres", 0)
		end
		if mp4 and tonumber(mp4) ~= nil then else
			setElementData  (source, "fabmejoracuat", 0)
		end
		if mp5 and tonumber(mp5) ~= nil then else
			setElementData  (source, "fabmejoracinc", 0)
		end
		if mp6 and tonumber(mp6) ~= nil then else
			setElementData  (source, "fabmejoraseis", 0)
		end
		if mp7 and tonumber(mp7) ~= nil then else
			setElementData  (source, "fabmejorasiet", 0)
		end
		if cmp and tonumber(cmp) ~= nil then else
			setElementData  (source, "cantMejorPlan", 0)
		end
	end, 1000, 1, source)
	triggerClientEvent (source, "iniciarPanelLoginDrogas", source)
	triggerClientEvent (source, "iniciarPanelLoginAyuda", source)
end)

function playerLoginFre (thePreviousAccount, theCurrentAccount, autoLogin)
  if  not (isGuestAccount (getPlayerAccount (source))) then
    local accountData = getAccountData (theCurrentAccount, "funmodev2-money")
    if (accountData) then
		local DimensionTrafico = getAccountData(theCurrentAccount,"DimensionTrafico")
		setElementData(source,"DimensionTrafico",DimensionTrafico)
		local playerMoney = getAccountData (theCurrentAccount, "funmodev2-money")
		setPlayerMoney (source, playerMoney)
		local semillas = getAccountData(theCurrentAccount,"semillas")
		setElementData(source,"semillas",semillas)
		local materialD = getAccountData(theCurrentAccount,"materialD")
		setElementData(source,"materialD",materialD)
		local galonGaso = getAccountData(theCurrentAccount,"galonGaso")
		setElementData(source,"galonGaso",galonGaso)
		local quimicoA = getAccountData(theCurrentAccount,"quimicoA")
		setElementData(source,"quimicoA",quimicoA)
		local quimicoB = getAccountData(theCurrentAccount,"quimicoB")
		setElementData(source,"quimicoB",quimicoB)
		local Metanfetamina = getAccountData(theCurrentAccount,"Metanfetamina")
		setElementData(source,"Metanfetamina",Metanfetamina)
		local Marihuana = getAccountData(theCurrentAccount,"Marihuana")
		setElementData(source,"Marihuana",Marihuana)
		local Extasis = getAccountData(theCurrentAccount,"Extasis")
		setElementData(source,"Extasis",Extasis)
		local Crack = getAccountData(theCurrentAccount,"Crack")
		setElementData(source,"Crack",Crack)
		local Mejoffabobjetouno = getAccountData(theCurrentAccount,"Mejoffabobjetouno")
		setElementData(source,"Mejoffabobjetouno",Mejoffabobjetouno)
		local Mejoffabobjetodos = getAccountData(theCurrentAccount,"Mejoffabobjetodos")
		setElementData(source,"Mejoffabobjetodos",Mejoffabobjetodos)
		local Mejoffabobjetotres = getAccountData(theCurrentAccount,"Mejoffabobjetotres")
		setElementData(source,"Mejoffabobjetotres",Mejoffabobjetotres)
		local Mejoffabobjetocuat = getAccountData(theCurrentAccount,"Mejoffabobjetocuat")
		setElementData(source,"Mejoffabobjetocuat",Mejoffabobjetocuat)
		local Mejoffabobjetocinc = getAccountData(theCurrentAccount,"Mejoffabobjetocinc")
		setElementData(source,"Mejoffabobjetocinc",Mejoffabobjetocinc)
		local Mejoffabobjetoseis = getAccountData(theCurrentAccount,"Mejoffabobjetoseis")
		setElementData(source,"Mejoffabobjetoseis",Mejoffabobjetoseis)
		local Mejoffabobjetosiet = getAccountData(theCurrentAccount,"Mejoffabobjetosiet")
		setElementData(source,"Mejoffabobjetosiet",Mejoffabobjetosiet)
		local Mejoffabobjetoocho = getAccountData(theCurrentAccount,"Mejoffabobjetoocho")
		setElementData(source,"Mejoffabobjetoocho",Mejoffabobjetoocho)
		local cantMejorMaq1 = getAccountData(theCurrentAccount,"cantMejorMaq1")
		setElementData(source,"cantMejorMaq1",cantMejorMaq1)
		local cantMejorMaq2 = getAccountData(theCurrentAccount,"cantMejorMaq2")
		setElementData(source,"cantMejorMaq2",cantMejorMaq2)
		local tiempoProcesosFabri = getAccountData(theCurrentAccount,"tiempoProcesosFabri")
		setElementData(source,"tiempoProcesosFabri",tiempoProcesosFabri)
		local tiempoProcesosFabri2 = getAccountData(theCurrentAccount,"tiempoProcesosFabri2")
		setElementData(source,"tiempoProcesosFabri2",tiempoProcesosFabri2)
		local tiempoGermiPlant = getAccountData(theCurrentAccount,"tiempoGermiPlant")
		setElementData(source,"tiempoGermiPlant",tiempoGermiPlant)
		local fabobjetouno = getAccountData(theCurrentAccount,"fabobjetouno")
		setElementData(source,"fabobjetouno",fabobjetouno)
		local fabmejorauno = getAccountData(theCurrentAccount,"fabmejorauno")
		setElementData(source,"fabmejorauno",fabmejorauno)
		local fabmejorados = getAccountData(theCurrentAccount,"fabmejorados")
		setElementData(source,"fabmejorados",fabmejorados)
		local fabmejoratres = getAccountData(theCurrentAccount,"fabmejoratres")
		setElementData(source,"fabmejoratres",fabmejoratres)
		local fabmejoracuat = getAccountData(theCurrentAccount,"fabmejoracuat")
		setElementData(source,"fabmejoracuat",fabmejoracuat)
		local fabmejoracinc = getAccountData(theCurrentAccount,"fabmejoracinc")
		setElementData(source,"fabmejoracinc",fabmejoracinc)
		local fabmejoraseis = getAccountData(theCurrentAccount,"fabmejoraseis")
		setElementData(source,"fabmejoraseis",fabmejoraseis)
		local fabmejorasiet = getAccountData(theCurrentAccount,"fabmejorasiet")
		setElementData(source,"fabmejorasiet",fabmejorasiet)
		local cantMejorPlan = getAccountData(theCurrentAccount,"cantMejorPlan")
		setElementData(source,"cantMejorPlan",cantMejorPlan)
		setElementData(source,"DrogasUsadas",0)
		setElementData(source,"UsandoMetanfetamina",0)
		setElementData(source,"UsandoMarihuana",0)
		setElementData(source,"UsandoExtasis",0)
		setElementData(source,"UsandoCrack",0)
	else
    end   
  end
end
addEventHandler ("onPlayerLogin", getRootElement(), playerLoginFre)

function onLogout ()
	kickPlayer (source, nil, "Logging out is disallowed.")
end
addEventHandler ("onPlayerLogout", getRootElement(), onLogout)

function onQuitFre (quitType, reason, responsibleElement)
  if not (isGuestAccount (getPlayerAccount (source))) then
    account = getPlayerAccount (source)
    if (account) then
		setAccountData (account, "funmodev2-money", tostring (getPlayerMoney (source)))
		local DimensionTrafico = getElementData(source,"DimensionTrafico")
		setAccountData (account,"DimensionTrafico",DimensionTrafico)
		local semillas = getElementData(source,"semillas")
		setAccountData (account,"semillas",semillas)
		local materialD = getElementData(source,"materialD")
		setAccountData (account,"materialD",materialD)
		local galonGaso = getElementData(source,"galonGaso")
		setAccountData (account,"galonGaso",galonGaso)
		local quimicoA = getElementData(source,"quimicoA")
		setAccountData (account,"quimicoA",quimicoA)
		local quimicoB = getElementData(source,"quimicoB")
		setAccountData (account,"quimicoB",quimicoB)
		local Metanfetamina = getElementData(source,"Metanfetamina")
		setAccountData (account,"Metanfetamina",Metanfetamina)
		local Marihuana = getElementData(source,"Marihuana")
		setAccountData (account,"Marihuana",Marihuana)
		local Extasis = getElementData(source,"Extasis")
		setAccountData (account,"Extasis",Extasis)
		local Crack = getElementData(source,"Crack")
		setAccountData (account,"Crack",Crack)
		local Mejoffabobjetouno = getElementData(source,"Mejoffabobjetouno")
		setAccountData (account,"Mejoffabobjetouno",Mejoffabobjetouno)
		local Mejoffabobjetodos = getElementData(source,"Mejoffabobjetodos")
		setAccountData (account,"Mejoffabobjetodos",Mejoffabobjetodos)
		local Mejoffabobjetotres = getElementData(source,"Mejoffabobjetotres")
		setAccountData (account,"Mejoffabobjetotres",Mejoffabobjetotres)
		local Mejoffabobjetocuat = getElementData(source,"Mejoffabobjetocuat")
		setAccountData (account,"Mejoffabobjetocuat",Mejoffabobjetocuat)
		local Mejoffabobjetocinc = getElementData(source,"Mejoffabobjetocinc")
		setAccountData (account,"Mejoffabobjetocinc",Mejoffabobjetocinc)
		local Mejoffabobjetoseis = getElementData(source,"Mejoffabobjetoseis")
		setAccountData (account,"Mejoffabobjetoseis",Mejoffabobjetoseis)
		local Mejoffabobjetosiet = getElementData(source,"Mejoffabobjetosiet")
		setAccountData (account,"Mejoffabobjetosiet",Mejoffabobjetosiet)
		local Mejoffabobjetoocho = getElementData(source,"Mejoffabobjetoocho")
		setAccountData (account,"Mejoffabobjetoocho",Mejoffabobjetoocho)
		local cantMejorMaq1 = getElementData(source,"cantMejorMaq1")
		setAccountData (account,"cantMejorMaq1",cantMejorMaq1)
		local cantMejorMaq2 = getElementData(source,"cantMejorMaq2")
		setAccountData (account,"cantMejorMaq2",cantMejorMaq2)
		local tiempoProcesosFabri = getElementData(source,"tiempoProcesosFabri")
		setAccountData (account,"tiempoProcesosFabri",tiempoProcesosFabri)
		local tiempoProcesosFabri2 = getElementData(source,"tiempoProcesosFabri2")
		setAccountData (account,"tiempoProcesosFabri2",tiempoProcesosFabri2)
		local tiempoGermiPlant = getElementData(source,"tiempoGermiPlant")
		setAccountData (account,"tiempoGermiPlant",tiempoGermiPlant)
		local fabobjetouno = getElementData(source,"fabobjetouno")
		setAccountData (account,"fabobjetouno",fabobjetouno)
		local fabmejorauno = getElementData(source,"fabmejorauno")
		setAccountData (account,"fabmejorauno",fabmejorauno)
		local fabmejorados = getElementData(source,"fabmejorados")
		setAccountData (account,"fabmejorados",fabmejorados)
		local fabmejoratres = getElementData(source,"fabmejoratres")
		setAccountData (account,"fabmejoratres",fabmejoratres)
		local fabmejoracuat = getElementData(source,"fabmejoracuat")
		setAccountData (account,"fabmejoracuat",fabmejoracuat)
		local fabmejoracinc = getElementData(source,"fabmejoracinc")
		setAccountData (account,"fabmejoracinc",fabmejoracinc)
		local fabmejoraseis = getElementData(source,"fabmejoraseis")
		setAccountData (account,"fabmejoraseis",fabmejoraseis)
		local fabmejorasiet = getElementData(source,"fabmejorasiet")
		setAccountData (account,"fabmejorasiet",fabmejorasiet)
		local cantMejorPlan = getElementData(source,"cantMejorPlan")
		setAccountData (account,"cantMejorPlan",cantMejorPlan)
    end
  end
end
addEventHandler ("onPlayerQuit", getRootElement(), onQuitFre)