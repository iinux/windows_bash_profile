local cjson = require "cjson";

local config = ngx.shared.config;

local file = io.open("/usr/local/openresty/nginx/redislua/config.json", "r");
local content = cjson.decode(file:read("*all"));
file:close();

for name, value in pairs(content) do
    config:set(name, value);
end
--config:set("host", "127.0.0.1");
--config:set("port", "6379");
