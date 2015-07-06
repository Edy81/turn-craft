function sandbox()
  --[[ world generator
   0=water 1=grass 2=solid block 3=north door
   4=south door 5=east door 6=west door 7=doors n and s
   8=doors n and e 9=doors n and w 10=doors s and e
  11=doors s and w 12=doors w and e 13=all 4 doors
  14=no door or ceiling 15=npc inside
  16=obstacle block with ceiling
  30=npc out 31=obstacle block 32=
  
  11=sticks object on a field
  12=stones object on a field
  13=leaves objec
  t on a field
  20 =npc
  40=mirror inside block
  ]]--  
  i=0
  repeat
    map[i]=1 
    i=i + 1
  until i==world.size 
  
  i=0
  repeat
    if i>=0 and i<=9 or i>=91 and i<=99 or i % 10==0 or i / 9==0 then
      map[i]=0
   -- elseif i % 10==0 then
      --map[i]=0
    elseif i % 9==9 then
      map[i]=0
    elseif i % 10 ~= 0 then
 --     map[i]=3
    
  end
  i=i +1
  until i==world.size

  
  if g.state== 1 then
  i=0
  repeat
    objects.c[i]=0
    i=i+1
  until i==world.size
  
  i=0
  repeat
    if i>=0 and i<=9 or i>=91 and i<=99 or i % 10==0 or i / 9==0 then
      map[i]=0
   -- elseif i % 10==0 then
      --map[i]=0
    elseif i % 9==9 then
      map[i]=0
    elseif i % 10 ~= 0 then
      map[i]=3
    
    end
  i=i +1
  until i==world.size

  map[23]=8
 -- map[35]=3  

  place_object_on_grid(11)
  place_object_on_grid(12)
  place_object_on_grid(14)
  
  end

  i=0
  repeat
    if map[i] ~= 1 then
      map[15]=3 -- inside a building   
    else
      i =lm.random(world.size) 
    end
    i=i + 1
  until i==world.size
  
  i=9
  repeat
    map[i]=0
    i=i+10
  until i>=world.size  
end

function place_object_on_grid(o,r)
    -- how many sticks and how many places have them.
  --t -- t for times that the loop must loop until 
  --local S=p.start
  --if r==nil then
    local I=lm.random(11,100)
  --end
  local C
  C=0
  -- the sticks will be place on fields randonly
  repeat
   local n=lm.random(1,10) -- n for number of objects   
    if map[I]== 1 then
      map[I]=o
      if o==11 then
       local name='sticks'
      elseif o==12 then
        local name='stones'
      elseif o==14 then
        local name='grass'
      end
      objects.id[I]=o
      objects.name[I]=name
      objects.c[I]=n
      C=C +1
    else
      I=lm.random(1,world.size)
    end
    if I <=world.size then
      I=I+ 1
    end
    
  until C==10
end

function game_rules_default()
  local S
  S=p.start
   
  
  -- day cycle rules
  if p.turn_p==p.turn_c -1 then
    time=time + 1
  end
  if time % 1==0 then
    g.day_cycle=g.day_cycle + 1
   -- time=0
  end
  
  --movement
  --show or hide arrows
  --up cursor
  if b_up.toggle==true then
 --   if map[S+c_i_mod[p.view]]==2 or map[S+c_i_mod[p.view]]>10 and
    --map[S+c_i_mod[p.view]]<12 or
    if map[S+c_i_mod[p.view]]~=nil then
      if map[S+c_i_mod[p.view]]>3 and
    map[S+c_i_mod[p.view]]<7 or map[S+c_i_mod[p.view]]==13 then
      b_up.toggle=false
    if p.view=='n' and map[S-20]==nil then
      b_up.toggle=false
    elseif p.view=='e' and map[S+2]==nil then
      b_up.toggle=false
    elseif p.view=='s' and map[S+20]==nil then
      b_up.toggle=false
    elseif p.view=='w' and map[S-2]==nil then
      b_up.toggle=false
    end
  end
  end
  end
  
  if b_up.toggle==false then
    --rules for inside buildings
    if p.view=='n' and map[S]==4 and map[S-10]==0 and map[S-10]==1 then
      b_up.toggle=true
    elseif p.view=='e' and map[S]==6 and map[S+1]==0 and
    map[S+1]==1 then
      b_up.toggle=true
    elseif p.view=='s' and map[S]==3 and  map[S+10]==0 and 
    map[S+10]==1 then
      b_up.toggle=true
    elseif p.view=='w' and map[S]==5 and map[S-1]==0 and
    map[S-1]==1 then
      b_up.toggle=true
    end
  end
  if b_up.toggle==false then
    if map[S-20]~=nil then
      b_up.toggle=true
    end
  end
  
     -- if map[S-20]==nil then
       --   b_up.toggle=false
     -- end
end      