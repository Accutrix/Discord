local Package = script.Parent

local Color3 = require(Package.Color3)

local Formatter = { }

Formatter.Data = {
	WebhookPostElements = {
		Content = "content";
		Username = "username";
		AvatarUrl = "avatar_url";
		Tts = "tts";
		Embeds = "embeds";
		PayloadJson = "payload_json";
	};
	
	EmbedElements = {
		Title = "title";
		Type = "type";
		Description = "description";
		Url = "url";
		Timestamp = "timestamp";
		Color = "color";
		Footer = "footer";
		Image = "image";
		Thumbnail = "thumbnail";
		Video = "video";
		Provider = "provider";
		Author = "author";
		Fields = "fields";
		ProxyUrl = "proxy_url";
		Height = "height";
		Width = "width";
		Name = "name";
		Text = "text";
		IconUrl = "icon_url";
		ProxyIconUrl = "proxy_icon_url";
		Value = "value";
		InLine = "inline";
		Id = "id";
		FileName = "filename";
		Size = "size";
		GuildId = "guild_id";
	};
	
	EmbedTypes = {
		Rich = "rich";
		Image = "image";
		Video = "video";
		Gifv = "gifv";
		Article = "article";
		Link = "link";
	};
	
	MentionTypes = {
		Roles = "roles";
		Users = "users";
		Everyone = "everyone";
	};
	
	StatusPageElements = {
		Page = "page";
		Components = "components";
		Id = "id";
		Name = "name";
		Url = "url";
		Timezone = "time_zone";
		CreatedAt = "created_at";
		UpdatedAt = "updated_at";
		Status = "status";
		Position = "position";
		Description = "description";
		Showcase = "showcase";
		GroupId = "group_id";
		PageId = "page_id";
		Group = "group";
		OnlyShowIfDegraded = "only_show_if_degraded";
		Indicator = "indicator";
	};
}


function Formatter.Format(Data)
	local FormattedData = { }
	for Name, Element in pairs(Data) do
		if typeof(Element) ~= "function" then
			for _, DataType in pairs(Formatter.Data) do
				if DataType[Name] then
					Name = DataType[Name]
				end
			end
			if typeof(Element) == "table" then
				Element = Formatter.Format(Element)
			elseif typeof(Element) == "Color3" then
				Element = Color3.toHexInt(Element)
			end
			FormattedData[Name] = Element
		end
	end
	return FormattedData
end


return Formatter
