package.path = "avl/?.lua;"

local AVL = require "avl"


--local root=AVL:new{1,10,5,15,20,3,5,14,7,13,2,8,3,4,5,10,9,8,7}

--root:dump()
--print("\ninsert 17:")
--root=root:insert(17)
--root:dump()
--print("\ndelete 10:")
--root=root:delete(10)
--root:dump()
--print("\nlist:")
--print(unpack(root:toList()))

local root=AVL:new{}

for i = 10, 36 do
    root = root:insert(i, i+1)
end

root:dump()

print(root:lower(100, true)) -- 36
print(root:lower(36.1)) -- 36
print(root:lower(35.6)) -- 35
print(root:lower(10.6)) -- 10
print(root:lower(16)) -- 16
print(root:lower(1,true)) -- nil
