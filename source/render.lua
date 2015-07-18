require 'input'
require "lib_draw"

function draw_sc()
  -- map codes
  -- 0 sea
  draw_land()
  if m[6]=='introa' then
    lg.setColor(0,0,0,125)
    lg.rectangle('fill',0,0, w,h/4)
    lg.setColor(C_WHITE)
    lgp('Welcome to TURN-CRAFT, the game controls are', 8,8)
    lgp('down to the right of the window you will see',8,24)
    lgp('white flat buttons, eg( U is move forward, ) ',8,56)
  end
  furthest()
 -- far()
  near()
  here()
  
 -- drawing_rules()  -- what has to be draw is checked and drawed.
    -- table in front
    if map[p.l+c_mod[p.v]] ~= nil then --and p.v=='n' then
        if --[[map[p.l-9]==2 or map[p.l-11]==3 or map[p.l-1]==2 or map[p.l-1]==3  or--]] map[p.l]==17 then
          draw_table()
        end
      end
      
      -- table visible form right side
      if p.v == 'n' and map[p.l+1] == 17 then
        draw_table_r_side()
      end
    
    --- a door will be drawn if there is a building with a entry
    -- if map[p.l-c_mod[p.v]] ~= nil then    -- this is to prevent errors
    if p.v=='n' and map[p.l]==1 and map[p.l-10]==3
    or p.v=='n' and map[p.l]==30 and map[p.l-10]==3 then
      --[[  p.v=='n' and 
      p.v=='n' and map[p.l]>7 and map[p.l]<20 and map[p.l-10]==3 or
     p.v=='n' and map[p.l]==3 and map[p.l-10]==2 or
     p.v=='n' and map[p.l]==3 and map[p.l-10]==4 then]]--
        draw_door()
    elseif p.v=='e' and map[p.l]==1 and map[p.l+1]==5 or
     p.v=='e' and map[p.l]==30 and map[p.l+1]==5 then
      --[[p.v=='e' and map[p.l+1]==8 or
      p.v=='e' and map[p.l+1]==10 or
      p.v=='e' and map[p.l+1]==12 then
      ]]--
         draw_door()
      elseif p.v=='s' and map[p.l]==1 and map[p.l+10]==4 or
        p.v=='s' and map[p.l]==30 and map[p.l+10]==4 then 
      --p.v=='s' and map[p.l]>7 and map[p.l]<20 and map[p.l+10]==4 then
          draw_door()
      elseif p.v=='w' and map[p.l]==1 and map[p.l-1]==6 or 
      p.v=='e' and map[p.l]==30 and map[p.l-1]==6 then
          draw_door()
      end
      
      --a door will be drawn if the player is inside a building
      if p.v=='s' and map[p.l]==3 and map[p.l+10]==1 or
      p.v=='s' and map[p.l]==3 and map[p.l+10]==30 then
         draw_door()
      -- if there is a block or a room next to this door I added
      -- a room is carved out the block or linked
    --[[elseif p.v=='s' and map[p.l]==3 and map[p.l+10]==2 then 
       --draw_door()
     --  map[p.l+10]=4
    elseif p.v=='s' and map[p.l]==3 and map[p.l+10]==4 then
      -- draw_door()
       --map[p.l+10]=7
    elseif p.v=='s' and map[p.l]==3 and map[p.l+10]==5 then
    elseif p.v=='s' and map[p.l]==3 and map[p.l+10]==6 then
          movement rule
        --   draw_door()  
        
        
        ---elseif p.v=='s' and map[p.l]==3 and map[p.l+10]==2 then
         -- end
        -- elseif map[p.l-1]==3 then
        --  lg.setColor(C_BLACK)
          --lg.rectangle('line',w/2-32,h/2-32,64,128)]]--
      elseif p.v=='w' and map[p.l]==6 and map[p.l-1]==1 or
             p.v=='w' and map[p.l]==6 and map[p.l-1]==30 then
           draw_door()              
      --[[elseif p.v=='n' and map[p.l]==3 and map[p.l-10]==1 or
      p.v=='n' and map[p.l]==3 and map[p.l-10]>6 and map[p.l-10]<10 or
      p.v=='n' and map[p.l]==3 and map[p.l-10]==13 or
      -- if we have doors of each wall
      p.v=='n' and map[p.l]==13 and map[p.l-10]==1 or
      p.v=='n' and map[p.l]==13 and map[p.l-10]>6 and
      map[p.l-10]<10 then
           draw_door()    ]]--           
      elseif p.v=='e' and map[p.l]==5 and map[p.l+1]==1 or
             p.v=='e' and map[p.l]==5 and map[p.l+1]==30 then
           draw_door()               
        end             
   -- end
     
    
     --[[ left
     if map[p.l-10]==3 then

      -- lg.setColor(C_BLACK)
      -- lg.polygon('line',w/2-192,h/2-32,w/2-256,h/2-64,w/2-256,h/2+116, w/2-192, h/2+96)
      ]]--
       
       -- a door will be drawned on the left side wall 
      --north
      if p.v=='n' and map[p.l]==1 and map[p.l-1]==6 or
    p.v=='n'and map[p.l]==1 and map[p.l-1]==7 or
    -- rules npc 
    p.v=='n' and map[p.l]==30 and map[p.l-1]==6 or
    p.v=='n'and map[p.l]==30 and map[p.l-1]==7 then
      draw_door_l_wall()
      --east
    elseif p.v=='e'and map[p.l]==1 and map[p.l-10]==3 or
    p.v=='e'and map[p.l]==1 and map[p.l-10]==7 or
    --rules npc 
    p.v=='e' and map[p.l]==30 and map[p.l-10]==3 or
    p.v=='e'and map[p.l]==30 and map[p.l-10]==7 then
      draw_door_l_wall()
    --south
    elseif p.v=='s' and map[p.l]==1 and map[p.l+1]==5 or 
    p.v=='s' and map[p.l]==5 and map[p.l+1]==7 or
    --rules npc
    p.v=='s' and map[p.l]==30 and map[p.l+1]==5 or 
    p.v=='s' and map[p.l]==5 and map[p.l+1]==7 then
      draw_door_l_wall()
      --west
    elseif p.v=='w' and map[p.l]==1 and map[p.l-10]==4 or
      p.v=='w' and map[p.l]==1 and map[p.l-10]==7 or
      --rules npc 
      p.v=='w' and map[p.l]==30 and map[p.l-10]==4 then
      draw_door_l_wall()

      -- a door will be drawned on the right side wall
      --north      
      -- if right side wall has a door it will be drawned  
    elseif p.v=='n' and map[p.l]==1 and map[p.l+1]==5 or
    p.v=='n'and map[p.l]==1 and map[p.l+1]==7 or
    --rules npc 
    p.v=='n' and map[p.l]==30 and map[p.l+1]==5 or
    p.v=='n'and map[p.l]==30 and map[p.l+1]==7 then
      draw_door_r_wall()
      --east
    elseif p.v=='e'and map[p.l]==1 and map[p.l+10]==4 or
    p.v=='e'and map[p.l]==1 and map[p.l+10]==7 or
    --rules npc 
    p.v=='e'and map[p.l]==30 and map[p.l+10]==4 or
    p.v=='e'and map[p.l]==30 and map[p.l+10]==7 then
       draw_door_r_wall()
      --south
    elseif p.v=='s' and map[p.l]==1 and map[p.l-1]==6 or 
    p.v=='s' and map[p.l]==5 and map[p.l-1]==7 or
    --rules npc
    p.v=='s' and map[p.l]==30 and map[p.l-1]==6 or 
    p.v=='s' and map[p.l]==30 and map[p.l-1]==7 then
        draw_door_r_wall()
      --west
    elseif p.v=='w' and map[p.l]==1 and map[p.l-10]==3 or
      p.v=='w' and map[p.l]==1 and map[p.l+10]==7 or
      --rules npc
      p.v=='w' and map[p.l]==30 and map[p.l-10]==3 or
      p.v=='w' and map[p.l]==30 and map[p.l+10]==7 then
        draw_door_r_wall()
    end
    
    --ceiling left side screen
    if map[p.l-1]~=nil then
      if map[p.l-1]>3 and map[p.l-1]<6 or map[p.l-1]>6 and map[p.l-1]<9 or
      map[p.l-1]>9 and map[p.l-1]<11 then
        lg.setColor(C_GRAY)
        lg.polygon('fill', 0,0, 0,h/2-96, w/2-192,h/2-96)
      end
    end

    --ceiling left side screen distance 1
    --north
    if map[p.l-11]==5 or map[p.l-11]==10 or map[p.l-11]==12 and map[p.l-11]==13 then
      lg.setColor(C_GRAY)
      lg.polygon('fill',0,h/2-96, w/2-192,h/2-96, w/2-96,h/2-48, w/2-256,h/2-48)
    --east
    elseif map[p.l-9]==5 or map[p.l-9]==10 or map[p.l-9]==12 and map[p.l-9]==13 then
      lg.setColor(C_GRAY)
      lg.polygon('fill',0,h/2-96, w/2-192,h/2-96, w/2-96,h/2-48, w/2-256,h/2-48)
    --south
    elseif map[p.l+9]==5 or map[p.l+9]==10 or map[p.l+9]==12 and map[p.l+9]==13 then
      lg.setColor(C_GRAY)
      lg.polygon('fill',0,h/2-96, w/2-192,h/2-96, w/2-96,h/2-48, w/2-256,h/2-48)
    --west
    elseif map[p.l+11]==5 or map[p.l+11]==10 or map[p.l+11]==12 and map[p.l+11]==13 then
      lg.setColor(C_GRAY)
      lg.polygon('fill',0,h/2-96, w/2-192,h/2-96, w/2-96,h/2-48, w/2-256,h/2-48)

    end
    
    --ceiling left side screen distance 2
    if map[-21]~=nil then
      --north
      if map[p.l-21]>2 and map[p.l-21]<16 then
        lg.setColor(C_GRAY)
     --   lg.polygon('line',w/2-256,h/2-48, w/2-96,h/2-48, w/2-48,h/2-24, w/2-128,h/2-24)
      --east
      elseif map[p.l+19]>2 and map[p.l+19]<16 then
        lg.setColor(C_GRAY)
        lg.polygon('fill',w/2-256,h/2-48, w/2-96,h/2-48, w/2-48,h/2-24,
          w/2-128,h/2-24)
      --south
      elseif map[p.l+21]>2 and map[p.l+21]<16 then
        lg.setColor(C_GRAY)
        lg.polygon('fill',w/2-256,h/2-48, w/2-96,h/2-48, w/2-48,h/2-24,
          w/2-128,h/2-24)
      --west
      elseif map[p.l-19]>2 and map[p.l+19]<16 then
        lg.setColor(C_GRAY)
        lg.polygon('fill',w/2-256,h/2-48, w/2-96,h/2-48, w/2-48,h/2-24,
          w/2-128,h/2-24)
      end
    end 
    
    draw_objects()
      -- lg.polygon('fill',64,64 , w/2-386,h/2-32, w/2-386,h/2+96, 64,500-64)
