function menu()
  -- main menu
  local I
   I = 0
    local S
    S = p.start
    repeat
      i_options[I] = ''
      I = I +1
    until I == 4   
  if i_options[6] == 'new game' then
    i_options[0] = 'Next'
  
  elseif i_options[6] == 'pick colours' then
    i_options[0] = 'Previous'
    i_options[1] = 'Next'
  
  elseif i_options[6] == 'build' then
    if map[S-c_i_mod[p.heading]] == 1 then --and map[S-c_i_mod[p.heading]] ~= 3  then
      i_options[0] = 'Add ...'
      elseif map[S-c_i_mod[p.heading]] ~= 1 then --and map[S-c_i_mod[p.heading]]
      
      --i_options[0] = ""
    elseif map[S] > 8 and map[S] <20 or map[S] == 3 then
      i_options[0] = "Remove"
    elseif map [S-c_i_mod[p.heading]] ~= nil then
      if not (map[S-c_i_mod[p.heading]] == 0) or not (map[S-c_i_mod[p.heading]] > 1 and map[S-10] < 20) or map[S] == 3 then
        i_options[1] = 'Remove'
      end
    end
    
  elseif i_options [6] == "add" then
    if map [S-10] == 1 then
                  i_options[0] = "<< Add"
                  i_options[1] = 'Block'
    elseif map [S+1] == 1 then
                  i_options[0] = "<< Add"
                  i_options[1] = 'Block'
    elseif map [S+10] == 1 then
                  i_options[0] = "<< Add"
                  i_options[1] = 'Block'
    elseif map [S-1] == 1 then
                  i_options[0] = "<< Add"
                  i_options[1] = 'Block'
      else
        i_options[0] = '<< Add'
     end  
 -- if i_options[1] == nil then

 -- else
   -- local I = 2
 --  menu_add()

 end
  --if i_options[6] == '' then
 --  I = 0
  --  repeat
    --  i_options[I] = ''
      --I = I +1
    --until I == 4 
  --end
  

    i_options[4] = "Quit"
end

function menu_objects()
  --if i_options [0] == "<< Objects" then
    --  if map[S] == 1 then
        i_options [0] = "<< Objects"
        i_options [1] = "Sticks"
        i_options [2] = "Stones"
        i_options [3] = "Leaves"
end

function menu_add()
  local S 
  S = p.start
  if i_options[6] == 'add' then
    
    i_options [0] = "<< Add"
    
    if map [S-c_i_mod[p.heading]] ~= nil and map [S-c_i_mod[p.heading]] == 1 then --and map [S-c_i_mod[p.heading]] < 8 then
              i_options [1] = "Block"
        i_options [2] = "Stones"
        i_options [3] = "Leaves"
    else
      i_options [1] = "Block"
    end
   -- else
   --   i_options [2] = "Block"
    if map[S] == 2 and i_options [2] ~= "Block" then
      i_options [2] = "Doors ..."
    --else
    --  i_options [2] = "Objects ..."
    end
    if i_options [2] == "Doors ..."then
      i_options [3] = "Objects ..."
    end
  end
end
