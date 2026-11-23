reader = reader or {}

-- sysDataSendRequest: stop speaking when the user sends a command.
function reader.onCommandSent(_, sent)
	if sent then
		reader.stop()
	end
end
