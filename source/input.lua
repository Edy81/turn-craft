require "menu"
require "code"
--function love.keypressed()
  

function love.mousepressed(x,y, button  )
  local S=p.start
   love.mouse.setCursor(cursor)
  	if x>=inv.x and x<=inv.x + inv.w and y>=inv.y and y<=inv.y + inv.h then
		inv.toggle=not inv.toggle
  --  save_game()
	end
  
 --[[ 	if x>=l_hand.x and x<=l_hand.x + l_hand.w and y>=l_hand.y and y<=l_hand.y + l_hand.h then
	--	l_hand.toggle=not l_hand.toggle
--	end
  
 -- 	if x>=r_hand.x and x<=r_hand.x + r_hand.w and y>=r_hand.y and y<=r_hand.y + r_hand.h then
	--	r_hand.toggle=not r_hand.toggle
	--end
  

  --if x>=w/2-64 and  x <=w/2+64 and y>=h/2-64 and y<=h/2+64 then
   -- lg.setColor(0,255,255,255)
 -- end


   -- center screen
  --	if x>=hotspot01.x and x<=hotspot01.x + hotspot01.w and y>=hotspot01.y and y<=hotspot01.y + hotspot01.h then
	--	hotspot01.toggle=not hotspot01.toggle
  --      lg.circle ("fill", hotspot01.x, hotspot01.y, hotspot01.w, hotspot01.h)
    --    edit_mode=1
      --  m.toggle=true
      --]]  
      --[[ if map[i-1]==1 then
          p.start=p.start - 10
        end
    love.graphics.printf("This text is aligned center",100, h-520, 200,"center")
	end
  
  if edit_mode==0 then
  --]]
  -- interactive option 0 add or remove
    if x>32 and x<96 and y>h-64 and y<h then
     --  m.b_toggle=true
       -- search_object_stats()
      -- if the scene is a field and it has a doesn't have an object
      --if map[S]==1 then
        --interactive option 1 add has a menu with a list of objects
        -- possible to add
        if m[6]=='intro' and m[0]=='New' then
          m[6]='new'
        end
          
        if g.state==0 and m[0]=='Next' then
          m[6]='pick colours'
        elseif m[6]=='pick colours' and m[0]=='Previous' then
          m[6]='new game'
        elseif m[6]=='build' then
          if m [0]=="Remove" then
            if map[S] ~= 0 then
              map[S]=1
              menu()
            end
          elseif m[0]=="Add ..." then --or m [0]=="<< Add" then

            m[6]='add'
          elseif m[0]=="Objects" then
            menu_ojects()
          end       
        elseif m[0]=="<< Add" then
          m[6]='build'
        end  
    end
  
  -- interactive option 1 add
  --menu button 2
   if x>96 and x<160 and y>h-64 and y<h then  
     menu01()
   end
    
    -- interactive option 2 add
    if x>160 and x<224 and y>h-64 and y<h then
        if m[6]=='new' and m[1]=='Tiny map' then
          world.size=1000
          world()
        end
        
      if m[6]=='build' and m[2]=='Stones' then
        if map [S]==1 then
          map[S]=12
          menu()
        end
        -- if there are stones on the scene 
        -- and less than 10 we add 1 more
        --if map [S]==12 and objects.c[S]<10 then
        --  objects.c[S]=objects.c[S] + 1
        --  menu()
        --end
      end
    end        
    
    -- interactive option 3 add
   --[[ if x>=320+256 and x<=320+256+128 and y>=544 and y<=544 + 32 then
      if m [2]=="Doors ..." then
        m [0]="<< Add doors"
        m [1]="south"    
        m [2]="north"
        m [3]="east"
        m [4]="west"
      end
      
      --if m [2]==""
    end]]--
    
    if x>224 and x<288 and y>h-64 and y<h then
      if m[4]=='Quit' then
        love.event.quit()
      end
    end
  
  --if x>=w-64 and y>=h-128 and x<=w and y<=h then
  --  inv=1
  
  --else
  --if x>=w-64 and y>=h-128 and x<=w and y<=h then
  --inv=0
  --end
      if button=="l" then
        love.mouse.setCursor()
    end
   
