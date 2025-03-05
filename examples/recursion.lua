local function recursion(i)
    if i == 0 then
        return
    end
    print(i)
    recursion(i - 1)
end

recursion(5)