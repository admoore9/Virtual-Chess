local transformMatrixRoomToWorld = function(m)
        return m * RelativeTo.World:getInverseMatrix()
end

local transformMatrixWorldToRoom = function(m)
        return m * RelativeTo.World:getMatrix()
end

local squareDistToWand = {}

-- [[ function that tracks if a piece is within a certain distance from the wand and selects it ]]
function updateSelectedPiece()
	local pieceDistToWand
	local wand = gadget.PositionInterface('VJWand')
	local si -- selected piece index
	for i,val in ipairs(piece) do
		local wandInRoom = transformMatrixRoomToWorld(wand.position)
		-- distance formula
 		pieceDistToWand = math.sqrt((piece[i]:computeBound():center():x() - wandInRoom:x())^2 + (piece[i]:computeBound():center():z() - wandInRoom:z())^2)
		local Max_SELECTABLE_DISTANCE = .165 * scale
		if (pieceDistToWand < Max_SELECTABLE_DISTANCE) then
			si = i
		end
	end
	selectedPiece = piece[si]
end

-- [[ function that keeps track of square distances to wand ]]
function updateSquareDistance()
	local wand = gadget.PositionInterface('VJWand')
	for i,val in ipairs(squareLocation) do
		local wandInRoom = transformMatrixRoomToWorld(wand.position)
		-- distance formula
		squareDistToWand[i] = math.sqrt((squareLocation[i].x - wandInRoom:x())^2 + (squareLocation[i].z - wandInRoom:z())^2)
	end
end

-- [[ function that keeps track of the closest square to the wand ]]
function updateClosestSquare()
	updateSquareDistance()
	local mi = 1   --minimum index
	local m = squareDistToWand[mi]  --minimum value
	for i,val in ipairs(squareDistToWand) do
		if val < m then
			mi = i
			m = val
		end
	end
	closestSquare = squareLocation[mi]
end

-- [[ function that keeps track of the closest piece to the wand ]]
function updateClosestPiece()
	local mi = 1   --minimum index
	local m = pieceDistToWand[mi]  --minimum value
	for i,val in ipairs(pieceDistToWand) do
		if val < m then
			mi = i
			m = val
		end
	end
	closestPiece = piece[mi]
end

-- [[ function for when a piece is taken by the opposing player ]]
DISTANCE_BETWEEN_TAKEN_PIECES = .3 * scale

xTakenBPiece = boardX - .85 * scale
xTakenWPiece = boardX - .85 * scale
zTakenPiece = boardZ - .20 * scale
takenPiece = nil
function removeTakenPiece()
	for i, val in ipairs(piece) do
		if (piece[i]:getPosition():x() == closestSquare.x and piece[i]:getPosition():z() == closestSquare.z and piece[i]:getPosition():y() == closestSquare.y) then
			if (i < 17) then
				piece[i]:setPosition(Vec(xTakenBPiece, boardHeight, zTakenPiece))
				xTakenBPiece = xTakenBPiece + DISTANCE_BETWEEN_TAKEN_PIECES
				takenPiece = piece[i]
				pieceColor = "black"
			end
			if (i >= 17) then
				piece[i]:setPosition(Vec(xTakenWPiece, boardHeight, zTakenPiece - .35 * scale))
				xTakenWPiece = xTakenWPiece + DISTANCE_BETWEEN_TAKEN_PIECES
				takenPiece = piece[i]
				pieceColor = "white"
			end
		end
	end
end

-- [[ frame action for manipulation ]]
previousSelectedPiece = nil
previousSquareLocation = nil
currentSquareLocation = nil
previousPieceTaken = false
undoAvailable = false

Actions.addFrameAction(
	function()
		local wand = gadget.PositionInterface('VJWand')
		local button = gadget.DigitalInterface("VJButton2")
		-- local button = gadget.DigitalInterface("WMButtonB")
		while true do
			repeat
				Actions.waitForRedraw()
			until button.justPressed
			updateSelectedPiece()
			if (selectedPiece ~= nil) then
				updateClosestSquare()
				previousSquareLocation = closestSquare --Store original location for undo button
				previousSelectedPiece = selectedPiece --Store piece for undo button
				movingPiece = selectedPiece
				closestSquare.squareOccupied = false
				playMove()
				repeat
					movingPiece.Position = transformMatrixRoomToWorld(wand.position)
					Actions.waitForRedraw()
				until button.justPressed
				updateClosestSquare()
				currentSquareLocation = closestSquare
				if (closestSquare.squareOccupied == true) then
					previousPieceTaken = true
					removeTakenPiece()
					movingPiece:setPosition(Vec(closestSquare.x, closestSquare.y, closestSquare.z))
					pieceTaken()
					undoAvailable = true
				else
					previousPieceTaken = false
					movingPiece:setPosition(Vec(closestSquare.x, closestSquare.y, closestSquare.z))
					playMove()
					closestSquare.squareOccupied = true
					undoAvailable = true
				end
			end
		end
	end
)