-- menu
--     	if x>=menu.x and x<=menu.x + menu.w and y>=menu.y and y<=menu.y + menu.h then
        
  
--end  
   --up button, walk forward
     	if x>=b_up.x and x<=b_up.x + b_up.w and y>=b_up.y and y<=b_up.y + b_up.h and b_up.toggle== true then
        --lg.setColor(C_BLUE)
          
        --  if map[S-10] ~= nil and p.view==0 then -- if player facing north
            
            if p.view=='n' and map[S-10] ~= nil then
              if map[S-10]==0 or map[S-10]==1 or map[S-10]>10 or map[S-10]<20 or map[S-10]==3 or map[S-10]==4 then
                if p.turn_p==p.turn_c - 1 then
                  p.turn_p=p.turn_c
                end
                p.turn_c=p.turn_c + 1
                p.start=p.start-10
              end
            elseif p.view=='e' and map[S+1] ~= nil then
              if map[S+1]==1 or map[S+1]>10 or map[S+1]<20 or map[S+1]==3 or map[S-1]==4 then
                if p.turn_p==p.turn_c - 1 then
                  p.turn_p=p.turn_c
                end
                p.turn_c=p.turn_c + 1
                p.start=p.start+1
            end
          elseif p.view=='w' and map[S-1] ~= nil then
              if map[S-1]==1 or map[S-1]>10 or map[S-1]<20 or map[S-1]==3 or map[S-1]==4 then
                if p.turn_p==p.turn_c - 1 then
                  p.turn_p=p.turn_c
                end
                p.turn_c=p.turn_c + 1
                p.start=p.start-1
            end
          elseif p.view=='s' and map[S+10] ~= nil then
              if map[S+10]==1 or map[S+10]>10 or map[S+10]<20 or map[S+10]==3 or map[S+10]==4 then
                if p.turn_p==p.turn_c - 1 then
                  p.turn_p=p.turn_c
                end
                p.turn_c=p.turn_c + 1
                p.start=p.start+10
                
              end
        end
        game_rules_default()
      end
  -- end
   
      --back button
     	if x>=b_back.x and x<=b_back.x + b_back.w and y>=b_back.y and y<=b_back.y + b_back.h then
        --p.start=p.start+10
        menu()
      end
      
      -- left button
     	if x>=b_left.x and x<=b_left.x + b_left.w and y>=b_left.y and y<=b_left.y + b_left.h then
      -- p.start=p.start-1 

       --compas movement code
     if p.view=='n' then
                if p.turn_p==p.turn_c - 1 then
                  p.turn_p=p.turn_c
                end
                p.turn_c=p.turn_c + 1
       p.view='w'
      elseif p.view=='w' then
                if p.turn_p==p.turn_c - 1 then
                  p.turn_p=p.turn_c
                end
                p.turn_c=p.turn_c + 1
         p.view='s'
      elseif p.view=='s' then 
                if p.turn_p==p.turn_c - 1 then
                  p.turn_p=p.turn_c
                end
                p.turn_c=p.turn_c + 1
        p.view='e'
     --lg.setColor(C_WHITE)
     ---lgp(p.view,32,h/2)
    elseif p.view=='e' then
                if p.turn_p==p.turn_c - 1 then
                  p.turn_p=p.turn_c
                end
                p.turn_c=p.turn_c + 1
      -- end of code of compas
         p.view='n'
       end
       game_rules_default()
      end
      
      -- right button
     	if x>=b_right.x and x<=b_right.x + b_right.w and y>=b_right.y and y<=b_right.y + b_right.h then
        a_left()             
      end
      
      -- hotspot to interact with an object in the scene
      if g.state==0 then
      if x>=w/2-72 and x<=w/2 and y >=h/2+16 and y<=h/2+72 then
        -- it's a boy
        p.gender=1
        p.st=2
        p.hp=25
        m[6]='new game'
      end
      if x>=w/2 and x<=w/2+72 and y >=h/2+16 and y<=h/2+72 then
        -- it's a girl
        p.gender=2
        p.st=1
        p.hp=25
        m[6]='new game'
      end
     end
      if g.state==1 then
      -- inventory
      if x>=w/2-128 and x<=w/2+128 and y >=h/2+156 and
      y<=h/2+192 then 
      --if x>=objects.x and x<=objects.x + objects.w and y>=objects.y and y<=objects.y + objects.h then
        if map[S]==11 then
          
        --  local I=lm.random(1, objects.c[S])
        --[[  if inv.lefthand==0 then
            inv.lefthand=objects.id[S] + I
            objects.c[S]=objects.c[S] - I 
         
            --objects.c[S]=objects.c[S]
            objects.toogle=false
          elseif inv.righthand==0 then
            inv.righthand=objects.id[S] + I
            objects.c[S]=objects.c[S] - I 
            
            --objects.c[S]=objects.c[S]
            objects.toogle=false
          else--]]
            local E=0
            -- check inventory is empty or full , if so add item
            repeat
            
            if-- inv.slot.id[E]==map[S] and inv.slot.c[E]<10 or 
               inv.slot[E]==nil then
              inv.slot.id[E]=map[S]  
              objects.c[S]=objects.c[S] -1
              inv.slot.c[E]=inv.slot.c[E]+ 1 
              inv.slot.id[0]=map[S]
              E=E+1
            elseif inv.slot.id[E] ~= nil and inv.slot.c[E]==10 then
              E=E + 1
            end   
            until E==1
          end
        
        elseif map[S]==12 then
        
          local I=lm.random(1, objects.c[S])
          if inv.lefthand ~= 0 or inv.lefthand<=10 then
            inv.lefthand= objects.id[S] + I
            objects.c[S]=objects.c[S] - I 
            objects.c[S]=objects.c[S]
            objects.toogle=false
          elseif inv.righthand ~= 0 or inv.righthand<=10 then
            inv.righthand=objects.id[S] + I
            objects.c[S]=objects.c[S] - I 
            objects.c[S]=objects.c[S]
            objects.toogle=false
          end
          
        end
        --p.start=+10
