local file = io.open( "Input.txt", "r" )
local en = "Input.txt"
local cd = file:read( "*all" )

local encoded = cd:gsub(".", function(bb) return "\\" .. bb:byte() end) or cd .. "\""

function ecall(...)
    local arg = {pcall(...)}
    if not arg[1] and arg[2] then
        return print("Error:" .. tostring(arg[2]))
    end
    table.remove(arg, 1)
    return unpack(arg)
end


local var_out = ecall(io.open, en, "w")
var_out:write("loadstring('"..encoded.."')")
