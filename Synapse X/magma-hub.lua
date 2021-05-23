if not syn or not syn.request then
    getgenv().syn = {}
    syn.request = http_request or request or (http and http.request)
end

-- ^^^^^ Credits to an anonymous person for this (they didn't want their name on the crack)

getgenv().key = "CrackedByHyperNite"
getgenv().id = "ok123"

local MagmaReturn = [[
    {"Message":"Authentication Success","Key":"%s","Random":"%s","Hwid":"hyperOnTop","DiscordId":"%s"}
]]

local getRandom = function(url)
	return string.split(url, "random=")[2]
end

local SynReq;
SynReq = hookfunction(syn.request, function(T)
	if T.Url then
		if T.Url:find("magma") then
            print("Spoofed whitelist check")
			local new = {}
			new.Body = string.format(MagmaReturn, getgenv().key, getRandom(T.Url), getgenv().id)
			return new
		end
		if T.Url:find("httpbin") then
            print("Spoofed info from httpbin")
			T.Url = "https://hypernite.xyz/Backup/MagmaHub/httpbin_backup"
		end
		if T.Url:find("webhook") then
            print("No logging here buddy")
			local new = {}
			new.Body = "Hehe Fuck Youuuuu..."
			return new
		end
	end
	return SynReq(T)
end)

spawn(function()
    repeat wait() until game.CoreGui:FindFirstChild("Library") and game.CoreGui:FindFirstChild("Library"):FindFirstChild("MainFrame")
    game.CoreGui:FindFirstChild("Library"):FindFirstChild("MainFrame"):FindFirstChild("LeftFrame").GameTitle.Text = "Cracked by HyperNite"
    game.CoreGui:FindFirstChild("Library"):FindFirstChild("MainFrame"):FindFirstChild("LeftFrame").GameTitle.TextSize = 13

    -- Stole this from some wiki lol
    local r = { 
        Color3.fromRGB(254, 0, 0);  
        Color3.fromRGB(255, 127, 0); 
        Color3.fromRGB(255, 221, 1); 
        Color3.fromRGB(0, 200, 0);  
        Color3.fromRGB(0, 160, 199); 
        Color3.fromRGB(0, 55, 230);  
        Color3.fromRGB(129, 16, 210)} 
       local info = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
       game.CoreGui:FindFirstChild("Library"):FindFirstChild("MainFrame"):FindFirstChild("LeftFrame").GameTitle.TextColor3 = r[1] 
       i = 1
       while true do
       local tween = game:GetService("TweenService"):Create(game.CoreGui:FindFirstChild("Library"):FindFirstChild("MainFrame"):FindFirstChild("LeftFrame").GameTitle, info, {
        TextColor3 = r[i]}) 
       tween:Play()
       repeat wait() until tween.Completed
       wait(0.1)
       if i == #r then i = 1 else i = i + 1 end
       end
end)

loadstring(game:HttpGet("https://hypernite.xyz/Backup/MagmaHub/host_backup.lua"))()
