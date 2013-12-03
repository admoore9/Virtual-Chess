local function changeTransformColor(xform, color)
        local mat = osg.Material()
        mat:setColorMode(0x1201)
        mat:setAmbient (0x0408, osg.Vec4(color[1], color[2], color[3], .5))
        mat:setDiffuse (0x0408, osg.Vec4(0.2, 0.2, 0.2, 1.0))
        mat:setSpecular(0x0408, osg.Vec4(0.2, 0.2, 0.2, 1.0))
        mat:setShininess(0x0408, 1)
        local ss = xform:getOrCreateStateSet()
        ss:setAttributeAndModes(mat, osg.StateAttribute.Values.ON+osg.StateAttribute.Values.OVERRIDE);
end

selectSquare = Transform{
	Model[[ive/selectSquare.ive]],
	scale = scale,
}
changeTransformColor(selectSquare, {1, 0, 0})

Actions.addFrameAction(
	function()
		while true do
				updateSelectedPiece()
				if (selectedPiece ~= nil) then
					RelativeTo.World:addChild(selectSquare)
					repeat
						updateSelectedPiece()
						updateClosestSquare()
						selectSquare:setPosition(Vec(closestSquare.x, closestSquare.y, closestSquare.z))
						Actions.waitForRedraw()
					until (selectedPiece == nil)
					RelativeTo.World:removeChild(selectSquare)
				end
		Actions.waitForRedraw()
		end
	end
)