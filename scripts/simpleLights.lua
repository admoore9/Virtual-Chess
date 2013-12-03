-- [[ function for adding simple lights to the scene ]]

ss = RelativeTo.World:getOrCreateStateSet()

function doLight1()
        l3 = osg.Light()
        l3:setLightNum(3)
        l3:setAmbient(osg.Vec4(.5, .5, .5, 1.0))
        ls3 = osg.LightSource()
        ls3:setLight(l3)
        ls3:setLocalStateSetModes(osg.StateAttribute.Values.ON)
        ss:setAssociatedModes(l3, osg.StateAttribute.Values.ON)
        RelativeTo.Room:addChild(ls3)
        l3:setPosition(osg.Vec4(-1.0, 0.0, 1.25, 1.0))
end

function doLight2()
        l2 = osg.Light()
        l2:setLightNum(1)
        l2:setAmbient(osg.Vec4(.4, .4, 0.4, 1.0))
        ls2 = osg.LightSource()
        ls2:setLight(l2)
        ls2:setLocalStateSetModes(osg.StateAttribute.Values.ON)
        ss:setAssociatedModes(l2, osg.StateAttribute.Values.ON)
        RelativeTo.Room:addChild(ls2)
        l2:setPosition(osg.Vec4(1.5, 2, 1.25, 1.0))
end

function doLight4()
	l4 = osg.Light()
	l4:setLightNum(4)
	l4:setAmbient(osg.Vec4(.3, .3, .3, 1))
	l4:setDiffuse(osg.Vec4(.8, .8, .8, 1))
	l4:setConstantAttenuation(.7)
	l4:setLinearAttenuation(0)
	l4:setQuadraticAttenuation(0)
	ls4 = osg.LightSource()
	ls4:setLight(l4)
	ls4:setLocalStateSetModes(osg.StateAttribute.Values.ON)
	ss:setAssociatedModes(l4, osg.StateAttribute.Values.ON)
	RelativeTo.World:addChild(ls4)
	l4:setPosition(osg.Vec4(boardX, 1, boardZ, 1.0))
end

doLight1()
doLight2()
doLight4()
print("simpleLights added to scene")