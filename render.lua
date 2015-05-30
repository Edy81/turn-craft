require 'input'

function draw_left_side_wall_in()
  -- left side wall
  -- /
  lg.setColor(C_WHITE)
  lg.polygon('fill',w/3,h/2+96 , w/2-64,h/2+64, w/2-64,h/2-64, w/3,h/2-96)
end

function draw_left_side_wall()
  --left wall visible inside a room or if a building is next to it
  lg.setColor(C_WHITE)
  lg.polygon('fill',1,1 , w/2-192,h/2-96, w/2-192,h/2+96, 1,h-96)
end

function draw_front_left_wall()
  lg.setColor(C_WHITE)
  lg.rectangle('fill',1,h/2-96,w/3,192)
end

function draw_front_wall()
  lg.setColor(C_WHITE)
  -- front wall
  lg.rectangle('fill',w/2-192,h/2-96,384,192)
end

function draw_right_side_wall_in()
  lg.setColor(C_WHITE)
  lg.polygon('fill',w-w/3,h/2-96 , w/2+64,h/2-64, w/2+64,h/2+64, w-w/3,h/2+96 )
end

function draw_front_right_wall()
  lg.setColor(C_WHITE)
  lg.rectangle('fill',w-w/3,h/2-96,w/3,192)
end

function draw_right_side_wall()
  --right side wall
  lg.setColor(C_WHITE)
  lg.polygon('fill',w,1 , w/2+192,204, w/2+192,396, w,h-96 ) 
end

function draw_npc()
  -- hair
  -- lg.setColor(C_GREEN)
  -- lg.rectangle("fill",1,h/2,w,h/2)
  -- hair
  lg.setColor(C_BLACK)
  lg.rectangle("fill",w/2-32,h/2-32,64,32)
  -- face
  lg.setColor(C_GRAY)
  lg.rectangle("fill",w/2-32,h/2+12,48,48)
  -- body
  lg.setColor(C_BLACK)
  lg.rectangle('line',w/2-24,h/2+52,72,72)
  -- arms
  lg.rectangle('line',w/2-32,h/2+56,8,64)  -- left arm
  lg.rectangle('line',w/2+48,h/2+56,8,64)  -- right arm
  -- legs
  lg.rectangle('line',w/2-16,h/2+128,24,72)  -- left leg
  lg.rectangle('line',w/2+16,h/2+128,24,72)  -- right leg
end