end 

function gui()
  -- gui interactive buttons
  lg.setColor(C_GRAY)
  lg.polygon('line',0,h, w,h, w,h-96, w,h-96, w-192,h-96, w-128,h-64 , 0,h-64)
  lg.setColor(C_BLACK)
  lg.polygon('fill',0,h, w-2,h, w-2,h, w,h-94, w-192,h-94, w-128,h-62 , 0,h-62)
  if g.state==1 then
    lg.polygon('fill',0,h, w-64,h, w-2,h, w,h-94, w-192,h-94, w-128,h-62 , 0,h-62)
  end
  --lg.rectangle('fill',1,h-96,w,h-96)
  lg.setColor(C_WHITE)
  --lgp(p.start,w/2,h-32)
  if b_up.toggle==true then
    lg.rectangle('line',w-192,h-96,32,32)
    lgp('U',w-192+8,h-96+8)
  end
  if b_back.toggle==true then
    lg.rectangle('line',w-192,h-48,32,32)
    lgp('D',w-192+8,h-48+8)
  end
  if b_right.toggle==true then
    lg.rectangle('line',w-234,h-72,32,32)
    lgp('L',w-234+8,h-72+8)
  end
  if b_left.toggle==true then
    lg.rectangle('line',w-148,h-72,32,32)
    lgp('R',w-148+8,h-72+8)
  end
  -- Inventory
  if inv.toogle==true then
    draw_inv_items()
  end
  
  menu_gui()
    -- inventory button, avatar
  if inv.toggle then
		--lg.draw(inv.button_clicked, inv.x, inv.y)
    --lg.draw(inv.inv, w-272, h-256-128)
      -- inventory is drawn
      inv.toggle=true
      draw_inv_avatar()
      --lg.setColor(C_GRAY)
      --lg.rectangle('fill',w-192,h-192, 256,96)
      lg.setColor(C_WHITE)
      if p.backpack==true then
        lgp('Backpack contains:',w-188,h-188)
      end
      --lgp(tostring(ob+),w-188,h-188)

     if inv.toggle==true then
       draw_inv_items()
    end
	else
		--lg.draw(inv.button, inv.x, inv.y)
    draw_inv_avatar()
    
	end  
