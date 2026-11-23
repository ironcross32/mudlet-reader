reader = reader or {}

-- sysUninstall fires for every package and module, so only act on our own.
function reader.onUninstall(_, name)
	if name ~= "@PKGNAME@" then
		return
	end
	if not reader.isWindows then
		reader.stop()
		-- Turn Mudlet's own reading back on only if it was on before Reader turned it off.
		if reader.state and reader.state.announceWasOn then
			setConfig("announceIncomingText", true)
		end
		-- The next install, including an update, saves the setting again.
		os.remove(reader.stateFile)
	end
	-- Uninstalling never clears Lua globals, so drop the table ourselves.
	reader = nil
end
