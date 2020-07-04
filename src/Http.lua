local HttpService = game:GetService("HttpService")

local Http = { }


function Request(Method, Url, Headers, Body)
--	print('request - ' .. Url .. ' - ' .. Body)
	return HttpService:RequestAsync({
		Url = Url;
		Method = Method;
		Body = Body;
		Headers = Headers;
	})
end


function Http.Get(Url, Body, Headers)
	local HttpResponse = Request("GET", Url, Headers, Body)
	return HttpResponse.Success, HttpResponse.Body
end

function Http.Post(Url, Body, Headers)
	local HttpResponse = Request("POST", Url, Headers, Body)
	return HttpResponse.Success, HttpResponse.Body
end


function Http.EncodeJson(Table)
	return HttpService:JSONEncode(Table)
end

function Http.DecodeJson(Json)
	return HttpService:JSONDecode(Json)
end


return setmetatable(Http, {
	__call = function(self, ...)
		return Request(...)
	end;
})