end  
  --[[local xa=w/2-192
  local ya=h/2+128
  local xb=w/2-128
  local yb=h/2+64
  local xc=w/2-256
  local yc=h/2+64
  local xd=w/2-378
  local yd=h/2+128
    
  --lg.setColor(C_WHITE)
  --lg.polygon('fill',1,500 , w/2-w/4,h/2+64, w/2+w/4,h/2+64, w,500)
  

  --lg.polygon('line',w/2-192,h/2+128 , w/2-128,h/2+64, w/2-256,h/2+64, w/2-378,h/2+128)
  --lg.polygon('line',1,500 , w/2-w/4,h/2+96, w/2+w/4,h/2+96, w,h/2+96)
  --lg.polygon('line',1,1 , w/2-192,h/2-96, w/2-192+64,h/2+96, 1,500)
  --lg.rectangle('line',w/2-192,h/2-128,w/4,192)
  --lg.polygon('line',w,1 , w/2+192,204, w/2+192,396, w,500 )
]]--

function draw_day_cycle()
  -- sky colors hourly
  if g.day_cycle==7 then
    lg.setColor(C_D_BLUE)
  elseif g.day_cycle==8 then
      lg.setColor(C_BLUE)    
    elseif g.day_cycle>=9 and g.day_cycle<=16 then
      lg.setColor(C_L_BLUE)
     elseif g.day_cycle==17 then
      lg.setColor(C_BLUE)
     elseif g.day_cycle==18 then
      lg.setColor(C_D_BLUE)
    elseif g.day_cycle>=19 and g.day_cycle<=24 or
      g.day_cycle>0 and g.day_cycle<7 then
      lg.setColor(C_BLACK)
      if g.day_cycle==24 then
        g.day_cycle=0
      end
    end
      lg.rectangle('fill',1,1,w,h/2)
  --sun and moon
  if p.v=='e' then
    if g.day_cycle==7 then
      lg.setColor(C_WHITE)
      lg.circle('fill', w/2-32,h/2, 32, 128)
    elseif g.day_cycle==8 then
      lg.setColor(C_WHITE)
      lg.circle('fill', w/2-32,h/2-h/16, 32, 128)
    elseif g.day_cycle==9 then
      lg.setColor(C_WHITE)
      lg.circle('fill', w/2-32,h/2-h/8, 32, 128)
    elseif g.day_cycle==10 then
      lg.setColor(C_WHITE)
      lg.circle('fill', w/2-32,h/2-h/4, 32, 128)
    elseif g.day_cycle==11 then
      lg.setColor(C_WHITE)
      lg.circle('fill', w/2-32,h/2-h/3, 32, 128)
    elseif g.day_cycle==12 then
      --lg.setColor(C_WHITE)
      lg.circle('fill', w/2-32,0, 32, 128)
   -- elseif g.day_cycle>=12 and g.day_cycle<13 then
   --   lg.setColor(C_WHITE)
   --   lg.circle('fill', w/2-32,h/2-32, 32, 128)
   --afternoon
   end
  elseif p.v=='w' then
    if g.day_cycle==12 then
      --lg.setColor(C_WHITE)
      lg.circle('fill', w/2-32,0, 32, 128)
    elseif g.day_cycle==14 then
      --lg.setColor(C_WHITE)
      lg.circle('fill', w/2-32,h/2-h/3, 32, 128)
    elseif g.day_cycle==15 then
      lg.setColor(C_WHITE)
      lg.circle('fill', w/2-32,h/2-h/4, 32, 128)
    elseif g.day_cycle==16 then
      lg.setColor(C_WHITE)
      lg.circle('fill', w/2-32,h/2-h/8, 32, 128)
    elseif g.day_cycle==17 then
      lg.setColor(C_WHITE)
      lg.circle('fill', w/2-32,h/2-h/16, 32, 128)
    elseif g.day_cycle==18 then
      lg.setColor(C_WHITE)
      lg.circle('fill', w/2-32,h/2, 32, 128)
    end
  end
end

