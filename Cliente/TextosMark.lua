sx,sy = guiGetScreenSize()
textsToDraw = {}
maxrange = 10
addEventHandler("onClientRender",root,
    function()
        for a,b in pairs(textsToDraw) do
            x,y,z = b[1],b[2],b[3]
            scx,scy = getScreenFromWorldPosition (x,y,z)
            camX,camY,camZ = getCameraMatrix()
            if scx and scy and getDistanceBetweenPoints3D(camX,camY,camZ,x,y,z+5) <= maxrange then 
            dxDrawFramedText(b[4],scx-0.5*dxGetTextWidth(b[4],2,"sans"),scy+30-0.5*dxGetFontHeight(2,"sans"),sx, sy+5,tocolor ( b[5], b[6], b[7], 255 ), 2,"sans")
            end
        end
    end
)

function AgregarTextoMarcadores(x,y,z,text,r,g,b)
    table.insert(textsToDraw,{x,y,z,text,r,g,b})
end

function dxDrawFramedText ( message , left , top , width , height , color , scale , font , alignX , alignY , clip , wordBreak , postGUI , frameColor )
	color = color or tocolor ( 255 , 255 , 255 , 255 )
	frameColor = frameColor or tocolor ( 0 , 0 , 0 , 255 )
	scale = scale or 1
	font = font or "sans"
	alignX = alignX or "left"
	alignY = alignY or "top"
	clip = clip or false
	wordBreak = wordBreak or false
	postGUI = postGUI or false
	dxDrawText ( message , left + 1 , top + 1 , width + 1 , height + 1 , frameColor , scale , font , alignX , alignY , clip , wordBreak , postGUI )
	dxDrawText ( message , left + 1 , top - 1 , width + 1 , height - 1 , frameColor , scale , font , alignX , alignY , clip , wordBreak , postGUI )
	dxDrawText ( message , left - 1 , top + 1 , width - 1 , height + 1 , frameColor , scale , font , alignX , alignY , clip , wordBreak , postGUI )
	dxDrawText ( message , left - 1 , top - 1 , width - 1 , height - 1 , frameColor , scale , font , alignX , alignY , clip , wordBreak , postGUI )
	dxDrawText ( message , left , top , width , height , color , scale , font , alignX , alignY , clip , wordBreak , postGUI )
end

AgregarTextoMarcadores( -52.1240234375, 60.8701171875, 3.1171875,"Trabajo Fabricante de drogas",255,2,2)
AgregarTextoMarcadores( -60.32421875, 83.4541015625, 4.1171875,"Plantaciones",255,2,2)
AgregarTextoMarcadores( -64.6328125, 88.868751525879, -64.831253051758,"Salida",255,2,2)
AgregarTextoMarcadores( -31.95703125, 55.24609375, 3.1171875,"Venta de Semillas",255,2,2)
AgregarTextoMarcadores( -56.099609375, 90.9541015625, 3.1171875,"Venta de Mejoras Plantaciones",255,2,2)
AgregarTextoMarcadores( 1382.9296875, 464.9345703125, 20.200037002563,"Venta de Gasolina",255,2,2)
AgregarTextoMarcadores( 661.216796875, -573.4296875, 16.3359375,"Venta de Gasolina",255,2,2)
AgregarTextoMarcadores( -82.720703125, -1178.9775390625, 1.9547624588013,"Venta de Gasolina",255,2,2)
AgregarTextoMarcadores( 122.16796875, -294.3486328125, 1.578125,"Venta de Quimico A",255,2,2)
AgregarTextoMarcadores( 122.2587890625, -319.599609375, 1.578125,"Venta de Quimico B",255,2,2)
AgregarTextoMarcadores( -49.86328125, -269.37109375, 7.633186340332,"Fabrica",255,2,2)
AgregarTextoMarcadores( -54.261131286621, -269.84649658203, -99.598434448242,"Salida",255,2,2)
AgregarTextoMarcadores( -23.0888671875, -270.2490234375, 5.4296875,"Venta de Mejoras Fabrica",255,2,2)