function draw_sc()
  -- map codes
  -- 0 sea
  local S = p.start
  draw_land()
  
  --if p.heading == 0 then -- if player looking north
    --north
    if p.heading == 'n' then
      if map[S-11] ~= nil then
        if map[S-11] > 1 and map[S-11] < 8 then --and p.c == 0 then 
          draw_left_side_wall_in()
        end
      end
     --east
    elseif p.heading == 'e' then
      if map[S-9] ~= nil then
        if map[S-9] > 1 and map[S-9] < 8 then
          draw_left_side_wall_in()
        end
      end
    --south
    elseif p.heading == 's' then
      if map[S+11] ~= nil then
        if map[S+11] > 1 and map[S+11] < 8 then 
          draw_left_side_wall_in()
        end
      end
    --west
    elseif p.heading == 'w' then
     elseif map[S+9] ~= nil then
     if map[S+9] > 1 and map[S+9] < 8 then 
       draw_left_side_wall_in()
     end
    end
   --end
   
    --north
    if p.heading == 'n' then
      if map[S] == 3 or map[S] == 4 or map[S-1] ~= 1 or map[S-1] > 1 and map[S-1] < 8 then
       draw_left_side_wall()
      end
    --east
    elseif p.heading == 'e' then
      if map[S] == 3 or map[S] == 4 or map[S-10] ~= 1 and map[S-10] > 1 and map[S-10] < 8 then
       draw_left_side_wall()
      end
    --south
    elseif p.heading == 's' then
      if map[S] == 2 or map[S] == 3 or map[S+1] > 1 and map[S+1] < 8 then
       draw_left_side_wall()
      end
    --west
    elseif p.heading == 'w' then
      if map[S] == 2 or map[S] == 3 or map[S+10] > 1 and map[S+10] < 8 then
       draw_left_side_wall()
       end
     end
     
     -- front wall left side of screen
     -- north
     -- -11-10-9
     -- -1  00 1
     -- 9   10 11 
    if p.heading == 'n' then
    --if map[S-10] == 2 or map[S-10] == 3 or
     if map[S] == 3 or map[S] == 4 or map[S-11] > 1 and map[S-11] < 8 then 
     --map[S-1] == 2 or map[S-1] == 3 or map[S-11] == 2 and map[S-11] == 3 then
     draw_front_left_wall()
     end
     -- east
    elseif p.heading == 'e' then
    if map[S] == 3 or map[S] == 4 or map[S-9] > 1 and map[S-9] < 8 then 
       draw_front_left_wall()
     end
     -- south
     elseif p.heading == 's' then
     if map[S] == 3 or map[S] == 4 or map[S+11] > 1 and map[S+11] < 8 then 
       draw_front_left_wall()      
     end
     -- west
     elseif p.heading == 'w' then
     if map[S] == 3 or map[S] == 4 or map[S+9] > 1 and map[S+9] < 8 then 
       draw_front_left_wall()
      end
    end
     
     -- noth
     if p.heading == 'n' then
       if --[[map[S-9] == 2 or map[S-11] == 3 or map[S-1] == 2 or map[S-1] == 3  or--]] map[S] == 2 or map[S] == 3 or map[S-10] > 1 and map[S-10] < 8 then
        draw_front_wall()
       end
     -- east
   elseif p.heading == 'e' then
     if map[S] == 2 or map[S] == 3 or map[S+1] > 1 and map[S+1] < 8 then
        draw_front_wall()
      end
     -- south
    elseif p.heading == 's' then
      if map[S] == 2 or map[S] == 3 or map[S+10] > 1 and map[S+10] < 8 then
        draw_front_wall()
      end
     -- west
    elseif p.heading == 'w' then
      if map[S] == 3 or map[S] == 4 or map[S-1] > 1 and map[S-1] < 8 then
        draw_front_wall()
      end
    end
      
      -- front wall right side of screen
    --  if -- not (map[S] > 9 and map[S] < 20) or
    --  map[S] ~= 1 or map[S] > 3 and map[S] < 7 or map[S+1] > 3 and map[S+1] <= 7 
      --(map[S-9] > 9 and map[S-9] < 20) or 
      --map[S-9] ~= 1 or 
      
      --north
    if p.heading == 'n' then
      if map [S-9] ~= nil then
        if map[S-9] > 1 and map[S-9] < 8 then
           draw_front_right_wall()
        end
      end
      --east
    elseif p.heading == 'e' then
    if map [S+11] ~= nil then
      if map[S+11] > 1 and map[S+11] < 8 then
           draw_front_right_wall()
      end
    end
      --south
    elseif p.heading == 's' then
      if map [S+9] ~= nil then
        if map[S+9] > 1 and map[S+9] < 8 then
           draw_front_right_wall()
        end
      end
      --west
    elseif p.heading == 'w' then
      if map [S-11] ~= nil then
        if map[S-11] > 1 and map[S-11] < 7 then
           draw_front_right_wall()
        end
      end
    end

    
    -- right side wall
    --north
    if p.heading == 'n' then
      if map[S] == 3 or map[S] == 4 or map[S+1] > 1 and map[S+1] < 8 then 
        draw_right_side_wall()
      end
    --east
    elseif p.heading == 'e' then
      if map[S] == 3 or map[S] == 4 or map[S+10] > 1 and map[S+10] < 8 then 
        draw_right_side_wall()
      end
    --south
    elseif p.heading == 's' then
      if map[S] == 3 or map[S] == 4 or map[S-1] > 1 and map[S-1] < 8 then 
        draw_right_side_wall()
      end
    --west
    elseif p.heading == 'w' then
      if map[S] == 3 or map[S] == 4 or map[S-10] > 1 and map[S-10] < 8 then 
        draw_right_side_wall()
      end
    end
    
    --noth
    if p.heading == 'n' then
      if map[S-9] ~= nil then
        -- map[S-10] == 1 or map[S-10] >9 and map[S-10] < 20
        if map[S-9] > 1 and map[S-9] <8 then
          draw_right_side_wall_in()
        end
      end
    --east
   elseif p.heading == 'e' then
      if map[S+11] ~= nil then
        if map[S+11] > 1 and map[S+11] <8 then
          draw_right_side_wall_in()
        end
      end
    --south
   elseif p.heading == 's' then
      if map[S+9] ~= nil then
        if map[S+9] > 1 and map[S+9] <8 then
          draw_right_side_wall_in()
        end
      end
    --noth
   elseif p.heading == 'w' then
      if map[S-11] ~= nil then
        if map[S-11] > 1 and map[S-11] <8 then
          draw_right_side_wall_in()
        end
      end
    end  -- end of north
     

     --outside
     
     -- npc
     if map[S] == 8 then
      draw_npc()
    end
     
     -- sticks
     if objects.c[S] ~= nil then
       
       if map [S] == 11 then 
         lg.setColor(C_BROWN)
         lg.polygon('fill' , w/2-64, h/2+192 , w/2+64, h/2+192, w/2+64, h/2+184, w/2-64, h/2+184)
         lg.setColor(C_BLACK)
         lgp( tostring( objects.c[S] )..'x' , w/2-64, h/2+156)
       
       --lg.polygon('line',w/2-16,h/2+128, w/2+16,h/2+64, w/2+16,h/2, w/2-8,h/2+64)
         objects.x = w/2-64
         objects.y = h/2+192
         objects.w = 128
         objects.h = 64
       end  -- end of painting sticks
    end
    --draw stone code
    if map[S] == 12 then
      lg.setColor(C_GRAY)
      lg.rectangle("fill",w/2-16,h/2+128,32,32)
      lg.setColor(C_BLACK)
      lgp( tostring( objects.c[S] )..'x' , w/2-64, h/2+156)
      -- draw hud icon
      lg.setColor(0,0,0,64)
      lg.rectangle('fill',w/2+32,h/2+32,64,64)
    end -- end of painting stones
    
    --leaves
    if map[S] == 13 then
      lg.setColor(C_BLACK)
      lg.polygon('line',w/2-64,h/2+64,w/2-72,h/2+72,w/2-96,h/2+96,w/2+64,h/2+96)
    end
    
    --grass
    if map[S] == 14 then
      lg.setColor(C_BLACK)
      --if objects.c[S] ~= 0 then
        local I = 0
        repeat
         -- if I < objects.c[S] then
          --  I=I+1
          --end
          
          lg.rectangle('line',w/2-16*I,h/2+128,8,16)
          --lg.setColor(C_GREEN)
          --lg.rectangle('fill',w/2-14*I,h/2+128,6,14)
          if I < objects.c[S] then
          I=I+1
          end
        until I == objects.c[S]
      --end
    end
    
     -- draw a building from 2 blocks away
    if map [S-20] ~= nil then    -- this is to prevent errors
     if map [S-20]>= 3 and map[S-20] <= 7 then
       lg.setColor(C_WHITE)
       lg.rectangle('fill',w/2-128,h/2-64,192,128)
     end
    end

    --- a door will be drawn if there is a building with a entry
     -- if map [S-c_i_mod[p.heading]] ~= nil then    -- this is to prevent errors
        if map[S] == 3 then
          if map[S-1] == 1 or map[S-1] > 9 and
          map[S-1] < 20 then
          lg.setColor(C_BLACK)
          lg.rectangle('line',w/2-32,h/2-32,64,128)           
          end
         elseif map[S-1] == 3 then
          lg.setColor(C_BLACK)
          lg.rectangle('line',w/2-32,h/2-32,64,128)
        end             
   -- end
    
    
     -- a door will be drawn if the door block is 2 clocks away
     if map [S-20] ~= nil then    -- this is to prevent errors
       if map[S-20] == 3 then
         lg.setColor(C_BLACK)
         lg.rectangle('line',w/2-16,h/2-16,32,64)
        end
      end
     
     -- left
    -- if map[S-10] == 3 then

      -- lg.setColor(C_BLACK)
      -- lg.polygon('line',w/2-192,h/2-32,w/2-256,h/2-64,w/2-256,h/2+116, w/2-192, h/2+96)
       
       -- if left side wall has a door it will be drawned  
      --north
      if p.heading == 'n' then
        if map[S] == 5 or map[S] == 7 then
          lg.setColor(C_WHITE)
          lg.polygon('line',w/2-192-64,h/2-32,w/2-256-128,h/2-64,w/2-256-128,h/2+116+40, w/2-192-64, h/2+96+16)
        end 
      --east
    elseif p.heading == 'e' then
        if map[S] == 5 or map[S] == 7 then
          lg.setColor(C_WHITE)
          lg.polygon('line',w/2-192-64,h/2-32,w/2-256-128,h/2-64,w/2-256-128,h/2+116+40, w/2-192-64, h/2+96+16)
        end
      --east
    elseif p.heading == 's' then
        if map[S] == 5 or map[S] == 7 then
          lg.setColor(C_WHITE)
          lg.polygon('line',w/2-192-64,h/2-32,w/2-256-128,h/2-64,w/2-256-128,h/2+116+40, w/2-192-64, h/2+96+16)
        end
      --east
    elseif p.heading == 'w' then
        if map[S] == 5 or map[S] == 7 then
          lg.setColor(C_WHITE)
          lg.polygon('line',w/2-192-64,h/2-32,w/2-256-128,h/2-64,w/2-256-128,h/2+116+40, w/2-192-64, h/2+96+16)
        end
      end
      
      --north
    if p.heading == 'n' then      
      -- if right side wall has a door it will be drawned  
      if map[S] == 5 or map[S] == 7 then
        lg.setColor(C_WHITE)
        lg.polygon('line',w/2+192+64,h/2-32,w/2+256+128,h/2-64,w/2+256+128,h/2+116+40, w/2+192+64, h/2+96+16)
       end
      --east
    elseif p.heading == 'e' then
      if map[S] == 5 or map[S] == 7 then
        lg.setColor(C_WHITE)
        lg.polygon('line',w/2+192+64,h/2-32,w/2+256+128,h/2-64,w/2+256+128,h/2+116+40, w/2+192+64, h/2+96+16)
       end
       --south
    elseif p.heading == 's' then        
      if map[S] == 5 or map[S] == 7 then
        lg.setColor(C_WHITE)
        lg.polygon('line',w/2+192+64,h/2-32,w/2+256+128,h/2-64,w/2+256+128,h/2+116+40, w/2+192+64, h/2+96+16)
       end
      --east
    elseif p.heading == 'w' then
      if map[S] == 5 or map[S] == 7 then
        lg.setColor(C_WHITE)
        lg.polygon('line',w/2+192+64,h/2-32,w/2+256+128,h/2-64,w/2+256+128,h/2+116+40, w/2+192+64, h/2+96+16)
       end
    end
      -- lg.polygon('fill',64,64 , w/2-386,h/2-32, w/2-386,h/2+96, 64,500-64)
