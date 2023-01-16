-- restart if last player leaves
-- TODO: account for "inbound"/pre-auth players
minetest.register_on_leaveplayer(function()
    if #minetest.get_connected_players() == 1 then
        minetest.request_shutdown("map reset", true)
    end
end)