----------------------------------
-- @简律纯 2022年9月6日
----------------------------------

write_file = function(path, text, mode)
    file = io.open(path, mode)
    file.write(file, text)
    io.close(file)
end

read_file = function(path, mode)
    local text = ""
    local file = io.open(path, mode)
    if (file ~= nil) then
        text = file.read(file, "*a")
        io.close(file)
    else
        return "没有该文件或文件内容为空哦"
    end
    return text
end

ToStringEx = function(value)
    if type(value) == "table" then
        return table.list(value)
    elseif type(value) == "string" then
        return "'" .. value .. "'"
    else
        return tostring(value)
    end
end

table.list = function(t)
    if t == nil then
        return ""
    end
    local retstr = "{"

    local i = 1
    for key, value in pairs(t) do
        local signal = ","
        if i == 1 then
            signal = ""
        end

        if key == i then
            retstr = retstr .. signal .. ToStringEx(value)
        else
            if type(key) == "number" or type(key) == "string" then
                retstr = retstr .. signal .. "[" .. ToStringEx(key) .. "]=" .. ToStringEx(value)
            else
                if type(key) == "userdata" then
                    retstr =
                        retstr .. signal .. "*s" .. TableToStr(getmetatable(key)) .. "*e" .. "=" .. ToStringEx(value)
                else
                    retstr = retstr .. signal .. key .. "=" .. ToStringEx(value)
                end
            end
        end

        i = i + 1
    end

    retstr = retstr .. "}"
    return retstr
end

string.split = function(str, split_char)
    local str_tab = {}
    while (true) do
        local findstart, findend = string.find(str, split_char, 1, true)
        if not (findstart and findend) then
            str_tab[#str_tab + 1] = str
            break
        end
        local sub_str = string.sub(str, 1, findstart - 1)
        str_tab[#str_tab + 1] = sub_str
        str = string.sub(str, findend + 1, #str)
    end

    return str_tab
end

getFileList = function(path, exp)
    local a = io.popen("dir " .. path .. exp .. " /b")
    local fileTable = {}
    local str = ""

    if a == nil then
    else
        for l in a:lines() do
            table.insert(fileTable, l)
        end

        for i = 1, #fileTable do
            str = fileTable[i] .. "\n" .. str
        end

        return fileTable
    end
end