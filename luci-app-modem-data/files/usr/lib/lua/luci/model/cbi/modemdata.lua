require "nixio.fs"

mp = Map("modemdata")
mp.title = translate("USB Mobile Network Data Setting")
mp.description = translate("Tethering Mobile Network Data with your iPhone/Andriod/USB Mobile Stick like F50 ETC.")

s = mp:section(TypedSection, "service", translate("Settings"))
s.anonymous = true

enabled = s:option(Flag, "enabled", translate("Enable"))
enabled.default = 0
enabled.rmempty = false

ipv6 = s:option(Flag, "ipv6", translate("Enable IPv6 negotiation"))
ipv6.default = 0

ipv6relay = s:option(Flag, "ipv6relay", translate("Enable IPv6 Relay"))
ipv6relay.default = 1
ipv6relay:depends("ipv6", "1")

failover = s:option(Flag, "fallover", translate("Network Failover"))
failover.default = 0
failover.rmempty = true


device = s:option(Value, "device", translate("Data Network Interface"))
device.rmempty = true
device:value("auto", translate("Auto"))

local net = require "luci.model.network".init()
local ifaces = net:get_interfaces()

for _, iface in ipairs(ifaces) do
	device:value(iface:name())
end


if not nixio.fs.access("/etc/init.d/qmodem_init") then

ttyport = s:option(Value, "ttyport", translate("TTY USB AT Port"))
ttyport:value("/dev/ttyUSB0", translate("ttyUSB0 (Fibocom)"))
ttyport:value("/dev/ttyUSB1", translate("ttyUSB1 (TD Tech)"))
ttyport:value("/dev/ttyUSB2", translate("ttyUSB2 (Quectel 4G)"))
ttyport:value("/dev/ttyUSB3", translate("ttyUSB3 (Quectel 5G)"))
ttyport.default = "/dev/ttyUSB3"

attools = s:option(ListValue, "attools", translate("AT Query Tools"))
attools:value("0", translate("Default"))
attools:value("1", translate("SendAT"))
attools.default = "0"

dialtools = s:option(ListValue, "dialtools", translate("Dial Tools"))
if nixio.fs.access("/usr/bin/quectel-CM") then
dialtools:value("0", translate("Quectel CM"))
end
if nixio.fs.access("/usr/bin/fibocom-dial") then
dialtools:value("1", translate("Fibocom CM"))
end
if nixio.fs.access("/usr/bin/meig-cm") then
dialtools:value("2", translate("Megei CM"))
end
dialtools:value("3", translate("AT CMD"))
dialtools.default = "0"

custom = s:option(Flag, "custom", translate("Custom Settings"))
custom.default = 0
custom.rmempty = true

apn = s:option(Value, "apn", translate("APN"))
apn:depends("custom", "1")
apn:value("3gnet", translate("China Unicom"))
apn:value("cmnet", translate("China Mobile"))
apn:value("ctnet", translate("China Telecom"))
apn.rmempty = true

username = s:option(Value, "username", translate("PAP/CHAP username"))
username:depends("custom", "1")
username.rmempty = true

password = s:option(Value, "password", translate("PAP/CHAP password"))
password:depends("custom", "1")
password.rmempty = true

auth = s:option(Value, "auth", translate("Authentication Type"))
auth:depends("custom", "1")
auth:value("none", "NONE")
auth:value("both", "PAP/CHAP (both)")
auth:value("pap", "PAP")
auth:value("chap", "CHAP")
auth.rmempty = true

end

return mp
