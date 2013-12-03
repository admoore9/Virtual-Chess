require("Actions")
require ("AddAppDirectory")

AddAppDirectory()

scale = .3
boardHeight = 4.15 * scale
boardX = 1.78308
boardZ = 0.762

local selectedPiece

-- [[ run scripts ]]
runfile[[scripts/simpleLights.lua]]
runfile[[scripts/sound.lua]]
runfile[[scripts/navigation.lua]]
-- runfile[[scripts/coneOnWand.lua]]
runfile[[scripts/squareLocation.lua]]
runfile[[scripts/loadModels.lua]]
runfile[[scripts/selectMovePiece.lua]]
runfile[[scripts/selectPieceEffect.lua]]
-- runfile[[scripts/resetPieces.lua]]
runfile[[scripts/undoMovePiece.lua]]


-- [[ start background music ]]
startBackgroundSound()

-- [[ set up navigation ]]
myNav = FlyOrWalkNavigation{
	start = "walking",
	switchButton = gadget.DigitalInterface("WMButtonPlus"),
	initiateRotationButton1 = gadget.DigitalInterface("WMButtonLeft"),
	initiateRotationButton2 = gadget.DigitalInterface("WMButtonRight"),
}