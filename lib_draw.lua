function draw_left_side_wall_in()
  -- left side wall
  -- /
  lg.setColor(C_BLACK)
lg.polygon('line',w/3,h/2+96 , w/2-64,h/2+56, w/2-64,h/2-24, w/3,h/2-96 )
  lg.setColor(C_WHITE)
lg.polygon('fill',w/3,h/2+96 , w/2-64,h/2+56, w/2-64,h/2-24, w/3,h/2-96 )
  --lg.polygon('line',w/3,h/2+96 , w/2-48,h/2+56, w/2-48,h/2-24, w/3,h/2-96)
end

function draw_left_side_wall()
  --left wall visible inside a room or if a building is next to it
  lg.setColor(C_BLACK)
  lg.polygon('line',0,0 , 0,h, w/3,h/2+96, w/3,h/2-96 )
  lg.setColor(C_WHITE)
  lg.polygon('fill',0,0 , 0,h, w/3,h/2+96, w/3,h/2-96 )
end

function draw_front_left_wall()
  lg.setColor(C_BLACK)
  lg.rectangle('line',1,h/2-96,w/3,192)
  lg.setColor(C_WHITE)
  lg.rectangle('fill',1,h/2-96,w/3,192)
end

function draw_front_wall()
  -- front wall  
  lg.setColor(C_BLACK)
  lg.rectangle('line',w/2-168,h/2-96,--w/3,h/2-96,
    w/3,h/3)--224,192)
  lg.setColor(C_WHITE)
  lg.rectangle('fill',w/2-168,h/2-96,--w/3,h/2-96,
    w/3,h/3)--224,192)
end

function draw_right_side_wall_in()
  lg.setColor(C_BLACK)
  lg.polygon('line',w-w/3,h/2-96 , w/2+48,h/2-24, w/2+48,h/2+56, w-w/3,h/2+96 )
  lg.setColor(C_WHITE)
  lg.polygon('fill',w-w/3,h/2-96 , w/2+48,h/2-24, w/2+48,h/2+56, w-w/3,h/2+96 )
end

function draw_front_right_wall()
  lg.setColor(C_BLACK)
  lg.rectangle('line',w-w/3,h/2-96,w/3,192)  
  lg.setColor(C_WHITE)
  lg.rectangle('fill',w-w/3,h/2-96,w/3,192)
end

function draw_right_side_wall()
  --right side wall
  lg.setColor(C_BLACK)
  lg.polygon('line',w,h , w,0, w-w/3,h/2-96, w-w/3,h/2+96 )  
  lg.setColor(C_WHITE)
  lg.polygon('fill',w,h , w,0, w-w/3,h/2-96, w-w/3,h/2+96 ) 
end

function draw_door()
  lg.setColor(C_BLACK)
  lg.rectangle('line',w/2-32,h/2-32,64,128)
end          

function draw_distance_2_block()
  lg.setColor(C_BLACK)
  lg.rectangle('line',w/2-96,h/2-48,192,96)  
  lg.setColor(C_WHITE)
  lg.rectangle('fill',w/2-96,h/2-48,192,96)
end

function draw_distance_2_door()
  lg.setColor(C_BLACK)
  lg.rectangle('line',w/2-16,h/2-16,32,64)
end

function draw_indoor_floor()
  lg.setColor(C_GRAY)
  lg.polygon('fill',0,h, w/2-168,h/2+96, w-w/2+168,h/2+96, w,h)  
  lg.setColor(C_BLACK)
  lg.polygon('line',0,h, w/2-168,h/2+96, w-w/2+168,h/2+96, w,h)
end   

function draw_distance_1_floor()
  lg.setColor(C_GRAY)
  --lg.polygon('fill',w/2-168,h/2+96, w-w/2+168,h/2+96, w/2+48,h/2+24,
    --    w/2-64,h/2+24)  
  lg.setColor(C_BLACK)
  lg.polygon('line',w/2-168,h/2+96, w-w/2+168,h/2+96, w/2+52,h/2+56,
        w/2-52,h/2+48)--,0,h, w/2-168,h/2+96, w-w/2+168,h/2+96, w,h)
end

function draw_distance_2_floor()
  lg.setColor(C_GRAY)
  --lg.polygon('fill',w/2-168,h/2+96, w-w/2+168,h/2+96, w/2+48,h/2+24,
    --    w/2-64,h/2+24)  
  lg.setColor(C_BLACK)
  lg.polygon('line', w/2+52,h/2+56, w/2-26,h/2+48, w/2+52,h/2+24,
        w/2-26,h/2+24)--,0,h, w/2-168,h/2+96, w-w/2+168,h/2+96, w,h)
