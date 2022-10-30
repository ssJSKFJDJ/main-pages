function rank_user(field,formater)
    datas = getUserConf(nil,field)
    rank = {}
    for id,val in pairs(datas) do
        idx=1
        for i,data in ipairs(rank) do
            idx = i
            if data.val<=val or i>10 then
                break
            end
        end
        if idx<=10 then table.insert(rank,idx,{id=id,val=val}) end
    end
    res = {}
    for idx,data in ipairs(rank) do
        if idx>10 and data.val<rank[10].val then
            break
        end
        table.insert(res,string.format(formater, data.val).."~"..getUserConf(data.id,"nick"))
    end
    return table.concat(res,"\n")
end