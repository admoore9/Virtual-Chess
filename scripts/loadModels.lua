-- [[ function for loading models into the scene ]]
piece = {}

library = Transform{
	Model[[ive/library2.ive]],
	scale = 4.5,
	position = {boardX + 3 * scale, 0, boardZ},
}

board = Transform{
	Model[[ive/board4.ive]],
	position = {boardX, boardHeight, boardZ},
	scale = scale,
}

local CHESS_PIECE_SCALE = 1.5 * scale
-- [[ black special pieces ]]
BR1 = Transform{
	Model[[ive/BR.ive]],
	position = {pieceStartingLocation.BR1.x + boardX, boardHeight, pieceStartingLocation.BR1.z + boardZ},
	scale = CHESS_PIECE_SCALE,
	BR1Switch
}
table.insert(piece, BR1)

BKn1 = Transform{
	Model[[ive/BKn.ive]],
	position = {pieceStartingLocation.BKn1.x + boardX, boardHeight, pieceStartingLocation.BKn1.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	BKn1Switch,
}
table.insert(piece, BKn1)

BB1 = Transform{
	Model[[ive/BB.ive]],
	position = {pieceStartingLocation.BB1.x + boardX, boardHeight, pieceStartingLocation.BB1.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	BB1Switch,
}
table.insert(piece, BB1)

BK = Transform{
	Model[[ive/BK.ive]],
	position = {pieceStartingLocation.BK.x + boardX, boardHeight, pieceStartingLocation.BK.z + boardZ},
	orientation = AngleAxis(Degrees(90), Axis{0.0, 1.0, 0.0}),
	scale = CHESS_PIECE_SCALE,
	BKSwitch,
}
table.insert(piece, BK)

BQ = Transform{
	Model[[ive/BQ.ive]],
	position = {pieceStartingLocation.BQ.x + boardX, boardHeight, pieceStartingLocation.BQ.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	BQSwitch,
}
table.insert(piece, BQ)

BB2 = Transform{
	Model[[ive/BB.ive]],
	position = {pieceStartingLocation.BB2.x + boardX, boardHeight, pieceStartingLocation.BB2.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	BB2Switch,
}
table.insert(piece, BB2)

BKn2 = Transform{
	Model[[ive/BKn.ive]],
	position = {pieceStartingLocation.BKn2.x + boardX, boardHeight, pieceStartingLocation.BKn2.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	BKn2Switch,
}
table.insert(piece, BKn2)

BR2 = Transform{
	Model[[ive/BR.ive]],
	position = {pieceStartingLocation.BR2.x + boardX, boardHeight, pieceStartingLocation.BR2.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	BR2Switch,
}
table.insert(piece, BR2)

-- [[ black pawns ]]
BP1 = Transform{
	Model[[ive/BP.ive]],
	position = {pieceStartingLocation.BP1.x + boardX, boardHeight, pieceStartingLocation.BP1.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	BP1Switch,
}
table.insert(piece, BP1)

BP2 = Transform{ 
	Model[[ive/BP.ive]],
	position = {pieceStartingLocation.BP2.x + boardX, boardHeight, pieceStartingLocation.BP2.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	BP2Switch,
}
table.insert(piece, BP2)

BP3 = Transform{
	Model[[ive/BP.ive]],
	position = {pieceStartingLocation.BP3.x + boardX, boardHeight, pieceStartingLocation.BP3.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	BP3Switch,
}
table.insert(piece, BP3)

BP4 = Transform{
	Model[[ive/BP.ive]],
	position = {pieceStartingLocation.BP4.x + boardX, boardHeight, pieceStartingLocation.BP4.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	BP4Switch,
}
table.insert(piece, BP4)

BP5 = Transform{
	Model[[ive/BP.ive]],
	position = {pieceStartingLocation.BP5.x + boardX, boardHeight, pieceStartingLocation.BP5.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	BP5Switch,
}
table.insert(piece, BP5)

BP6 = Transform{
	Model[[ive/BP.ive]],
	position = {pieceStartingLocation.BP6.x + boardX, boardHeight, pieceStartingLocation.BP6.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	BP6Switch,
}
table.insert(piece, BP6)

BP7 = Transform{
	Model[[ive/BP.ive]],
	position = {pieceStartingLocation.BP7.x + boardX, boardHeight, pieceStartingLocation.BP7.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	BP7Switch,
}
table.insert(piece, BP7)

BP8 = Transform{
	Model[[ive/BP.ive]],
	position = {pieceStartingLocation.BP8.x + boardX, boardHeight, pieceStartingLocation.BP8.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	BP8Switch,
}
table.insert(piece, BP8)

-- [[ white special pieces ]]
WR1 = Transform{
	Model[[ive/WR.ive]],
	position = {pieceStartingLocation.WR1.x + boardX, boardHeight, pieceStartingLocation.WR1.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	WR1Switch,
}
table.insert(piece, WR1)

WKn1 = Transform{
	Model[[ive/WKn.ive]],
	position = {pieceStartingLocation.WKn1.x + boardX, boardHeight, pieceStartingLocation.WKn1.z + boardZ},
	orientation = AngleAxis(Degrees(180), Axis{0.0, 1.0, 0.0}),
	scale = CHESS_PIECE_SCALE,
	WKn1Switch,
}
table.insert(piece, WKn1)

WB1 = Transform{
	Model[[ive/WB.ive]],
	position = {pieceStartingLocation.WB1.x + boardX, boardHeight, pieceStartingLocation.WB1.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	WB1Switch,
}
table.insert(piece, WB1)

WK = Transform{
	Model[[ive/WK.ive]],
	position = {pieceStartingLocation.WK.x + boardX, boardHeight, pieceStartingLocation.WK.z + boardZ},
	orientation = AngleAxis(Degrees(90), Axis{0.0, 1.0, 0.0}),
	scale = CHESS_PIECE_SCALE,
	WKSwitch,
}
table.insert(piece, WK)

WQ = Transform{
	Model[[ive/WQ.ive]],
	position = {pieceStartingLocation.WQ.x + boardX, boardHeight, pieceStartingLocation.WQ.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	WQSwitch,
}
table.insert(piece, WQ)

WB2 = Transform{
	Model[[ive/WB.ive]],
	position = {pieceStartingLocation.WB2.x + boardX, boardHeight, pieceStartingLocation.WB2.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	WB2Switch,
}
table.insert(piece, WB2)

WKn2 = Transform{
	Model[[ive/WKn.ive]],
	position = {pieceStartingLocation.WKn2.x + boardX, boardHeight, pieceStartingLocation.WKn2.z + boardZ},
	orientation = AngleAxis(Degrees(180), Axis{0.0, 1.0, 0.0}),
	scale = CHESS_PIECE_SCALE,
	WKn2Switch,
}
table.insert(piece, WKn2)

WR2 = Transform{
	Model[[ive/WR.ive]],
	position = {pieceStartingLocation.WR2.x + boardX, boardHeight, pieceStartingLocation.WR2.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	WR2Switch,
}
table.insert(piece, WR2)

-- [[ white pawns ]]
WP1 = Transform{
	Model[[ive/WP.ive]],
	position = {pieceStartingLocation.WP1.x + boardX, boardHeight, pieceStartingLocation.WP1.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	WP1Switch,
}
table.insert(piece, WP1)

WP2 = Transform{
	Model[[ive/WP.ive]],
	position = {pieceStartingLocation.WP2.x + boardX, boardHeight, pieceStartingLocation.WP2.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	WP2Switch,
}
table.insert(piece, WP2)

WP3 = Transform{
	Model[[ive/WP.ive]],
	position = {pieceStartingLocation.WP3.x + boardX, boardHeight, pieceStartingLocation.WP3.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	WP3Switch,
}
table.insert(piece, WP3)

WP4 = Transform{
	Model[[ive/WP.ive]],
	position = {pieceStartingLocation.WP4.x + boardX, boardHeight, pieceStartingLocation.WP4.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	WP4Switch,
}
table.insert(piece, WP4)

WP5 = Transform{
	Model[[ive/WP.ive]],
	position = {pieceStartingLocation.WP5.x + boardX, boardHeight, pieceStartingLocation.WP5.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	WP5Switch,
}
table.insert(piece, WP5)

WP6 = Transform{
	Model[[ive/WP.ive]],
	position = {pieceStartingLocation.WP6.x + boardX, boardHeight, pieceStartingLocation.WP6.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	WP6Switch,
}
table.insert(piece, WP6)

WP7 = Transform{
	Model[[ive/WP.ive]],
	position = {pieceStartingLocation.WP7.x + boardX, boardHeight, pieceStartingLocation.WP7.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	WP7Switch,
}
table.insert(piece, WP7)

WP8 = Transform{
	Model[[ive/WP.ive]],
	position = {pieceStartingLocation.WP8.x + boardX, boardHeight, pieceStartingLocation.WP8.z + boardZ}, 
	scale = CHESS_PIECE_SCALE,
	WP8Switch,
}
table.insert(piece, WP8)

-- [[ add models to scene ]]
RelativeTo.World:addChild(library)
RelativeTo.World:addChild(board)

-- [[ function to add all of the pieces to the world ]]
local function addPiecesToWorld()
	for i, v in ipairs(piece) do
		RelativeTo.World:addChild(v)
	end
end
addPiecesToWorld()