function furthest()
  --right side in distance 2
  --noth
  if p.v=='n' and map[p.l-19] ~= nil then
    -- map[p.l-10]==1 or map[p.l-10] >9 and map[p.l-10]<20
    if map[p.l-19]>1 and map[p.l-19] <8 then
      draw_r_side_wall_in_2()
    end
  --east
  elseif p.v=='e' and map[p.l+21] ~= nil then
    if map[p.l+21]>1 and map[p.l+21] <8 then
      draw_r_side_wall_in_2()
    end
  --south
  elseif p.v=='s' and map[p.l+19] ~= nil then
    if map[p.l+19]>1 and map[p.l+19] <8 then
      draw_r_side_wall_in_2()
    end
  --west
  elseif p.v=='w' and map[p.l-21] ~= nil then
    if map[p.l-21]>1 and map[p.l-21] <16 then
       draw_r_side_wall_in_2()
    end
  end
    
    --draw_front_l_wall_in_2
    --north
  if p.v=='n' and map[p.l-21]~=nil then
    --if map[p.l-10]==2 or map[p.l-10]==3 or
    if --map[p.l]>1 and map[p.l]<14 or
      map[p.l-21]>1 and map[p.l-21]<14 then 
      draw_front_l_wall_in_2()
      if map[p.l-21]>1 and map[p.l-21]<7 then
        draw_l_side_wall_in_2()
      end
    end
  -- left side of screen door
    if map[p.l-21]==3 then
      draw_front_l_door_in_2()
    end
    -- east
  elseif map[p.l-19] ~= nil and p.v=='e' then
    if --map[p.l]==3 or map[p.l]==4 or
      map[p.l-19]>1 and map[p.l-19]<14 then 
      draw_front_l_wall_in_2()
    end
    if map[p.l-19]>1 and map[p.l-19]<7 then
        draw_l_side_wall_in_2()
    end
  -- left side of screen door
    if map[p.l-19]==5 then
      draw_front_l_door_in_2()
    end
     -- south
  elseif map[p.l+21] ~= nil and p.v=='s' then
    if map[p.l]==3 or map[p.l]==4 or map[p.l+21]>1 and map[p.l+21]<14 then
      draw_front_l_wall_in_2()      
    end
      if map[p.l+21]>1 and map[p.l+21]<7 then
        draw_l_side_wall_in_2()
      end
  -- left side of screen door
    if map[p.l+21]==4 then
      draw_front_l_door_in_2()
    end
  -- west
  elseif map[p.l+19] ~= nil and p.v=='w' then
    if map[p.l+19]>1 and map[p.l+19]<14 then
      draw_front_l_wall_in_2()
    end
      if map[p.l+19]>1 and map[p.l+19]<7 then
        draw_l_side_wall_in_2()
      end
  -- left side of screen door
    if map[p.l+19]==6 then
      draw_front_l_door_in_2()
    end
  end  

      
  --draw_front_r_wall_in_2
  --north
  if p.v=='n' and map[p.l-19] ~= nil then
    if map[p.l-19]>1 and map[p.l-19]<14 then
      draw_front_r_wall_in_2()
    end
  --door
    if map[p.l-19]>1 and map[p.l-19]<14 then
      draw_front_r_door_in_2()
    end
  --east
  elseif p.v=='e' and map[p.l+21] ~= nil then
    if map[p.l+21]>1 and map[p.l+21]<14 then
      draw_front_r_wall_in_2()
    end
  --door
    if map[p.l+21]>1 and map[p.l+21]<14 then
      draw_front_r_door_in_2()
    end
  --south
  elseif p.v=='s' and map[p.l+19] ~= nil then
    if map[p.l+19]>1 and map[p.l+19]<14 then
      draw_front_r_wall_in_2()
    end
  --door
    if map[p.l+19]>1 and map[p.l+19]<14 then
      draw_front_r_door_in_2()
    end
  --west
  elseif p.v=='w' and map[p.l-21] ~= nil then
    if map[p.l-21]>1 and map[p.l-21]<14 then
      draw_front_r_wall_in_2()
    end
    --door front in 2
    if map[p.l-21]>1 and map[p.l-21]<14 then
      draw_front_r_door_in_2()
    end
  end

  -- draw a building from 2 blocks away
  --north
  if map[p.l-20] ~= nil then    -- this is to prevent errors
    if p.v=='n' and map[p.l-20]>1 and map[p.l-20]<8 then
      draw_distance_2_block()
    end
  --east
  elseif map[p.l+2] ~= nil then    -- this is to prevent errors
    if p.v=='e' and map[p.l+2]> 1 and map[p.l+2]<8 then
      draw_distance_2_block()
    end
  --south
  elseif map[p.l+20] ~= nil then    -- this is to prevent errors
    if p.v=='s' and map[p.l+20]> 1 and map[p.l+20]<8 then
      draw_distance_2_block()
    end
  --east
  elseif map[p.l-2] ~= nil then    -- this is to prevent errors
    if p.v=='w' and map[p.l-2]> 1 and map[p.l-2]<8 then
      draw_distance_2_block()
    end
  end

  -- a door will be drawn if the door block is 2 clocks away
  --north
  if map[p.l-20] ~= nil then    -- this is to prevent errors
    if p.v=='n' and map[p.l-20]==3 then
      draw_distance_2_door()
    end
  --east 
  elseif map[p.l+2] ~= nil then    -- this is to prevent errors
    if p.v=='e' and map[p.l+2]==3 then
       draw_distance_2_door()
    end
  --south
  elseif map[p.l+20] ~= nil then    -- this is to prevent errors
    if p.v=='s' and map[p.l+20]==3 then
      draw_distance_2_door()
    end
  --west
  elseif map[p.l-2] ~= nil then    -- this is to prevent errors
    if p.v=='w' and map[p.l-2]==3 then
      draw_distance_2_door()
    end
  end  
  
  --ceiling distance 2 block away
  if map[-21]~=nil then
  -- North
    if p.v=='n' and map[p.l-20]==14 then-- and map[p.l-20]<16 then
      draw_distance_2_ceiling()
    --east
    elseif p.v=='e' and map[p.l+2]==14 then --and map[p.l+2]<16 then
      draw_distance_2_ceiling()
    --south
    elseif p.v=='s' and map[p.l+20]==14 then--2 and map[p.l+20]<16 then
      draw_distance_2_ceiling()
    --west
    elseif p.v=='w' and map[p.l-2]==14 then --2 and map[p.l-2]<16 then
      draw_distance_2_ceiling()
    end    
  end
    
  --indoor floor 1 block far
  if map[-20]~=nil then
  --north
    if p.v == 'n' and map[p.l-20]>2 and map[p.l-20]<16 then
    draw_distance_2_floor()
  --east
  elseif p.v == 'e' and map[p.l+2]>2 and map[p.l+2]<16 then
    draw_distance_2_floor()
  --south
  elseif p.v == 's' and map[p.l+20]>2 and map[p.l+20]<16 then
    draw_distance_2_floor()
  --west
  elseif p.v == 'w' and map[p.l-2]>2 and map[p.l-2]<16 then
    draw_distance_2_floor()
    end
  end 
end

