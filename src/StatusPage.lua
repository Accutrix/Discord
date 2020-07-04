local Package = script.Parent

local Http = require(Package.Http)
local Formatter = require(Package.Formatter)

local StatusPage = { }

StatusPage.UrlFormat = "https://%s.statuspage.io/api/v2/summary.json"
StatusPage.__index = StatusPage


function StatusPage:GetData()
	local RawData = Http.Get(self.Url)
	RawData = Http.DecodeJson(RawData)
	local ForamttedData = Formatter.Format(RawData)
	return ForamttedData
end


function StatusPage.new(SubUrl)
	local CreatedStatusPage = setmetatable({ }, StatusPage)
	CreatedStatusPage.Url = string.format(CreatedStatusPage.UrlFormat, SubUrl)
	return CreatedStatusPage
end


return StatusPage
