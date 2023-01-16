-- restart if last player leaves
-- TODO: account for "inbound"/pre-auth players
minetest.register_on_leaveplayer(function()
    if #minetest.get_connected_players() == 1 then
        minetest.request_shutdown("map reset", true)
    end
end)

-- emerge spawn area
minetest.register_on_mods_loaded(function()
    minetest.after(0, function()
        minetest.emerge_area({
            x = -50,
            y = -50,
            z = -50
        },{
            x = 50,
            y = 50,
            z = 50
        })
    end)
end)