--print("Loading PlaySound.lua. Wav files must be 16bit float.")
require("getScriptFilename")
vrjLua.appendToModelSearchPath(getScriptFilename())

-- [[ Wav files must be 16 bit float ]]
local SoundWav = function(wavPath)
	snx.changeAPI("OpenAL")
	--create a sound info object 
	local soundInfo = snx.SoundInfo()
	-- set the filename attribute of the soundFile (path to your sound file)
	soundInfo.filename = wavPath
	--create a new sound handle and pass it the filename from the soundInfo object
	local soundHandle = snx.SoundHandle(soundInfo.filename)
	--configure the soundHandle to use the soundInfo
	soundHandle:configure(soundInfo)
	--play or "trigger" the sound
	return soundHandle
end

function startBackgroundSound()
        snx.changeAPI("Audiere")

        i = snx.SoundInfo()
        i.filename = vrjLua.findInModelSearchPath("Sound/Virtutes Vocis.mp3")

        i.ambient = true
        s = snx.SoundHandle("bgaudio")
        s:configure(i)

        -- Loop
        s:trigger(-1)
end

local move = SoundWav(vrjLua.findInModelSearchPath("Sound/move.wav"))
function playMove()
	move:trigger(1)
end

local swordDraw = SoundWav(vrjLua.findInModelSearchPath("Sound/180831__32cheeseman32__sworddraw02.wav"))
function playSwordDraw()
	swordDraw:trigger(1)
end

local swordClash = SoundWav(vrjLua.findInModelSearchPath("Sound/180824__32cheeseman32__swordclash06.wav"))
function playSwordClash()
	swordClash:trigger(1)
end

local swordSheath = SoundWav(vrjLua.findInModelSearchPath("Sound/180829__32cheeseman32__swordsheath01.wav"))
function playSwordSheath()
	swordSheath:trigger(1)
end

function pieceTaken()
	playMove()
	Actions.waitSeconds(.2)
	playSwordClash()
	Actions.waitSeconds(.8)
	playSwordSheath()
end