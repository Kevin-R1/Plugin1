module("luci.controller.floatip", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/floatip") then
		return
	end

	entry({"admin", "network", "floatip"}, cbi("floatip"), _("IP浮动网关"), 49).dependent = true

	entry({"admin", "network", "floatip_status"}, call("floatip_status"))
end

function floatip_status()
	local sys  = require "luci.sys"
	local uci  = require "luci.model.uci".cursor()

	local status = {
		running = not (sys.call("flock -sn /var/lock/floatip_loop.lock -c true >/dev/null 2>&1") == 0),
	}

	luci.http.prepare_content("application/json")
	luci.http.write_json(status)
end