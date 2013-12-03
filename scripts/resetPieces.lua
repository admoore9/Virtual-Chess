-- [[ Frame action to reset the position of all the pieces ]]
Actions.addFrameAction(
	function()
		local button = gadget.DigitalInterface("VJButton1")
		-- local button = gadget.DigitalInterface("WMButtonHome")
		while true do
			repeat
			Actions.waitForRedraw()
			until button.justPressed
			for i,v in ipairs(piece) do
				piece[i]:setPosition(Vec(squareLocation[i].x, squareLocation[i].y, squareLocation[i].z))
			end
			runfile[[scripts/squareLocation.lua]]
			-- reset x starting location for black's taken pieces
			xTakenBPiece = boardX - .85 * scale
			-- reset x starting location for white's taken pieces
			xTakenWPiece = boardX - .85 * scale
			-- reset z starting location for taken pieces
			zTakenPiece = boardZ - .20 * scale
			Actions.waitForRedraw()
		end
		undoAvailable = false
	end
)