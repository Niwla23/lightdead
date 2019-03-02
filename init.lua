minetest.register_on_dieplayer(function(player)
    pos = player:get_pos()
    minetest.chat_send_all(player:get_player_name().." died.")
    local node = minetest.get_node(pos)

    
    pos.y = pos.y + 3
    for i = 200,1,-1 
    do 
        pos.y = pos.y + 1
        minetest.set_node(pos, {name="lightdead:light"})
            


    end

    minetest.after(120, function()
        for i = 200,1,-1 
        do 
            pos.y = pos.y - 1
            minetest.set_node(pos, {name="air"})
        end
    end)
    
end)

minetest.register_node("lightdead:light", {
        description = "LIGHT",
        drawtype = "plantlike",
        tiles = {"default_meselamp.png"},
        paramtype = "light",
        sunlight_propagates = true,
        light_source = minetest.LIGHT_MAX,
        walkable = false,
        pointable = false,
        diggable = false,
        buildable_to = true,
        floodable = false,
        drop = "",
        groups = {beacon_light = 1, not_in_creative_inventory = 1},
        damage_per_second = 1,
        on_blast = function() end,
        
    })