end 

function gui()
  -- gui interactive buttons
  lg.setColor(C_GRAY)
  lg.polygon('line',0,h, w,h, w,h-96, w,h-96, w-192,h-96, w-128,h-64 , 0,h-64)
  lg.setColor(C_BLACK)
  lg.polygon('fill',0,h, w-2,h, w-2,h, w,h-94, w-192,h-94, w-128,h-62 , 0,h-62)
  --lg.rectangle('fill',1,h-96,w,h-96)
  lg.setColor(C_WHITE)
  --lgp(p.start,w/2,h-32)
  lg.rectangle('line',w-192,h-96,32,32)
  lgp('U',w-192+8,h-96+8)
  lg.rectangle('line',w-192,h-48,32,32)
  lgp('D',w-192+8,h-48+8)
  lg.rectangle('line',w-234,h-72,32,32)
  lgp('L',w-234+8,h-72+8)
  lg.rectangle('line',w-148,h-72,32,32)
  lgp('R',w-148+8,h-72+8)
  
  -- Inventory
  if inv.toogle == true then
    draw_inv_items()
  end
  
  menu_gui()
end  
  --[[local xa = w/2-192
  local ya = h/2+128
  local xb = w/2-128
  local yb = h/2+64
  local xc = w/2-256
  local yc = h/2+64
  local xd = w/2-378
  local yd = h/2+128
    
  --lg.setColor(C_WHITE)
  --lg.polygon('fill',1,500 , w/2-w/4,h/2+64, w/2+w/4,h/2+64, w,500)
  

  --lg.polygon('line',w/2-192,h/2+128 , w/2-128,h/2+64, w/2-256,h/2+64, w/2-378,h/2+128)
  --lg.polygon('line',1,500 , w/2-w/4,h/2+96, w/2+w/4,h/2+96, w,h/2+96)
  --lg.polygon('line',1,1 , w/2-192,h/2-96, w/2-192+64,h/2+96, 1,500)
  --lg.rectangle('line',w/2-192,h/2-128,w/4,192)
  --lg.polygon('line',w,1 , w/2+192,204, w/2+192,396, w,500 )
]]--


