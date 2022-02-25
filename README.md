# lua balance tree with lower_entry

balancetree.lua was a self-balancing Binary Search Tree implement.

1. fork from https://github.com/lalawue/balance-tree.lua
2. search api `lower_entry` added.

## lower_entry usage

```lua
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
```

## Basic Usage

```lua

local tree = require("balancetree").new(function(a, b)
    return a - b
end)

-- insert
tree:insert(666, 6)
tree:insert(555, 5)

-- replace 5 to 55
tree:insert(555, 55, tree)

-- find, got 6
local a1 = tree:find(666)

-- remove, got 55
local a2 = tree:remove(555)

print("tree count: " .. tree:count())

-- minimal key, value
local minkey, minvalue = tree:first()

-- maximal key, value
local maxkey, maxvalue = tree:last()

-- loop from first to last
local n = tree:first()
while n ~= nil do
    n = tree:next(n)
end

-- loop from last to first
local p = tree:last()
while p ~= nil do
    p = tree:prev(p)
end

-- walk from first to last
for k, v in tree:walk() do
    print(k, v)
end

-- walk from last to first
for k, v in tree:walk(false) do
    print(k, v)
end

-- range 2 to 3
for i, k in ipairs(tree:range(2, 3)) do
    print(i, k)
end

-- range 5 to 3
for i, k in ipairs(tree:range(5, 3)) do
    print(i, k)
end
```

# Performance

3.29 GHz Intel Core i5 GHz Intel Core i5

```
14) test performance, every round 1,000,000, then clear
round 1: 0.990936s, avg: 0.990936s
round 2: 0.986641s, avg: 0.9887885s
round 3: 0.988772s, avg: 0.988783s
round 4: 0.994742s, avg: 0.99027275s
round 5: 0.989145s, avg: 0.9900472s
```
