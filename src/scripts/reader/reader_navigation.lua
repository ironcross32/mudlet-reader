reader = reader or {}

-- The main window always ends with a blank line, so the last real line is one less.
local function lastIndex()
	return getLineCount() - 1
end

local function lineAt(index)
	return getLines(index, index + 1)[1]
end

function reader.currentLine()
	reader.stop()
	reader.sayLine(lineAt(reader.line))
end

function reader.previousLine()
	reader.line = reader.line - 1
	if reader.line < 0 then
		reader.say("Top", true)
		reader.line = 0
	else
		reader.stop()
	end
	reader.sayLine(lineAt(reader.line))
end

function reader.nextLine()
	reader.line = reader.line + 1
	if reader.line > lastIndex() then
		reader.say("Bottom", true)
		reader.line = lastIndex()
	else
		reader.stop()
	end
	reader.sayLine(lineAt(reader.line))
end

function reader.lastLine()
	reader.line = lastIndex()
	reader.stop()
	reader.sayLine(lineAt(reader.line))
end