end

function draw_ceiling()
 lg.setColor(C_BLACK)
 lg.polygon('line',0,0, w/2-168,h/2-96, w-w/2+168,h/2-96, w,0)
 lg.setColor(C_WHITE)
 lg.polygon('fill',0,0, w/2-168,h/2-96, w-w/2+168,h/2-96, w,0)
end

function draw_distance_2_ceiling()
  lg.setColor(C_BLACK)
  lg.polygon('line', w/2-96,h/2-48, w/2-48,h/2-48, w/2+48,h/2-48,
  w-w/2+96,h/2-48)
  lg.setColor(C_WHITE)
  lg.polygon('fill', w/2-96,h/2-48, w/2-48,h/2-48, w/2+48,h/2-48,
  w-w/2+96,h/2-48)
end

function draw_distance_1_ceiling()
  lg.setColor(C_GRAY)
  lg.polygon('line', w/2-168,h/2-96, w-w/2+168,h/2-96, w/2+48,h/2-24,
  w/2-64,h/2-24)
  lg.setColor(C_GRAY)
  lg.polygon('line', w/2-168,h/2-96, w-w/2+168,h/2-96, w/2+48,h/2-24,
  w/2-64,h/2-24)
end
  
function draw_table()
  lg.setColor(C_GRAY)
  lg.polygon('fill',w/4,h/2+h/8, w-w/4,h/2+h/8, w-w/4,h/2+h/4, w/4,h/2+h/4)
  lg.polygon('fill',w/4,h/2+h/8, w/2-96,h/2+56, w/2+96,h/2+56,
  w-w/4,h/2+h/8)
         
  lg.setColor(C_BLACK)
  lg.polygon('line',w/4,h/2+h/8, w-w/4,h/2+h/8, w-w/4,h/2+h/4, w/4,h/2+h/4)
  lg.polygon('line',w/4,h/2+h/8, w/2-96,h/2+56, w/2+96,h/2+56,
  w-w/4,h/2+h/8)
end

function draw_table_right_side()
  lg.setColor(C_BLACK)
  lg.rectangle('line', w-64,h/2+h/4-64, 64, 64)
  lg.polygon('line',  w-64,h/2+h/8, w-64,h/2+h/4, w-w/4,h/2+h/8,
    w-w/4,h/2+8, w-64,h/2+h/8+8)
  --top
  lg.polygon('line',w-w/4,h/2+h/8-64,  w-128,h/2+16, w,h/2+h/8)
end

function draw_npc()
  -- hair
  -- lg.setColor(C_GREEN)
  -- lg.rectangle("fill",1,h/2,w,h/2)
  -- hair
  lg.setColor(C_BLACK)
  lg.rectangle("fill",w/2-16,h/2-12,48,16)
  -- face
  lg.setColor(C_GRAY)
  lg.rectangle("fill",w/2-16,h/2+4,48,48)
  -- body
  lg.setColor(C_BLACK)
  lg.rectangle('line',w/2-24,h/2+72,72,72)
  lg.setColor(C_WHITE)
  lg.rectangle('fill',w/2-24,h/2+52,70,70)  
  lg.setColor(C_SKIN)  
  lg.polygon('fill', w/2,h/2+52, w/2+24,h/2+52, w/2+12,h/2+72) 
    --w/2-22,h/2+52, w/2-22,h/2+52+70, w/2-22+70,h/2+52+70,
    --w/2-22+70,h/2+52, w/2-22+44,h/2+52, w/2-22+32,h/2+52+24,
    --w/2-22+16,h/2+52)
  --lg.rectangle('fill',w/2-24,h/2+52,72,72)  
  
  -- arms
  lg.setColor(C_BLACK)
  lg.rectangle('line',w/2-32,h/2+56,8,64)  -- left arm
  lg.setColor(C_WHITE)
  lg.rectangle('fill',w/2-32,h/2+56,6,62)
  
  lg.rectangle('line',w/2+48,h/2+56,8,64)  -- right arm
  -- legs
  lg.rectangle('line',w/2-16,h/2+126,24,64)  -- left leg
  lg.rectangle('line',w/2+16,h/2+126,24,64)  -- right leg
end