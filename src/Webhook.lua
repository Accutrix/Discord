local Package = script.Parent

local Formatter = require(Package.Formatter)
local Http = require(Package.Http)

local Webhook = { }

Webhook.UrlFormat = "https://discordapp.com/api/webhooks/%s/%s"
Webhook.__index = Webhook


function Webhook:Post(PostData)
	local FormattedData = Formatter.Format(PostData)
	FormattedData = Http.EncodeJson(FormattedData)
	
	local Success, Response = Http.Post(self.Url, FormattedData, {
		["content-type"] = "application/json";
	})
	if Success then
		return Response
	end
end

function Webhook:GetData()
	local RawData = Http.Get(self.Url)
	RawData = Http.DecodeJson(RawData)
	local ForamttedData = Formatter.Format(RawData)
	return ForamttedData
end


function Webhook.fromUrl(WebhookUrl)
	local CreatedWebhook = setmetatable({ }, Webhook)
	CreatedWebhook.Url = WebhookUrl
	return CreatedWebhook
end

function Webhook.new(ClientId, Token)
	return Webhook.fromUrl(string.format(Webhook.UrlFormat, tostring(ClientId), Token))
end


return Webhook