function draw_land()
  local S = p.start
  --paint the sky
  lg.setColor(C_L_BLUE)
  lg.rectangle('fill',1,1,w,h/2)    
  --if map[S] == 0 then
  -- sea , beach and field
  if map[S+1] == 0 and map[S+10] == 0 then --top left corner
      lg.setColor(C_BLUE)
      lg.polygon('fill',w/3,h-192,1,h,1,h/2,w,h/2,w,h-192, w-w/4,h-192)
      --lg.rectangle('fill',1,h-192,w/2,h/3)
      --lg.rectangle('fill',1,h/2,w/2,h/2)
      lg.setColor(C_GREEN)
      
      --lg.rectangle("fill",w/2,h-192,w/2,h/3)
      lg.setColor(C_YELLOW)
      lg.polygon('fill',1,h,w/3,h-192,w-w/3,h-192,w,h-192,w,h)
      --lg.rectangle("fill",w/2,h-192,w/8,h/3)
    elseif map[S-1] == 0 and map[S-10] == 0 then --top right corner
      lg.setColor(C_YELLOW)
     lg.rectangle('fill',1,h-192,w-w/3,h/2,w,h-192)
      --lg.setColor(C_GREEN)
      --lg.rectangle("fill",1,h-192,w/6,h/2)
     lg.setColor(C_BLUE)
     lg.polygon('fill',1,h/2,w,h/2,w,h,w/4,h-192,1,h-192)--w,h,w-w/3,h-192,1,h-192)

 -- elseif map[S] == 0 and map[S+1] >= 11 and map[S+1] <= 13 or map[S] == 0 and map[S+1] <= 11 and map[S+1] <= 13 then -- left side
    
   --[[ lg.setColor(C_BLUE)
    lg.rectangle("fill",1,h/2,w/2,h/2)
    lg.setColor(C_YELLOW)
    lg.rectangle("fill",w/2,h/2,w/4,h/2)
    lg.setColor(C_GREEN)
    lg.rectangle("fill",w-w/8,h/2,w/8,h/2)
 --]]
  
  elseif map[S] == 0 and map[S-10] == nil then -- top side
    
    lg.setColor(C_BLUE)
    lg.rectangle("fill",1,h/2,w,h/3)
    lg.setColor(C_GREEN)
    lg.rectangle("fill",1,h-192,w,h/6)
    lg.setColor(C_YELLOW)
    lg.rectangle("fill",1,h-192,w,h/8)

  elseif map[S] == 0 and map[S+10] == nil then -- bottom side
    
    lg.setColor(C_BLUE)
    lg.rectangle("fill",1,h/2,w,h/3)
    lg.setColor(C_YELLOW)
    lg.rectangle("fill",1,h/2,w,h/4)
        lg.setColor(C_GREEN)
    lg.rectangle("fill",1,h/2,w,h/8)
  -- 1 land with grass
  elseif map[S] == 1 or map[S] == 8 or map[S] >10 and map[S] < 20 then
    --if player
    -- paint th field

    lg.setColor(C_GREEN)
    lg.rectangle("fill",1,h/2,w,h/2)
  --elseif map[S] == 2 then
    --draw inside a building
    lg.setColor(C_GREEN)
    lg.polygon('line',w/2-192,h/2+128 , w/2-128,h/2+64, w/2-256,h/2+64, w/2-378,h/2+128)
  end
  
    -- draw sea visible if is 1 blocks away
    if map [S-10] ~= nil then    -- this is to prevent errors
     if map [S-10] == 0 then
       lg.setColor(C_BLUE)
       lg.rectangle('fill',1,h/2,w,h/8)
      end
    end  
  
    -- draw sea visible if is 2 blocks away
    if map [S-20] ~= nil then    -- this is to prevent errors
     if map [S-20] == 0 then
       lg.setColor(C_BLUE)
       lg.rectangle('fill',1,h/2,w,h/12)
      end
    end  

    -- draw sea visible if is 3 blocks away
    if map [S-30] ~= nil then    -- this is to prevent errors
     if map [S-30] == 0 then
       lg.setColor(C_BLUE)
       lg.rectangle('fill',1,h/2,w,h/24)
      end
    end  
