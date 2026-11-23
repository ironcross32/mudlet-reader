reader = reader or {}

-- Stops TTS speech and clears the queue. On Windows speech goes through the
-- screen reader, which this package can't silence.
function reader.stop()
	if reader.isWindows then
		return
	end
	ttsClearQueue()
	ttsSkip()
end

-- Speaks text. With interrupt set, cuts off whatever is being spoken first.
function reader.say(text, interrupt)
	if reader.isWindows then
		announce(text)
		return
	end
	if interrupt then
		reader.stop()
	end
	ttsQueue(text)
end

-- Speaks a line of output, saying "blank" for an empty one.
function reader.sayLine(text)
	if text == nil or text == "" then
		text = "blank"
	end
	reader.say(text)
end
