-- The reader table holds all of this package's functions and state.
reader = reader or {}
reader.version = "@VERSION@"
reader.isWindows = getOS() == "windows"
-- Index of the line under the review cursor in the main window.
reader.line = reader.line or 0
-- Kept in the profile folder, outside the package folder.
reader.stateFile = getMudletHomeDir() .. "/@PKGNAME@_state.lua"

-- On Windows, Mudlet's own screen reader support reads incoming text.
-- Elsewhere this package reads it with TTS, so Mudlet's reading is turned off.
-- Before turning it off the first time, save whether it was on, so uninstalling
-- can put it back. The file stops later loads (restarts, re-saves) from saving
-- the value Reader set itself.
if not reader.isWindows then
	if not reader.state then
		reader.state = {}
		if io.exists(reader.stateFile) then
			table.load(reader.stateFile, reader.state)
		else
			reader.state.announceWasOn = getConfig("announceIncomingText") == true
			table.save(reader.stateFile, reader.state)
		end
	end
	setConfig("announceIncomingText", false)
end
