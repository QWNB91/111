local TranslatorModule = {
    _enabled = false,
    _cache = {},
    _guiMap = {},
    _pending = {},
    _active = 0,
    _connections = {},
    _saveTimer = nil,
    _stats = {translated = 0, cached = 0},
    _services = {
        HttpService = game:GetService("HttpService"),
        Players = game:GetService("Players"),
        RunService = game:GetService("RunService")
    },
    _config = {
        targetLanguage = "zh-CN",
        maxTextLength = 1000,
        maxConcurrent = 15,
        rescanInterval = 2,
        saveInterval = 5,
        filePath = "WQ脚本/本地翻译.json"
    }
}

local _localPlayer = TranslatorModule._services.Players.LocalPlayer
local _playerGui = _localPlayer:WaitForChild("PlayerGui")
local _coreGui = game:GetService("CoreGui")

local _skip = {image = true, label = true, button = true, frame = true, textlabel = true, textbutton = true, textbox = true, scrollingframe = true, uilistlayout = true, uigridlayout = true, uipadding = true, uicorner = true, uistroke = true}

function TranslatorModule:Notification(title, text, duration)
end

function TranslatorModule:_isChinese(text)
    if not text or #text == 0 then return false end
    for i = 1, math.min(#text, 10) do
        local byte = text:byte(i)
        if byte and byte >= 199 then return true end
    end
    return false
end

function TranslatorModule:_decodeText(text)
    if type(text) ~= "string" then return text end
    text = text:gsub("\\u(%x%x%x%x)", function(hex)
        local success, char = pcall(function() return utf8.char(tonumber(hex, 16)) end)
        return success and char or ""
    end)
    text = text:gsub("\\n", "\n")
    text = text:gsub("\\t", "\t")
    text = text:gsub("\\\"", "\"")
    text = text:gsub("\\\\", "\\")
    text = text:gsub("&amp;", "&")
    text = text:gsub("&lt;", "<")
    text = text:gsub("&gt;", ">")
    text = text:gsub("&quot;", "\"")
    text = text:gsub("&#(%d+);", function(dec)
        local success, char = pcall(function() return utf8.char(tonumber(dec)) end)
        return success and char or ""
    end)
    text = text:gsub("&#[xX](%x+);", function(hex)
        local success, char = pcall(function() return utf8.char(tonumber(hex, 16)) end)
        return success and char or ""
    end)
    return text
end

function TranslatorModule:_shouldSkip(text)
    if not text or #text == 0 then return true end
    if self._cache[text] ~= nil then return true end
    local lower = text:lower()
    if _skip[lower] then 
        self._cache[text] = text
        return true 
    end
    if text:match("^%s*$") then 
        self._cache[text] = text 
        return true 
    end
    if #text > self._config.maxTextLength then 
        self._cache[text] = text 
        return true 
    end
    if self:_isChinese(text) then 
        self._cache[text] = text 
        return true 
    end
    return false
end

function TranslatorModule:_loadLocal()
    if not isfile(self._config.filePath) then return end
    local ok, content = pcall(readfile, self._config.filePath)
    if ok and content then
        local success, data = pcall(function()
            return self._services.HttpService:JSONDecode(content)
        end)
        if success and type(data) == "table" then
            for k, v in pairs(data) do
                if type(k) == "string" and type(v) == "string" and k ~= v then
                    self._cache[k] = v
                end
            end
        end
    end
end

function TranslatorModule:_doSave()
    local data = {}
    for k, v in pairs(self._cache) do
        if k ~= v and not self:_isChinese(k) then 
            data[k] = v 
        end
    end
    pcall(function()
        writefile(self._config.filePath, self._services.HttpService:JSONEncode(data))
    end)
end

function TranslatorModule:_save()
    if self._saveTimer then
        task.cancel(self._saveTimer)
    end
    self._saveTimer = task.delay(self._config.saveInterval, function()
        self:_doSave()
    end)
end

function TranslatorModule:_apply(gui, original, translated)
    if not gui or not gui.Parent then return false end
    pcall(function()
        if gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox") then
            if gui.Text == original then 
                gui.Text = translated 
                return true
            end
        elseif gui:IsA("BillboardGui") or gui:IsA("SurfaceGui") or gui:IsA("ScreenGui") then
            if gui.Name == original then 
                gui.Name = translated 
                return true
            end
        end
    end)
    return false
end

function TranslatorModule:_getText(gui)
    if not gui then return nil end
    local text = nil
    pcall(function()
        if gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox") then
            text = gui.Text
        elseif gui:IsA("ImageButton") or gui:IsA("ImageLabel") then
            text = gui:GetAttribute("Text") or gui:GetAttribute("Tooltip") or gui:GetAttribute("Label")
        else
            text = gui.Name
        end
    end)
    return text
end

function TranslatorModule:_watchGui(gui)
    if not gui or not gui.Parent then return end
    
    local conn1, conn2
    pcall(function()
        if gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox") then
            conn1 = gui:GetPropertyChangedSignal("Text"):Connect(function()
                if not self._enabled then return end
                task.defer(function()
                    self._guiMap[gui] = nil
                    self:_checkGui(gui)
                end)
            end)
        end
        conn2 = gui:GetPropertyChangedSignal("Parent"):Connect(function()
            if not self._enabled then return end
            if gui.Parent then
                task.defer(function()
                    self._guiMap[gui] = nil
                    self:_checkGui(gui)
                end)
            end
        end)
    end)
    
    if conn1 then table.insert(self._connections, conn1) end
    if conn2 then table.insert(self._connections, conn2) end
end

function TranslatorModule:_checkGui(gui, force)
    if not self._enabled then return end
    if not gui or not gui.Parent then return end
    
    if not (gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox") 
            or gui:IsA("ImageButton") or gui:IsA("ImageLabel")
            or gui:IsA("BillboardGui") or gui:IsA("SurfaceGui")) then
        return
    end
    
    local text = self:_getText(gui)
    if not text or text == "" then return end
    
    if not force and self._guiMap[gui] == text then return end
    
    if self._cache[text] and self._cache[text] ~= text then
        if self:_apply(gui, text, self._cache[text]) then
            self._guiMap[gui] = text
            self._stats.cached = self._stats.cached + 1
        end
        return
    end
    
    if not self:_shouldSkip(text) then
        self._pending[text] = self._pending[text] or {}
        table.insert(self._pending[text], gui)
        self:_translate(text)
    end
end

function TranslatorModule:_translate(text)
    if self._cache[text] ~= nil then return end
    
    while self._active >= self._config.maxConcurrent do
        task.wait(0.01)
    end
    
    self._active = self._active + 1
    self._cache[text] = false
    
    task.spawn(function()
        local result = text
        local encoded = self._services.HttpService:UrlEncode(text)
        local done = false
        
        task.spawn(function()
            local url = "https://clients5.google.com/translate_a/t?client=dict-chrome-ex&sl=auto&tl=" .. self._config.targetLanguage .. "&q=" .. encoded
            local ok, resp = pcall(game.HttpGet, game, url, true)
            if ok and resp and not done then
                local ok2, data = pcall(function()
                    return self._services.HttpService:JSONDecode(resp)
                end)
                if ok2 and data and type(data) == "table" and data[1] then
                    if type(data[1][1]) == "table" and data[1][1][1] then
                        result = self:_decodeText(data[1][1][1])
                        done = true
                    elseif data[1][1] then
                        result = self:_decodeText(data[1][1])
                        done = true
                    end
                end
            end
        end)
        
        task.spawn(function()
            task.wait(0.1)
            if done then return end
            local url = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=" .. self._config.targetLanguage .. "&dt=t&q=" .. encoded
            local ok, resp = pcall(game.HttpGet, game, url, true)
            if ok and resp and not done then
                local ok2, data = pcall(function()
                    return self._services.HttpService:JSONDecode(resp)
                end)
                if ok2 and data and data[1] and data[1][1] and data[1][1][1] then
                    result = self:_decodeText(data[1][1][1])
                    done = true
                end
            end
        end)
        
        task.spawn(function()
            task.wait(0.2)
            if done then return end
            local url = "https://api.mymemory.translated.net/get?q=" .. encoded .. "&langpair=auto|" .. self._config.targetLanguage
            local ok, resp = pcall(game.HttpGet, game, url, true)
            if ok and resp and not done then
                local ok2, data = pcall(function()
                    return self._services.HttpService:JSONDecode(resp)
                end)
                if ok2 and data and data.responseData and data.responseData.translatedText then
                    result = self:_decodeText(data.responseData.translatedText)
                    done = true
                end
            end
        end)
        
        local t = 0
        while not done and t < 60 do
            task.wait(0.05)
            t = t + 1
        end
        
        self._active = self._active - 1
        
        if result ~= text then
            self._cache[text] = result
            self._stats.translated = self._stats.translated + 1
            
            local guis = self._pending[text]
            if guis then
                for _, gui in ipairs(guis) do
                    if gui.Parent then
                        self:_apply(gui, text, result)
                        self._guiMap[gui] = text
                    end
                end
                self._pending[text] = nil
            end
            
            self:_save()
        else
            self._cache[text] = text
        end
    end)
end

function TranslatorModule:_deepScan()
    local all = {}
    
    pcall(function()
        for _, g in ipairs(_playerGui:GetDescendants()) do 
            table.insert(all, g) 
        end
    end)
    
    pcall(function()
        for _, g in ipairs(_coreGui:GetDescendants()) do 
            table.insert(all, g) 
        end
    end)
    
    pcall(function()
        for _, g in ipairs(workspace:GetDescendants()) do 
            if g:IsA("BillboardGui") or g:IsA("SurfaceGui") or g:IsA("ScreenGui") then 
                table.insert(all, g) 
                for _, child in ipairs(g:GetDescendants()) do
                    table.insert(all, child)
                end
            end
        end
    end)
    
    for i, gui in ipairs(all) do
        self:_checkGui(gui, true)
        if i % 20 == 0 then 
            task.wait() 
        end
    end
end

function TranslatorModule:_rescanLoop()
    while self._enabled do
        task.wait(self._config.rescanInterval)
        if not self._enabled then break end
        self:_deepScan()
    end
end

function TranslatorModule:enable()
    if self._enabled then return end
    self._enabled = true
    
    self:_loadLocal()
    
    task.spawn(function()
        self:_deepScan()
    end)
    
    task.spawn(function()
        self:_rescanLoop()
    end)
    
    local function onAdded(parent)
        local conn = parent.DescendantAdded:Connect(function(gui)
            if not self._enabled then return end
            task.defer(function()
                self:_checkGui(gui)
                self:_watchGui(gui)
                task.delay(0.3, function()
                    if gui.Parent then 
                        self:_checkGui(gui, true)
                    end
                end)
                task.delay(0.8, function()
                    if gui.Parent then 
                        self:_checkGui(gui, true)
                    end
                end)
            end)
        end)
        table.insert(self._connections, conn)
    end
    
    onAdded(_playerGui)
    onAdded(_coreGui)
    
    local wsConn = workspace.DescendantAdded:Connect(function(gui)
        if not self._enabled then return end
        if gui:IsA("BillboardGui") or gui:IsA("SurfaceGui") or gui:IsA("ScreenGui") then
            task.defer(function()
                self:_checkGui(gui)
                self:_watchGui(gui)
                for _, child in ipairs(gui:GetDescendants()) do
                    self:_checkGui(child)
                    self:_watchGui(child)
                end
                task.delay(0.5, function()
                    if gui.Parent then 
                        self:_checkGui(gui, true)
                        for _, child in ipairs(gui:GetDescendants()) do
                            self:_checkGui(child, true)
                        end
                    end
                end)
            end)
        end
    end)
    table.insert(self._connections, wsConn)
    
    pcall(function()
        for _, gui in ipairs(_playerGui:GetDescendants()) do
            self:_watchGui(gui)
        end
        for _, gui in ipairs(_coreGui:GetDescendants()) do
            self:_watchGui(gui)
        end
    end)
end

function TranslatorModule:disable()
    self._enabled = false
    for _, conn in ipairs(self._connections) do 
        pcall(function() conn:Disconnect() end) 
    end
    self._connections = {}
    if self._saveTimer then
        pcall(function() task.cancel(self._saveTimer) end)
    end
    self:_doSave()
end

function TranslatorModule:scanNow()
    if not self._enabled then
        self:_loadLocal()
    end
    self:_deepScan()
    local waitCount = 0
    while self._active > 0 and waitCount < 200 do
        task.wait(0.1)
        waitCount = waitCount + 1
    end
    if self._saveTimer then
        pcall(function() task.cancel(self._saveTimer) end)
    end
    self:_doSave()
    return self._stats.translated
end

function TranslatorModule:clearCache()
    if self._saveTimer then
        pcall(function() task.cancel(self._saveTimer) end)
    end
    self:_doSave()
    self._cache = {}
    self._guiMap = {}
    self._pending = {}
    self._stats = {translated = 0, cached = 0}
    pcall(function() 
        delfile(self._config.filePath) 
    end)
end

TranslatorModule:enable()