function near()
  --if p.v==0 then -- if player looking north
  --north
  if p.v=='n' and map[p.l-11] ~= nil then
    if map[p.l-11]>1 and map[p.l-11]<14 then 
      draw_l_side_wall_in()
    end
  --east
  elseif p.v=='e' and map[p.l-9] ~= nil then
    if map[p.l-9]>1 and map[p.l-9]<5 or map[p.l-9]>5 and map[p.l-9]<8 then
      draw_l_side_wall_in()
    end
  --south
  elseif p.v=='s' and map[p.l+11] ~= nil then
    if map[p.l+11]>1 and map[p.l+11]<5 or map[p.l+11]>5
    and map[p.l+11]<8 then 
      draw_l_side_wall_in()
    end
  --west
  elseif p.v=='w' and map[p.l+9] ~= nil then
    if map[p.l+9]>1 and map[p.l+9]<5 or map[p.l+9]>5
    and map[p.l+9]<8 then 
      draw_l_side_wall_in()
    end
  end
   --end

  --noth
  if p.v=='n' and map[p.l-9] ~= nil then
    -- map[p.l-10]==1 or map[p.l-10] >9 and map[p.l-10]<20
    if map[p.l-9]>1 and map[p.l-9] <8 then
      draw_r_side_wall_in()
    end
  --east
  elseif p.v=='e' and map[p.l+11] ~= nil then
    if map[p.l+11]>1 and map[p.l+11] <8 then
      draw_r_side_wall_in()
    end
  --south
  elseif p.v=='s' and map[p.l+9] ~= nil then
    if map[p.l+9]>1 and map[p.l+9] <8 then
      draw_r_side_wall_in()
    end
    --west
  elseif p.v=='w' and map[p.l-11] ~= nil then
    if map[p.l-11]>1 and map[p.l-11] <8 then
      draw_r_side_wall_in()
    end
  end 
    
  --north
  if p.v=='n' and map[p.l-1]~=nil then
    if map[p.l]==3 or map[p.l]==4 or map[p.l-1]>1 and map[p.l-1]<8 then
      draw_l_side_wall()
    end
    --east
  elseif p.v=='e' and map[p.l-10]~=nil then
    if map[p.l]==3 or map[p.l]==4 or map[p.l-10]~= 1 and map[p.l-10]>1 and map[p.l-10]<8 then
      draw_l_side_wall()
    end
    --south
  elseif p.v=='s' and map[p.l+1]~=nil then
    if map[p.l]==2 or map[p.l]==3 or map[p.l+1]>1 and map[p.l+1]<8 then
      draw_l_side_wall()
    end
  --west
  elseif p.v=='w' and map[p.l+10]~=nil then
    if map[p.l]==2 or map[p.l]==3 or map[p.l+10]>1 and map[p.l+10]<8 then
      draw_l_side_wall()
    end
  end 
     
  -- front wall left side of screen
  --draw_l_wall
  -- north
  if p.v=='n' and map[p.l-11]~=nil then
    --front wall left
    if map[p.l]==7 or map[p.l-11]>1 and map[p.l-11]<14 then 
      draw_front_l_wall()
    end
  --door left side
    if map[p.l]==7 or map[p.l-11]==3 then 
      draw_front_l_side_door()
    end
  -- east
  elseif map[p.l-9] ~= nil and p.v=='e' then
    if --map[p.l]==3 or map[p.l]==4 or
      map[p.l-9]>1 and map[p.l-9]<14 then 
        draw_front_l_wall()
      end
  --door left side
    if map[p.l]==7 or map[p.l-11]==5 then 
      draw_front_l_side_door()
    end
    -- south
  elseif map[p.l+11] ~= nil and p.v=='s' then
    if map[p.l]==4 or map[p.l+11]>1 and map[p.l+11]<14 then
      draw_front_l_wall()      
    end
  --door left side
    if map[p.l]==7 or map[p.l-11]==4 then 
      draw_front_l_side_door()
    end
    -- west
  elseif map[p.l+9] ~= nil and p.v=='w' then
    if map[p.l]==4 or map[p.l+9]>1 and map[p.l+9]<14 then
      draw_front_l_wall()
    end
  --door left side
    if map[p.l]==7 or map[p.l-11]==6 then 
      draw_front_l_side_door()
    end
  end
  
  --draw_front_wall
  -- north
  if map[p.l+c_mod[p.v]] ~= nil then --and p.v=='n' then
    if --[[map[p.l-9]==2 or map[p.l-11]==3 or map[p.l-1]==2 or map[p.l-1]==3  or--]] map[p.l]>1 and map[p.l]<14 or map[p.l+c_mod[p.v]]>1 and map[p.l+c_mod[p.v]]<14 then
      draw_front_wall()
    end
  end
  --[[ east
    elseif map[p.l+1] ~= nil and p.v=='e' then
      if map[p.l]==2 or map[p.l]==3 or map[p.l+1]>1 and map[p.l+1]<8 then
          draw_front_wall()
        end
     -- south
    elseif map[p.l+10] ~= nil and p.v=='s' then
        if map[p.l]==2 or map[p.l]==3 or map[p.l+10]>1 and map[p.l+10]<8 then
          draw_front_wall()
        end
     -- west
    elseif map[p.l-1] ~= nil and p.v=='w' then
        if map[p.l]==3 or map[p.l]==4 or map[p.l-1]>1 and map[p.l-1]<8 then
          draw_front_wall()
        end
      end]]--
      
      -- front wall right side of screen
    --  if -- not (map[p.l]>9 and map[p.l]<20) or
    --  map[p.l] ~= 1 or map[p.l]>3 and map[p.l]<7 or map[p.l+1]>3 and map[p.l+1]<=7 
      --(map[p.l-9]>9 and map[p.l-9]<20) or 
      --map[p.l-9] ~= 1 or 
      --draw_front_r_wall
      --north
  if p.v=='n' and map[p.l-9] ~= nil then
    if map[p.l-9]>1 and map[p.l-9]<14 then
      draw_front_r_wall()
    end
  --door right side
    if map[p.l]==7 or map[p.l-11]==3 then 
      draw_front_r_side_door()
    end
  --east
  elseif p.v=='e' and map[p.l+11] ~= nil then
    if map[p.l+11]>1 and map[p.l+11]<14 then
      draw_front_r_wall()
    end
  --door right side
    if map[p.l]==7 or map[p.l-11]==3 then 
      draw_front_r_side_door()
    end
  --south
  elseif p.v=='s' and map[p.l+9] ~= nil then
    if map[p.l+9]>1 and map[p.l+9]<14 then
      draw_front_r_wall()
    end
  --west
  elseif p.v=='w' and map[p.l-11] ~= nil then
    if map[p.l-11]>1 and map[p.l-11]<14 then
      draw_front_r_wall()
    end
  end
    
  -- right side wall
  --north
  if p.v=='n' and map[p.l+1] ~= nil then
    if map[p.l]==3 or map[p.l]==4 or map[p.l+1]>1 and map[p.l+1]<14 then 
      draw_r_side_wall()
    end
  --east
  elseif p.v=='e' and map[p.l+10] ~= nil then
    if map[p.l]==3 or map[p.l]==4 or map[p.l+10]>1 and map[p.l+10]<14 then 
      draw_r_side_wall()
    end
  --south
  elseif p.v=='s' and map[p.l-1] ~= nil then
    if map[p.l]==3 or map[p.l]==4 or map[p.l-1]>1 and map[p.l-1]<14 then 
      draw_r_side_wall()
    end
  --west
  elseif p.v=='w' and map[p.l-10] ~= nil then
    if map[p.l]==3 or map[p.l]==4 or map[p.l-10]>1 and map[p.l-10]<14 then 
      draw_r_side_wall()
    end
  end
  
  --ceiling distance 1 block away
  --if map[p.l+20]
  if map[p.l+c_mod[p.v]]==14 then 
  -- and map[p.l+c_mod[p.v]]<16 then
    draw_distance_1_ceiling()
  end
       
  --indoor floor 1 block far
  if map[p.l+c_mod[p.v]]==14 then--and map[p.l+c_mod[p.v]]<16 then
    draw_distance_1_floor()
  end   
end


function here()
    --ceiling
  if map[p.l]>2 and map[p.l]<16 then
     draw_ceiling()
  end
    
  --indoor floor    
  if map[p.l]>2 and map[p.l]<30 then
    draw_indoor_floor()
    if map[p.l] == 15 then
      draw_npc()
    elseif map[p.l] == 16 then
      draw_table()
    end
  end
end

