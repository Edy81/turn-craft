function menu()
  -- main menu
  local I
  if p.gender ~= 0 or i_options[6] == 'new game' then
    i_options[0] = 'Next'
    I = 1
  end  
  
  if i_options[6] == 'pick colours' then
    i_options[0] = 'Previous'
    i_options[1] = 'Next'
    I = 2
  end
  
  if i_options[6] == 'build' then
    local S = p.start
    if map[S] == 1 then
      i_options[0] = "Add ..."
    else--if map[S]
      i_options[0] = "Remove"
    end
    if map [S-10] ~= nil then
      if not (map[S-10] == 0) or not (map[S-10] > 1 and map[S-10] < 20) then
        i_options[1] = 'Remove'
      end
    end
 -- if i_options[1] == nil then

 -- else
   -- local I = 2
 end
  if i_options[6] == '' then
   I = 0
  end
    repeat
      i_options[I] = ''
      I = I +1
    until I == 4 
    i_options[4] = "Exit game"
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
  local S = p.start
    i_options [0] = "<< Add"
    
    if map [S-10] ~= nil and map [S-10] > 2 and map [S-10] < 8 then
              i_options [1] = "Sticks"
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

