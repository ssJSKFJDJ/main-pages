-----------------------------------------------------------------------------
-- throw plugin.
-- 2022/06 by 简律纯
-----------------------------------------------------------------------------

down = string.match(msg.fromMsg,"反(.*)")
state = ranint(1,101)
up_word = ""
down_word = ""

if down ~= nil then
    up = string.match(msg.fromMsg,"正*(.-)[%p%s]*反*"..down)
    if up == nil then
        down_word = down
        up_word = down
    else
        down_word = "试试"..down
        up_word = "那就"..up
    end
elseif down == nil then
    up = string.match(msg.fromMsg,"正(.*)")
    if up ~= nil then
        up_word = up
        down_word = up
    end
end

if state <= 50 then
    return "{nick}抛出了一枚硬币:正面 "..up_word
elseif state <= 100 then
    return "{nick}抛出了一枚硬币:反面 "..down_word
else
    return "{nick}抛出了一枚硬币:直立！"
end