function draw_land()
  --paint the sky
  draw_day_cycle()
 -- lg.setColor(C_L_BLUE)
 -- lg.rectangle('fill',1,1,w,h/2)    
  --if map[p.l]==0 then
  -- sea , beach and field
  
  --top left corner
  if p.v=='n' and map[p.l+1]==0 and map[p.l-10]==0
  and map[p.l]==0 
  or p.v=='e' and map[p.l+1]==0 and map[p.l+10]==0
  and map[p.l]==0
  or p.v=='s' and map[p.l+10]==0 and map[p.l-1]==0
  and map[p.l]==0 then
    --  lg.setColor(C_BLUE)
      --lg.polygon('fill',w/3,h-192,1,h,1,h/2,w,h/2,w,h-192, w-w/4,h-192)
      --lg.rectangle('fill',1,h-192,w/2,h/3)
      --lg.rectangle('fill',1,h/2,w/2,h/2)
    lg.setColor(C_GREEN)
    lg.rectangle("fill",w/2,h-192,w/2,h/3)
    lg.setColor(C_YELLOW)
   -- lg.polygon('fill',1,h,w/3,h-192,w-w/3,h-192,w,h-192,w,h)
      lg.rectangle("fill",w/2,h-192,w/8,h/3)
 --[[ elseif p.v=='n' and map[p.l-1]==0 and map[p.l]==0 and
    map[p.l-10]==0 then --top right corner
    lg.setColor(C_BLUE)
    lg.polygon('fill', w/3,h, w/2-64,h/2, 0,h/2, 0,h)
    --lg.rectangle('fill',1,h-192,w-w/3,h/2,w,h-192)
    lg.setColor(C_GREEN)
    lg.polygon('fill', w-w/3,h, w/2+64,h/2, w,h/2, w,h)
    lg.setColor(C_BLUE)
    lg.rectangle('fill',0,0, w,h/2)  ]]-- --lg.polygon('fill',0,h/2,w,h/2,w,h,w/4,h-192,1,h-192)--w,h,w-w/3,h-192,1,h-192)

 -- elseif map[p.l]==0 and map[p.l+1]>=11 and map[p.l+1]<=13 or map[p.l]==0 and map[p.l+1]<=11 and map[p.l+1]<=13 then -- left side
    
   --[[ lg.setColor(C_BLUE)
    lg.rectangle("fill",1,h/2,w/2,h/2)
    lg.setColor(C_YELLOW)
    lg.rectangle("fill",w/2,h/2,w/4,h/2)
    lg.setColor(C_GREEN)
    lg.rectangle("fill",w-w/8,h/2,w/8,h/2)
 --]]

 --sea shore
  elseif p.v=='n' and map[p.l]==0 and map[p.l+10]==0 and map[p.l-10]==0
  and map[p.l+1]~=0
  or p.v=='e' and map[p.l]==0 and map[p.l+1]==0 and map[p.l-1]==0
  and map[p.l-10]~=0
  or p.v=='s' and map[p.l]==0 and map[p.l+10]==0 and map[p.l-10]==0
  and map[p.l-1]~=0
  or p.v=='w' and map[p.l]==0 and map[p.l+1]==0 and map[p.l-1]==0 and
  map[p.l+10]==nil then
    lg.setColor(C_BLUE)  --water to the left
    lg.polygon('fill',0,h, w/3,h, w/2-64,h/2, 0,h/2)
    lg.setColor(C_YELLOW)
    lg.polygon('fill',w/3,h, w/2-64,h/2, w-w/2+64,h/2, w-w/3,h)
    lg.setColor(C_GREEN)
    lg.polygon('fill',w-w/3,h, w/2+64,h/2, w,h/2, w,h )
 --sea shore left and right
  elseif p.v=='n' and map[p.l]==0 and map[p.l+10]==0 and map[p.l-10]==0
  and map[p.l-1]~=0
  or p.v=='e' and map[p.l]==0 and map[p.l+1]==0 and map[p.l-1]==0
  and map[p.l+10]~=0
  or p.v=='s' and map[p.l]==0 and map[p.l+10]==0 and map[p.l-10]==0
  and map[p.l+1]~=0
  or p.v=='w' and map[p.l]==0 and map[p.l+1]==0 and map[p.l-1]==0 
  and map[p.l-10]==nil
  then
    lg.setColor(C_BLUE)  --water to the right
    lg.polygon('fill',w-w/3,h, w,h, w,h/2, w/2+64,h/2)
    lg.setColor(C_YELLOW)
    lg.polygon('fill',0,h, w/2-64,h/2, w/2+64,h/2, w,h)
    lg.setColor(C_GREEN)
    lg.polygon('fill',0,h/2, 0,h, w/3,h, w/2-32,h/2 )
  elseif p.v=='n' and map[p.l]==0 and map[p.l-10]==nil -- top side
  or p.v=='e' and map[p.l-1]~=0 and map[p.l-10]==0 and
  map[p.l+10]==0 and map[p.l]==0
  or p.v=='s' and map[p.l]==0 and map[p.l+10]==nil   
  or p.v=='w' and map[p.l+1]~=0 and map[p.l-10]==0 and
 map[p.l+10]==0 and map[p.l]==0 then
    lg.setColor(C_BLUE)
    lg.rectangle("fill",1,h/2,w,h/3)
    lg.setColor(C_GREEN)
    lg.rectangle("fill",1,h-192,w,h/6)
    lg.setColor(C_YELLOW)
    lg.rectangle("fill",1,h-192,w,h/8)
  
  --top side in
  elseif p.v=='n' and map[p.l]==0 and map[p.l+10]==nil
  or p.v=='e' and map[p.l]==0 and map[p.l-1]~=0 
  or p.v=='s' and map[p.l]==0 and map[p.l-10]==nil   
  or p.v=='w' and map[p.l+1]~=0 and map[p.l-10]==0 and
  map[p.l+10]==0 and map[p.l]==0 then
    lg.setColor(C_GREEN)
    lg.rectangle("fill",0,h/2,w,h/6)
    lg.setColor(C_BLUE)
    lg.rectangle("fill",0,h-192,w,h/8)
    lg.setColor(C_YELLOW)
    lg.rectangle("fill",0,h-192,w,h/16)
    
 --[[ elseif map[p.l]==0 and map[p.l+10]==nil then -- bottom side
    
    lg.setColor(C_BLUE)
    lg.rectangle("fill",1,h/2,w,h/3)
    lg.setColor(C_YELLOW)
    lg.rectangle("fill",1,h/2,w,h/4)
        lg.setColor(C_GREEN)
    lg.rectangle("fill",1,h/2,w,h/8)]]--
  -- 1 land with grass
  elseif map[p.l]==1 or map[p.l]==30 or map[p.l] >10 and map[p.l]<20 then
    --if player
    -- paint th field

    lg.setColor(C_GREEN)
    lg.rectangle("fill",1,h/2,w,h/2)
  --elseif map[p.l]==2 then
    --draw inside a building
    lg.setColor(C_GREEN)
    lg.polygon('line',w/2-192,h/2+128 , w/2-128,h/2+64, w/2-256,h/2+64, w/2-378,h/2+128)
  end
  
    -- draw sea visible if is 1 blocks away
    -- north
    if p.v=='n' and map[p.l]~=0 and map[p.l-10] ~= nil then    -- this is to prevent errors
        if map[p.l-10]==0 then
          lg.setColor(C_BLUE)
          lg.rectangle('fill',1,h/2,w,h/8)
        end
    -- north
  elseif p.v=='e' and map[p.l]~=0 and map[p.l+1] ~= nil 
  -- this is to prevent errors
  and  map[p.l+1]==0 then
          lg.setColor(C_BLUE)
          lg.rectangle('fill',1,h/2,w,h/8)
    -- north
  elseif p.v=='s' and map[p.l]~=0 and map[p.l+10]==0 and
  map[p.l+10]~= nil then    -- this is to prevent errors
        if map[p.l-10]==0 then
          lg.setColor(C_BLUE)
          lg.rectangle('fill',1,h/2,w,h/8)
        end
    -- north
    elseif p.v=='w' and map[p.l]~=0 and map[p.l-1]~= nil then    -- this is to prevent errors
        if map[p.l-1]==0 then
          lg.setColor(C_BLUE)
          lg.rectangle('fill',1,h/2,w,h/8)
      end
    end  
  
    -- draw sea visible if is 2 blocks away
    if p.v=='n' and map[p.l]~=0 and map[p.l-20] ~= nil then    -- this is to prevent errors
     if map[p.l-20]==0 then
       lg.setColor(C_BLUE)
       lg.rectangle('fill',1,h/2,w,h/12)
      end  
    elseif p.v=='e' and map[p.l]~=0 and map[p.l+2] ~= nil then    -- this is to prevent errors
      if map[p.l+2]==0 then
        lg.setColor(C_BLUE)
        lg.rectangle('fill',1,h/2,w,h/12)
      end 
    elseif p.v=='s' and map[p.l]~=0 and map[p.l-20]==0 and 
    map[p.l+20] ~= nil then    -- this is to prevent errors
     if map[p.l+20]==0 then
       lg.setColor(C_BLUE)
       lg.rectangle('fill',1,h/2,w,h/12)
      end      
    elseif p.v=='w' and map[p.l]~=0 and map[p.l-2] ~= nil then    -- this is to prevent errors
     if map[p.l-2]==0 then
       lg.setColor(C_BLUE)
       lg.rectangle('fill',1,h/2,w,h/12)
      end
    end  
    
    -- draw sea visible if is 3 blocks away
    if map[p.l-30] ~= nil and map[p.l]~=0 and p.v=='n' then    -- this is to prevent errors
     if map[p.l-30]==0 then
       lg.setColor(C_BLUE)
       lg.rectangle('fill',1,h/2,w,h/24)
      end
    elseif map[p.l+3] ~= nil and map[p.l]~=0 and p.v=='e' then    -- this is to prevent errors
     if map[p.l+3]==0 then
       lg.setColor(C_BLUE)
       lg.rectangle('fill',1,h/2,w,h/24)
      end
    elseif map[p.l+30] ~= nil and map[p.l]~=0 and p.v=='s' then    -- this is to prevent errors
     if map[p.l+30]==0 then
      lg.setColor(C_BLUE)
       lg.rectangle('fill',1,h/2,w,h/24)
      end
    elseif map[p.l-3] ~= nil and map[p.l]~=0 and p.v=='w' then    -- this is to prevent errors
     if map[p.l-3]==0 then
       lg.setColor(C_BLUE)
       lg.rectangle('fill',1,h/2,w,h/24)
      end
    end 


