local OSFind = require("OS/OSFind")

local notFound = OSFind.lookForOSInFolder("/boot")

if notFound == 1 then
	while true do
		term.clear()
		term.setCursorPos(1,1)
		term.write("test")
		sleep(0.05)
	end
end
