module("luci.controller.ipv6set", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/ipv6set") then
		return
	end

	entry({"admin", "network", "ipv6set"}, cbi("ipv6set"), _("IPv6 Settings"), 100).dependent = true
end


