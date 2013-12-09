Actions.addFrameAction(
	function()
		local wand = gadget.PositionInterface('VJWand')
		-- local button = gadget.DigitalInterface("VJButton1")
		local button = gadget.DigitalInterface("WMButtonMinus")
		while true do
			repeat
				Actions.waitForRedraw()
			until button.justPressed
			if (undoAvailable == true) then
				previousSelectedPiece:setPosition(Vec(previousSquareLocation.x, previousSquareLocation.y, previousSquareLocation.z))
				previousSquareLocation.squareOccupied = true
				currentSquareLocation.squareOccupied = false
				if (previousPieceTaken == true) then
					currentSquareLocation.squareOccupied = true
					takenPiece:setPosition(Vec(currentSquareLocation.x, currentSquareLocation.y, currentSquareLocation.z))
					if (pieceColor == "black") then
						xTakenBPiece  = xTakenBPiece - DISTANCE_BETWEEN_TAKEN_PIECES
					end
					if (pieceColor == "white") then
						xTakenWPiece  = xTakenWPiece - DISTANCE_BETWEEN_TAKEN_PIECES
					end
				end
			end
			undoAvailable = false
		end
	end
)