end

function menu_gui()
  --if edit_mode == 1 then
  --  lg.setColor(C_GREEN)
  --  if i_options.b_toggle == true then
   --   lg.setColor(255,165,0,255)
    --  lg.rectangle('line', 64,544,128,32)
            
        lg.setColor(C_WHITE)
     --[[   lg.print(tostring(menu[i]) , x+8,y+8)
        --lg.print('Drag and drop a png image.', 64,480)
        --[[i = 0
        x = 64
        y = 512
        repeat
          lg.rectangle('line', x,y,128,32)
        --  if list_pngs_found[i] ~= nil then
            lg.setColor(C_WHITE)
            lg.print(tostring(menu[i]) , x+8,y+8)
            menu.item_enabled[i] = true
            menu.toggle[i] = true --]]
            --lg.print(tostring(list_pngs_found[i]) , x+8,y+8)
          --else
           -- if list_pngs_found[i] == nil then
          ---  i = i + 1
          --end
        --  lg.print('', x+8, y+8)
--        end
--]]
     --   y = y - 32
     --   i = i+1
--      until i == 10
  --  end
    i = 0
    x = 32
    repeat
      if i_options[i] ~= '' then
        lg.rectangle('line', x,540,64,64)
        lg.print(i_options[i],x+8,552)
      end
      x = x + 64
      i = i+1
    until i == 5
 -- end
