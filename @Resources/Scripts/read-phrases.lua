local phrases = {}

function Initialize()
	local filePath = SKIN:MakePathAbsolute('@Resources\\Text\\phrases.txt')

	local file = io.open(filePath, 'r')

	if not file then
		SKIN:Bang('!Log', 'Unable to open file for read at .. filePat')
		return
	end

	for line in file:lines() do
		table.insert(phrases, line)
	end

	file:close()
end

function Update()
	if #phrases == 0 then
		SKIN:Bang('!Log', 'Undefined phrases')
		SKIN:Bang('!SetOption', 'MeterPhrase', 'Text', 'Undefined phrases')
		return
	end

	local randomIndex = math.random(#phrases)
	local phrase = phrases[randomIndex]
	SKIN:Bang('!SetOption', 'MeterPhrase', 'Text', phrase)
end