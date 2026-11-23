reader = reader or {}

-- Called by the "reader incoming line" trigger for every line from the game.
-- Reads it with TTS while Mudlet has focus. Windows uses the screen reader instead.
function reader.onLine()
	if reader.isWindows or not hasFocus() then
		return
	end
	ttsQueue(getCurrentLine())
end
