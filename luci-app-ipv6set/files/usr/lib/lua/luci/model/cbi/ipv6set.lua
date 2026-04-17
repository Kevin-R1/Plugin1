local util = require("luci.util")
local dump = util.ubus("network.interface", "dump", {})

m = Map("ipv6set")
m.title	= translate("IPv6 Global Settings")
m.description = translate("One-key Setting IPv6")

s = m:section(TypedSection, "ipv6set", translate("IPv6 Global Settings"))
s.addremove = false
s.anonymous = true

o = s:option(ListValue, "mode", translate("IPv6 Mode"))
o:value("0", translate("Disable IPv6 NDP"))
o:value("1", translate("NDP Native Mode"))
o:value("2", translate("DHCPv6 Relay Mode"))
-- o:value("3", translate("NAT66 Mode"))
o.default = 1

o6 = s:option(ListValue, "wan6zone", translate("Upstream WAN6 Zone"))
o6.default = "wan6"
if dump then
	local i, v
	for i, v in ipairs(dump.interface) do
		if v.interface ~= "loopback" then
			o6:value(v.interface)
		end
	end
end
o6.rmempty = false

o = s:option(Flag, "v6dns", translate("Enable IPv6 DNS (AAAA) Lookup"))
o.default = 1
o.description = translate("IPv6 DNS (AAAA)")

-- o = s:option(Flag, "v6nat", translate("Enable IPv6 NAT66"))
-- o.default = 0
-- o.description = translate("IPv6-to-IPv6 Network Address Translation")

return m