end

function draw_inv_items()
  
    -- and how many items
  -- inventory has 4 slots only.
  if p.backpack == true then
      local I = 0
      local X = 8
      repeat
        lg.setColor(C_BLACK)
        lg.rectangle('line',w-192+24*I+X,h-152,32,32)
        X=X+16
        I=I+1
      until I == 4
        lg.setColor(C_GRAY)
      lg.rectangle('fill',w-192,h-192, 256,96)
    local I=0
      -- contents of inventory get's drawn
    if inv.slot.id[I] == 11 then
      lg.setColor(C_BROWN)
      lg.rectangle('fill',w-180,h-144,24,8)    
      lg.setColor(C_BLACK)
      lgp(tostring(inv.slot.c[I])..' x', w-176,h-136)
    elseif inv.slot.id[I] == 12 then
      
    end

  else
    lg.setColor(C_GRAY)
    lg.rectangle('fill',w-192,h-170, 256,64)  
    lg.setColor(C_BLACK)
    lg.rectangle('line',w-192+8,h-152,32,32)
    lg.rectangle('line',w-48,h-152,32,32)
    
  end
end

function draw_inv_avatar()
  --inventory avatar
  lg.setColor(C_WHITE)
  lg.rectangle('fill', w-96,h-96,96,96)
  lg.setColor(C_GRAY)
  lg.rectangle('fill',w-80,h-92,72,88)
  --head
  lg.setColor(C_BLACK)
  lg.rectangle('line',w-56,h-88,24,24)
  -- arms
  lg.setColor(C_BLACK)
  lg.rectangle('line',w-68,h-64,8,24)
  lg.setColor(C_BLACK)
  lg.rectangle('line',w-28,h-64,8,24)
  --  body
  lg.setColor(C_BLACK)
  lg.rectangle('line',w-60,h-64,32,32)

  
  if p.gender == 1 then -- if character is male
    --legs
    lg.setColor(C_BLACK)
    lg.rectangle('line',w-56,h-32,8,24)
    lg.rectangle('line',w-40,h-32,8,24)
  elseif p.gender == 2 then
    lg.setColor(C_BLACK)
    lg.polygon(I,w-60,h-32, w-32,h-32 ,w-12,h-20, w-72,h-20)
    lg.rectangle('line',w-56,h-20,8,12)
    lg.rectangle('line',w-40,h-20,8,12)
  end
