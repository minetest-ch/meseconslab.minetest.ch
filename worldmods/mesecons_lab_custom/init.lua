
local last_mtime = mapsync.last_mapchange

-- restart if last player leaves and the world was changed
-- TODO: account for "inbound"/pre-auth players
minetest.register_on_leaveplayer(function()
    if #minetest.get_connected_players() == 1 and last_mtime ~= mapsync.last_mapchange then
        minetest.request_shutdown("map reset", true)
    end
end)

-- emerge spawn area
minetest.register_on_mods_loaded(function()
    minetest.after(0, function()
        mapsync.emerge_chunk({x=0, y=0, z=0})
    end)
end)


-- https://github.com/minetest/minetest/pull/9350
-- Workaround for bug https://www.lua.org/bugs.html#5.2.3-1
-- thx HybridDog ;)
local actual_unpack = unpack
function unpack(t, a, b)
	assert(not b or b < 2^30)
	return actual_unpack(t, a, b)
end