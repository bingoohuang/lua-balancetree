package.path = "lualib/?.lua;balance-tree/*.lua;"

local treemap = require "treemap"
require "print_r"

local root = treemap.new()
for i = 1, 7000 do
    root:put(i, i)
end

print(root:lower_entry(335.1).value) -- 2
print(root:lower_entry(2.01).value) -- 2
print(root:lower_entry(1.5).value) -- 1
print(root:lower_entry(0.5)) -- nil
print(root:remove(2)) -- true
print(root:get(1)) -- table: 0x600000794180
print(root) -- table: 0x600000794140
print(root:first_entry().value) -- 1
print(root:last_entry().value) -- 7
print(root:lower_entry(2.5).value) -- 1
print(root:lower_entry(1.5).value) -- 1
print(root:lower_entry(0.5)) -- nil

--[[

for i = 1, 7 do
  treemap.put(root, i, i .. " ")
end

print_r(root)


print(treemap.get(root, 2))

print(treemap.higher_entry(root, 10) == nil)

print(treemap.lower_entry(root, 2).value)

print(treemap.first_entry(root).value)
print(treemap.last_entry(root).value)
--]]

--[[
function x()
  print(1000)
end

local meta_tbl = {}
print(meta_tbl)

function meta_tbl:__index(v)
  print(self, v)
  return x
end

local a = {}
print(a)

local s = setmetatable(a, meta_tbl)

print(s.put(10))
--]]