end

function menu_gui()
  --if edit_mode==1 then
  --  lg.setColor(C_GREEN)
  --  if m.b_toggle==true then
   --   lg.setColor(255,165,0,255)
    --  lg.rectangle('line', 64,544,128,32)
            
        lg.setColor(C_WHITE)
     --[[   lg.print(tostring(menu[i]) , x+8,y+8)
        --lg.print('Drag and drop a png image.', 64,480)
        --[[i=0
        x=64
        y=512
        repeat
          lg.rectangle('line', x,y,128,32)
        --  if list_pngs_found[i] ~= nil then
            lg.setColor(C_WHITE)
            lg.print(tostring(menu[i]) , x+8,y+8)
            menu.item_enabled[i]=true
            menu.toggle[i]=true --]]
            --lg.print(tostring(list_pngs_found[i]) , x+8,y+8)
          --else
           -- if list_pngs_found[i]==nil then
          ---  i=i + 1
          --end
        --  lg.print('', x+8, y+8)
--        end
--]]
     --   y=y - 32
     --   i=i+1
--      until i==10
  --  end
    i=0
    x=32
    repeat
      if m[i] ~= '' then
        lg.rectangle('line', x,540,64,64)
        lg.print(m[i],x+8,552)
      end
      x=x + 64
      i=i+1
    until i==5
 -- end
end

