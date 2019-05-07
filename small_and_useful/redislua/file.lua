local cjson = require "cjson";

local file = io.open("/usr/local/openresty/nginx/redislua/config.json", "r");
local content = cjson.decode(file:read("*all"));
file:close();

for name, value in pairs(content) do
    print(name)
    print(value)
end
