-----------------------------------------------------------------------------
-- 不同时间段不同回复模板
-- by baigugu
-- version：v1.0.2
-----------------------------------------------------------------------------

function time_reply_main(reply_list)
    local hour=tonumber (os.date('%H'))
    for i, v in ipairs(time_config) do
        if (v[1]<= hour and v[2]>= hour) then
            if reply_list[i]==nil then
                return ""
            end
            return table_draw(reply_list[i])
        end
    end
end

function table_draw(tab)
    return tab[ranint(1,#tab)]
end

--设置时间段，对应着回复列表
time_config={
    {0,4},
    {5,11},
    {12,13},
    {14,18},
    {19,23}
}

--回复列表对应全局设置的时间
list_morning={
    {
        '凌晨呢',
        '早...'
    },
    {
        '早安',
        '早上好哦'
    },
    {
        '午好！',
        '中午好'
    },
    {
        '下午好~'
    },
    {
        '晚上好呀{nick}',
        '晚好~'
    }
}

return time_reply_main(list_morning)