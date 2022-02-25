package.path = "lualib/?.lua;balancetree/?.lua;"

local btree = require "balancetree"

local root = btree.new(function(a, b)
    return a - b
end)

for i = 10, 36 do
    root:insert(i, i)
end

print(root:lower_entry(100)) -- 36
print(root:lower_entry(36.1)) -- 36
print(root:lower_entry(35.6)) -- 35
print(root:lower_entry(10.6)) -- 10
print(root:lower_entry(16)) -- 16
print(root:lower_entry(1)) -- nil
