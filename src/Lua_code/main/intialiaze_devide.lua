local function quequal(list)   --初始地平均化元素个数
    local flag = false
    while flag == false do
        local count = 0
        for i = 1, #list-1, 1 do
            if math.abs(#list[i]-#list[i+1])>=2 --[==[or (#list[i+1] == 0)]==] then  --检查元素个数差异
                if #list[i]<#list[i+1] then
                    table.insert(list[i],table.remove(list[i+1],1))
                    count=count+1
                else
                    table.insert(list[i+1],table.remove(list[i],1))
                    count=count+1
                end
            end
            if count == 0 then --判断是否足够平均（事实上只有特别特殊的初值这种写法才有效（我好菜（悲TAT
                flag = true
            end
        end
    end
    return list
end

local function predevideque(quelist,daysreq)   --进行初步分配
    local evernumber = math.floor(#quelist/daysreq)+1 --每天任务数
    local dayque = {}
    for i = 1, daysreq, 1 do
        dayque[i] = {}
    end
    --↑给出组的总数
    local dei = 1
    repeat
        local ldede = 1
        repeat
            dayque[dei][ldede]=table.remove(quelist,1)
            ldede = ldede + 1
        until ldede > evernumber
        dei = dei +1
    until #quelist == 0
    --↑初步任务分配
    return quequal(dayque)
end

for key, value in pairs(predevideque({1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18},10)) do --测试用语句
    for ke, valu in pairs(value) do
        print(valu)
    end
    print("\n")
end