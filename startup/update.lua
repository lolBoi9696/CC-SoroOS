local updater = {}

local function downloadFiles(url, path)
	for i = 1, 3 do
	  local response = http.get(url)
	  if response then
	   local data = response.readAll()
	   if path then
			local f = io.open(path, "w")
			f:write(data)
			f:close()
	   end
	   return true
	  end
	end
	return false
end

function updater.checkForUpdates(updateUrl)
	for i = 1, 3 do
	  local response = http.get(updateUrl)
	  if response then
	   local data = response.readAll()
	   if data ~= currentVersion then
	   print("There's an update!!!")
	   sleep(1)
			if not fs.exists("/installer") then
				downloadFiles("https://raw.github.com/redstonefreak589/redos/master/installer", "/installer")
			end
			shell.run("../install.lua")
	   end
	  end
	end
end

function updater.installUpdate()
	shell.run("cd ../")
	print("installing update")
	shell.run("pastebin get qBQzfk4k git.lua")
	shell.run("git.lua lolBoi9696 CC-SoroOS / /startup master")
	term.clear()
	term.setCursorPos(1,1)
	print("Restarting in 3 seconds")
	sleep(1)
	print("Restarting in 2 seconds")
	sleep(1)
	print("Restarting in 1 second")
	sleep(1)
	shell.run("reboot")
end

return updater