function menu()
  -- main menu
  local I
   I = 0
    local S
    S = p.start
    repeat
      m[I] = ''
      I = I +1
    until I == 4   
  if m[6] == 'intro' then
    m[0] = 'New'
  if lf.exists('options.txt') then
    m[1] = 'Load ...'
  end 
    --m[2] = 'Options ...'
  
  elseif m[6] == 'new game' then
    if p.gender ~= 0 then
      m[0] = 'Next'
    end
  
  elseif m[6] == 'new' then
    m[0] = '<< New'
    m[1] = 'Tiny map'
    m[2] = 'Small map'
    m[3] = 'Medium'
    m[4] = 'Big map'
    
  elseif m[6] == 'pick colours' then
    m[0] = 'Previous'
    m[1] = 'Next'
    
  elseif m[6] == 'options' then
   -- m[0] = '<< Options'
   -- m[1] = ''
   
  elseif m[6] == 'build' then
    if map[S-c_i_mod[p.heading]] == 1 then --and map[S-c_i_mod[p.heading]] ~= 3  then
      m[0] = 'Add ...'
      elseif map[S-c_i_mod[p.heading]] ~= 1 then --and map[S-c_i_mod[p.heading]]
      
      --m[0] = ""
    elseif map[S] > 8 and map[S] <20 or map[S] == 3 then
      m[0] = "Remove"
    elseif map [S-c_i_mod[p.heading]] ~= nil then
      if not (map[S-c_i_mod[p.heading]] == 0) or not (map[S-c_i_mod[p.heading]] > 1 and map[S-10] < 20) or map[S] == 3 then
        m[1] = 'Remove'
      end
    end
    
  elseif m [6] == "add" then
    if map [S-10] == 1 then
                  m[0] = "<< Add"
                  m[1] = 'Block'
    elseif map [S+1] == 1 then
                  m[0] = "<< Add"
                  m[1] = 'Block'
    elseif map [S+10] == 1 then
                  m[0] = "<< Add"
                  m[1] = 'Block'
    elseif map [S-1] == 1 then
                  m[0] = "<< Add"
                  m[1] = 'Block'
      else
        m[0] = '<< Add'
     end  
 -- if m[1] == nil then

 -- else
   -- local I = 2
 --  menu_add()

 end
  --if m[6] == '' then
 --  I = 0
  --  repeat
    --  m[I] = ''
      --I = I +1
    --until I == 4 
  --end
  

    m[4] = "Quit"
end

function menu_objects()
  --if m [0] == "<< Objects" then
    --  if map[S] == 1 then
        m [0] = "<< Objects"
        m [1] = "Sticks"
        m [2] = "Stones"
        m [3] = "Leaves"
end

function menu_add()
  local S 
  S = p.start
  if m[6] == 'add' then
    
    m [0] = "<< Add"
    
    if map [S-c_i_mod[p.heading]] ~= nil and map [S-c_i_mod[p.heading]] == 1 then --and map [S-c_i_mod[p.heading]] < 8 then
              m [1] = "Block"
        m [2] = "Stones"
        m [3] = "Leaves"
    else
      m [1] = "Block"
    end
   -- else
   --   m [2] = "Block"
    if map[S] == 2 and m [2] ~= "Block" then
      m [2] = "Doors ..."
    --else
    --  m [2] = "Objects ..."
    end
    if m [2] == "Doors ..."then
      m [3] = "Objects ..."
    end
  end
end