end

--function lefthand_slot()
--  lg.setColor(C_WHITE)
--  lgp('Left hand: ' .. tostring(objects.c) )

function male_icon(i)
  if i == 0 then
    I = 'line'
  else
    I = 'fill'
  end
  lg.setColor(C_WHITE)
  --head
  lg.rectangle(I,w/2-56,h/2+16,24,24)
    -- arms
  lg.rectangle(I,w/2-68,h/2+40,8,24)
  lg.rectangle(I,w/2-28,h/2+40,8,24)
    --  body
  lg.rectangle(I,w/2-60,h/2+40,32,32)
    --legs
  --male
  lg.rectangle(I,w/2-56,h/2+72,8,24)
  lg.rectangle(I,w/2-40,h/2+72,8,24) 
end

function female_icon(i)
  if i == 0 then
     I = 'line'
  else
     I = 'fill'
  end
  
  --head
  lg.rectangle(I,w/2+40,h/2+16,24,24)
    -- arms
  lg.rectangle(I,w/2+72,h/2+40,8,24)
  lg.rectangle(I,w/2+32,h/2+40,8,24)
    --  body
  lg.rectangle(I,w/2+40,h/2+40,32,32)
  --skirt
  --legs
    lg.polygon(I,w/2+72,h/2+72, w/2+40,h/2+72 ,w/2+32,h/2+84, w/2+84,h/2+84)
    lg.rectangle(I,w/2+60,h/2+84,8,12)
    lg.rectangle(I,w/2+44,h/2+84,8,12)
  --end
end

function draw_start()

  local i = 0
  repeat
    map[i] = 1 
    i = i + 1
  until i == 100
  draw_land()
  draw_paper_w()

  --lg.rectangle('fill',0,h/2, w,h/2)


  -- player can pick gender of the character
    lg.setColor(C_WHITE)
  if i_options[6] == '' or i_options[6] == 'new game' then
    lgp('New player part 1 of ', w/2-128,h/2-128)
    lgp('Pick the gender of your character', w/2-128,h/2-64)    
  elseif i_options[6] == 'pick colours' then
    lgp('New player part 2 of ', w/2-128,h/2-128)
    lgp('Pick the colours of your character', w/2-128,h/2-64)
    draw_pick_colours()
  end
   
  if i_options[6] == '' or i_options[6] == 'new game' then
    if p.gender == 0 then --or p.gender == 2 then     --if not none or female    
      male_icon(0)
      female_icon(0)
    -- man_icon(0)  
     elseif p.gender == 1 then
       male_icon(1)
       female_icon(0)
     elseif p.gender == 2 then
       male_icon(0)
       female_icon(1)
     end    
 
 
 lgp('Strenght: '..tostring(p.st)..' / 10', w/2+128,h/2+32)
 lgp('health: '..tostring(p.hp)..' / 10', w/2+128,h/2+32+16)
 lgp('experience: '..tostring(p.xp)..' / 10', w/2+128,h/2+32+32)
 end 
  --lg.circle('line', w/2-128, h/2+32, 16, 128)
  --ld.polygon('line', w/2-64,h/2, w/2-96,)
end