end

function menu01()
  local S
  S = p.start
     --[[   if m [1]=="Remove ..." then
          --m [0]="<< main"
          --m [2]="sticks"
          --m [3]="stones"
          --m [4]="leaves"
        end]]--
  if m[6]=='new' and m[1]=='Tiny map' then
    world.size=100
    sandbox()
    m[6]='new game'
        
  elseif m[6]=='pick colours' and m[1]=="Next" then
          
    g.state=1 
    m[6]='build'  -- show edit menu
                 
  elseif m[6]=='add' then -- map [S]==1 then
    if m[1]=="Block" and map[S-10] ~= 0 then
      map[S+c_i_mod[p.view]]=2        
    elseif m[1]=='Door' then
      map[S+c_i_mod[p.view]]=7
    elseif map[S+c_i_mod[p.view]]==1 then --or map[c_i_mod[p.view]]
    --==3 then 
    map[S+c_i_mod[p.view]]=2
    --[[    elseif p.view=='e' then 
      map[S+1]=2
      elseif p.view=='s' then 
      map[S+10]=2
      elseif p.view=='w' then 
      map[S-1]=2]]--
        
    elseif m[1]=='Door' and map[S+c_i_mod[p.view]]==2 then 
      if p.view=='n' then
        --if there is a building with a door in 2 blocks
        --a block with both south and noth will be added
        if map[-20]~=nil and map[S-20]==3 then
          if map[S-20]==3 or map[S-20]==7 or map[S-20]==13 then
            map[S-10]=7
          elseif map[S-10]==2 then
            map[S-10]=3
          end
        elseif map[S-10]==2 then
          map[S-10]=3
        end 
      elseif p.view=='s' then
        map[S+10]=4
      elseif p.view=='e' then
        map[S+1]=5
      elseif p.view=='w' then
        map[S-1]=6
      end
    elseif m[1]=='Sticks' then
      if map [S]==1 then
        map[S]=11
        menu()
      end
    -- if there are sticks on the scene 
    -- and less than 10 we add 1 more
    end 
    if map [S]==11 and objects.c[S]<10 then
      objects.c[S]=objects.c[S] + 1
      menu()
    end
  end     
 end
end  

function a_left()
  --compas movement code
  if p.view=='n' then
    if p.turn_p==p.turn_c - 1 then
      p.turn_p=p.turn_c
    end
      p.turn_c=p.turn_c + 1
      p.view='e'
    elseif p.view=='e' then
      if p.turn_p==p.turn_c - 1 then
        p.turn_p=p.turn_c
      end
    p.turn_c=p.turn_c + 1
    p.view='s'
  elseif p.view=='s' then 
    if p.turn_p==p.turn_c - 1 then
      p.turn_p=p.turn_c
    end
    p.turn_c=p.turn_c + 1
    p.view='w'
  --lg.setColor(C_WHITE)
  --lgp(p.view,32,h/2)
  elseif p.view=='w' then  -- if north
    if p.turn_p==p.turn_c -1 then
      p.turn_p=p.turn_c
    end
    p.turn_c=p.turn_c + 1
  -- end of code of compas
    p.view='n'
  end
  -- end of code of compas
  game_rules_default()
  -- menu()
end