function draw_inv_items()
  
    -- and how many items
  -- inventory has 4 slots only.
  if p.backpack==true then
      local I=0
      local X=8
      repeat
        lg.setColor(C_BLACK)
        lg.rectangle('line',w-192+24*I+X,h-152,32,32)
        X=X+16
        I=I+1
      until I==4
        lg.setColor(C_GRAY)
      lg.rectangle('fill',w-192,h-192, 256,96)
    local I=0
      -- contents of inventory get's drawn
    if inv.slot.id[I]==11 then
      lg.setColor(C_BROWN)
      lg.rectangle('fill',w-180,h-144,24,8)    
      lg.setColor(C_BLACK)
      lgp(tostring(inv.slot.c[I])..' x', w-176,h-136)
    elseif inv.slot.id[I]==12 then
      
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

  
  if p.gender==1 then -- if character is male
    --legs
    lg.setColor(C_BLACK)
    lg.rectangle('line',w-56,h-32,8,24)
    lg.rectangle('line',w-40,h-32,8,24)
  elseif p.gender==2 then
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
  if i==0 then
    I='line'
  else
    I='fill'
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
  if i==0 then
     I='line'
  else
     I='fill'
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

  --[[local i=0
  repeat
    map[i]=1 
    i=i + 1
  until i==100]]--
  draw_land()
  --draw_paper_w()
  --[[ tutorial building
  XXXXXX
  X | | X
  XxX XXX
       : x
  X-X@: x
  X X xxx 
  map[15]=14
  map[14]=3
  map[16]=3
  map[24]=3
  map[25]=14
  map[26]=14
  map[27]=6
  map[34]=13
  map[35]=13
  map[44]=6
  map[45]=15
  map[46]=17
  map[53]=14
  map[54]=6
  map[55]=14
  map[56]=2
  map[57]=2]]--
  
  --lg.rectangle('fill',0,h/2, w,h/2)


  -- player can pick gender of the character
    lg.setColor(C_WHITE)
  
  if m[6]=='new game' then
    lgp('New player part 1 of ', w/2-128,h/2-128)
    lgp('Pick the gender of your character', w/2-128,h/2-64)    
  elseif m[6]=='pick colours' then
    lgp('New player part 2 of ', w/2-128,h/2-128)
    lgp('Pick the colours of your character', w/2-128,h/2-64)
    draw_pick_colours()
  end
   
  if m[6]=='new game' then
    if p.gender==0 then --or p.gender==2 then     --if not none or female    
      male_icon(0)
      female_icon(0)
    -- man_icon(0)  
     elseif p.gender==1 then
       male_icon(1)
       female_icon(0)
     elseif p.gender==2 then
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
  if p.a.c_head==nil then  
    lg.setColor(C_SKIN)
  end
  lg.rectangle('fill',w/2-23,h/2-63,46,46)

    -- arms   
  lg.setColor(C_BLACK)
  lg.rectangle('line',w/2-48,h/2-12,16,32)
  if p.a.c_l_arm==nil then  
    lg.setColor(C_SKIN)
  end
  lg.rectangle('fill',w/2-47,h/2-11,14,30)
  
  -- right arm
  lg.setColor(C_BLACK)
  lg.rectangle('line',w/2+32,h/2-12,16,32)
  if p.a.c_r_arm==nil then  
    lg.setColor(C_SKIN)
  end
  lg.rectangle('fill',w/2+33,h/2-11,14,30)
  
  --  body  
  lg.setColor(C_BLACK)
  lg.rectangle('line',w/2-32,h/2-12,64,64)
  if p.a.c_body==nil then  
    lg.setColor(C_SKIN)
  end
  lg.rectangle('fill',w/2-31,h/2-11,62,62)
  
  --elseif load custom colors
  
--  lg.setColor(C_WHITE)
  --lg.rectangle('line',w/2-32,h/2-12,64,64)
  
  local C
  --legs
  -- if ganeder is male
  if p.gender==1 then
    C=0
  elseif p.gender==2 then
    C=16
  end
    -- left leg
    lg.setColor(C_BLACK)
    lg.rectangle('line',w/2-24,h/2+52+C+1,16,32-C)
    if p.a.c_l_leg==nil then
      lg.setColor(C_SKIN)
    end
    lg.rectangle('fill',w/2-23,h/2+52+C+1,14,30-C)
    lg.setColor(C_BLACK)
    --right leg
    lg.rectangle('line',w/2+8,h/2+52+C,16,32-C) 
    if p.a.c_l_leg==nil then  
      lg.setColor(C_SKIN)
    end
    lg.rectangle('fill',w/2+9,h/2+52+C+1,14,30-C)
  if p.gender==2 then
    -- skirt for female characters
    lg.setColor(C_BLACK)
    lg.polygon('line', w/2-32,h/2+52, w/2+32,h/2+52, w/2+48,h/2+68, w/2-48,h/2+68)
    if p.a.c_skirt==nil then
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

 C=0
 local X
 local I
 local N
 N=0
 repeat
    if C~=0 then
      X=X + 32
    else
      I=0
      X=0
    end
    if N==0 then
      lg.setColor(C_BLACK)
    elseif N==1 then
      lg.setColor(C_BLUE)
    elseif N==2 then
      lg.setColor(C_GREEN)
    elseif N==3 then
      lg.setColor(C_GRAY)
    elseif N==4 then
      lg.setColor(C_WHITE)
    elseif N==5 then
      lg.setColor(C_YELLOW)
    elseif N==6 then
      lg.setColor(C_BROWN)
   end
   lg.rectangle('fill', w/2-156+X,h/2+96, 32,32)
   N=N+1
   C=C+1
  until C==8
   
end

function check_paint()
  if p.a.skin==0 then
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

function draw_objects()
  --outside
  -- on_sc_objects() -- on screen objects
  -- npc
  if map[p.l]==30 then
    draw_npc()
  end
     
  -- sticks
    if objects.c[p.l] ~= nil then
       
      if map[p.l]==11 then 
        lg.setColor(C_BROWN)
        lg.polygon('fill' , w/2-64, h/2+192 , w/2+64, h/2+192, w/2+64, h/2+184, w/2-64, h/2+184)
        lg.setColor(C_BLACK)
        lgp( tostring( objects.c[p.l] )..'x' , w/2-64, h/2+156)
       
       --lg.polygon('line',w/2-16,h/2+128, w/2+16,h/2+64, w/2+16,h/2, w/2-8,h/2+64)
        objects.x=w/2-64
        objects.y=h/2+192
        objects.w=128
        objects.h=64
      end  -- end of painting sticks
    end
    --draw stone code
    if map[p.l]==12 then
      lg.setColor(C_GRAY)
      lg.rectangle("fill",w/2-16,h/2+128,32,32)
      lg.setColor(C_BLACK)
      lgp( tostring( objects.c[p.l] )..'x' , w/2-64, h/2+156)
      -- draw hud icon
      lg.setColor(0,0,0,64)
      lg.rectangle('fill',w/2+32,h/2+32,64,64)
    end -- end of painting stones
    
    --leaves
    if map[p.l]==13 then
      lg.setColor(C_BLACK)
      lg.polygon('line',w/2-64,h/2+64,w/2-72,h/2+72,w/2-96,h/2+96,w/2+64,h/2+96)
    end
    
    --grass
    if map[p.l]==20 then
      lg.setColor(C_BLACK)
      --if objects.c[p.l] ~= 0 then
      local I=0
      repeat
      -- if I<objects.c[p.l] then
      --  I=I+1
      --end
          
      lg.rectangle('line',w/2-16*I,h/2+128,8,16)
      --lg.setColor(C_GREEN)
      --lg.rectangle('fill',w/2-14*I,h/2+128,6,14)
      if I<objects.c[p.l] then
        I=I+1
      end
    until I==objects.c[p.l]
    --end
  end
end