function draw_pick_colours()
 draw_paper_w()
 -- man_icon(0)  

  --head
  lg.setColor(C_BLACK)
  lg.rectangle('line',w/2-24,h/2-64,48,48)
  if p.a.c_head == nil then  
    lg.setColor(C_SKIN)
  end
  lg.rectangle('fill',w/2-23,h/2-63,46,46)

    -- arms   
  lg.setColor(C_BLACK)
  lg.rectangle('line',w/2-48,h/2-12,16,32)
  if p.a.c_l_arm == nil then  
    lg.setColor(C_SKIN)
  end
  lg.rectangle('fill',w/2-47,h/2-11,14,30)
  
  -- right arm
  lg.setColor(C_BLACK)
  lg.rectangle('line',w/2+32,h/2-12,16,32)
  if p.a.c_r_arm == nil then  
    lg.setColor(C_SKIN)
  end
  lg.rectangle('fill',w/2+33,h/2-11,14,30)
  
  --  body  
  lg.setColor(C_BLACK)
  lg.rectangle('line',w/2-32,h/2-12,64,64)
  if p.a.c_body == nil then  
    lg.setColor(C_SKIN)
  end
  lg.rectangle('fill',w/2-31,h/2-11,62,62)
  
  --elseif load custom colors
  
--  lg.setColor(C_WHITE)
  --lg.rectangle('line',w/2-32,h/2-12,64,64)
  
  local C
  --legs
  -- if ganeder is male
  if p.gender == 1 then
    C = 0
  elseif p.gender == 2 then
    C = 16
  end
    -- left leg
    lg.setColor(C_BLACK)
    lg.rectangle('line',w/2-24,h/2+52+C+1,16,32-C)
    if p.a.c_l_leg == nil then
      lg.setColor(C_SKIN)
    end
    lg.rectangle('fill',w/2-23,h/2+52+C+1,14,30-C)
    lg.setColor(C_BLACK)
    --right leg
    lg.rectangle('line',w/2+8,h/2+52+C,16,32-C) 
    if p.a.c_l_leg == nil then  
      lg.setColor(C_SKIN)
    end
    lg.rectangle('fill',w/2+9,h/2+52+C+1,14,30-C)
  if p.gender == 2 then
    -- skirt for female characters
    lg.setColor(C_BLACK)
    lg.polygon('line', w/2-32,h/2+52, w/2+32,h/2+52, w/2+48,h/2+68, w/2-48,h/2+68)
    if p.a.c_skirt == nil then
      lg.setColor(C_WHITE)
    end
    lg.polygon('fill', w/2-32,h/2+52, w/2+32,h/2+52, w/2+48,h/2+68, w/2-48,h/2+68)
  end
 
 lg.setColor(C_BLACK)
 lgp('Strenght: '..tostring(p.st)..' / 10', w/2+128,h/2+32)
 lgp('Health: '..tostring(p.hp)..' / 10', w/2+128,h/2+32+16)
 lgp('Experience: '..tostring(p.xp)..' / 10', w/2+128,h/2+32+32)
 
 lgp('Click on a part of the body and then on a color')
 -- color to pick

 C = 0
 local X
 local I
 local N
 N = 0
 repeat
    if C~=0 then
      X = X + 32
    else
      I = 0
      X = 0
    end
    if N == 0 then
      lg.setColor(C_BLACK)
    elseif N == 1 then
      lg.setColor(C_BLUE)
    elseif N == 2 then
      lg.setColor(C_GREEN)
    elseif N == 3 then
      lg.setColor(C_GRAY)
    elseif N == 4 then
      lg.setColor(C_WHITE)
    elseif N == 5 then
      lg.setColor(C_YELLOW)
    elseif N == 6 then
      lg.setColor(C_BROWN)
   end
   lg.rectangle('fill', w/2-156+X,h/2+96, 32,32)
   N = N+1
   C = C+1
  until C == 8
   
end

function check_paint()
  if p.a.skin == 0 then
    lg.setColor(C_BLACK)
  end
end

function draw_paper_w()
  --center part of paper
  lg.setColor(C_GRAY)
  lg.rectangle('fill',w/2-w/4,h/2-h/4,w/2,h/2+h/8)  
  -- top part of paper
  lg.setColor(C_BLACK)
  lg.rectangle('fill',w/2-w/4,h/2-h/4,w/2,h/8)
  lg.setColor(C_GRAY)
  lg.rectangle('fill',w/2-w/4+4,h/2-h/4+4,w/2-8,h/8-8)
  -- bottom part of paper
  lg.setColor(C_BLACK)
  lg.rectangle('fill',w/2-w/4,h-156,w/2,h/8)
  lg.setColor(C_GRAY)
  lg.rectangle('fill',w/2-w/4+4,h-156+4,w/2-8,h/8-8)
end