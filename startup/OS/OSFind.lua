local osFinder = {}

function osFinder.lookForOSInFolder(path)
	local FileList = fs.list(path) 
	for _, file in ipairs(FileList) do
		print(file)
		shell.run(file)
		return 1
	end
	return 0
end

return osFinder