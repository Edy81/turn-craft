function menu()
  -- main menu
  local I
   I=0
    local S
    S=p.start
    repeat
      m[I]=''
      I=I +1
    until I==4   
  if m[6]=='intro' then
    --m[0]='New'
    if lf.exists('options.txt') then
      m[1]='Load ...'
    end
  end  
    --m[2]='Options ...'
  
  if m[6]=='new game' then
    if p.gender ~= 0 then
      m[0]='Next'
    end
  end
  
  if m[6]=='new' then
    m[0]='<< New'
    m[1]='Tiny map'
    m[2]='Small map'
    m[3]='Medium'
    m[4]='Big map'
  end
  
  if m[6]=='pick colours' then
    m[0]='Previous'
    m[1]='Next'
  end
  
  if m[6]=='options' then
   -- m[0]='<< Options'
   -- m[1]=''
  end
  
  --elseif m[6]=='build' then
    --Check if there is a empty space or a block in front
    if map[S+c_i_mod[p.view]]==1 or map[S+c_i_mod[p.view]]==2 then
    --north
    if map[S-10]~=nil then
      if p.view~='n' and map[S-10]==3 or p.view~='n' 
      and map[S-10]>6 and map[S-10]<10 then
        m[0]='Add ...'
      end
    --south
    elseif map[S+10]~=nil then
      if p.view~='s' and map[S+10]==4 or p.view~='s'
      and map[S+10]==7 or p.view~='s' and map[S+10]>9
      and map[S+10]<12 or p.view~='s' and map[S+10]>6
      and map[S+10]<10 then
        m[0]='Add ...'
      end
    --east
    elseif map[S+1]~=nil then
      if p.view=='e' and map[S+1]==5 or p.view=='e' and
      map[S+1]==8 or p.view=='e' and map[S+1]==10 or
      p.view=='e' and map[S+1]==12 then
        m[0]='Add ...'
      end
    -- west
    elseif map[S-1]~=nil then
    if p.view=='w' and map[S-1]==6 then
    --> 0 and map[S+c_i_mod[p.view]]<3 or
    --map[S+c_i_mod[p.view]] --> 3 and map[S+c_i_mod[p.view]]<13 then
    --p.view=='w' then
        m[0]='Add ...'
      end
    elseif map[S+c_i_mod[p.view]] ~= 1 then --and map[S-c_i_mod[p.view]]
      
      --m[0]=""
    elseif map[S]>8 and map[S] <20 then--or map[S]==3 then
      m[0]="Remove"
    elseif map[S+c_i_mod[p.view]] ~= nil then
      if not (map[S+c_i_mod[p.view]]==0) or not (map[S+c_i_mod[p.view]]>1 and map[S-10]<20) or map[S]==3 then
        m[1]='Remove'
      end
    end 
  end
  
  if m[6]=="add" then
    m[0]='<< Add'
    if map[S-20]~=nil then
      
      if map[S-20]==1 or map[S-20]==2 or map[S-20]==5
      or map[S-20]==6 or map[S-20]>9 and map[S-20]<14 then
        m[1]='Block'
      elseif map[S-20]==3 or map[S-20]==2 or map[S-20]==5
      or map[S-20]==6 or map[S-20]>9 and map[S-20]<14 then
    --    if map [S+c_i_mod[p.view]]==1 then
        m[1]='Door'
      end
    
    --[[elseif map [S+1]==1 then
                  m[0]="<< Add"
                  m[1]='Block'
    elseif map [S+10]==1 then
                  m[0]="<< Add"
                  m[1]='Block'
    elseif map [S-1]==1 then
                  m[0]="<< Add"
                  m[1]='Block']]--
      --elseif map[S+c_i_mod[p.view]]==2 or
    elseif p.view=='n' and map[S-10]>3 and map[S-10]<10 or
    map[S-10]==2 then
        m[1]='Door'
     end
    end
 -- if m[1]==nil then

 -- else
   -- local I=2
 --  menu_add()
  --if m[6]=='' then
 --  I=0
  --  repeat
    --  m[I]=''
      --I=I +1
    --until I==4 
  --end
  

    m[4]="Quit"
end

function menu_objects()
  --if m [0]=="<< Objects" then
    --  if map[S]==1 then
        m [0]="<< Objects"
        m [1]="Sticks"
        m [2]="Stones"
        m [3]="Leaves"
end

function menu_add()
  local S 
  S=p.start
  if m[6]=='add' then
    
    m [0]="<< Add"
    
    if map [S-c_i_mod[p.view]] ~= nil and map [S-c_i_mod[p.view]]==1 then --and map [S-c_i_mod[p.view]]<8 then
              m [1]="Block"
        m [2]="Stones"
        m [3]="Leaves"
    else
      m [1]="Block"
    end
   -- else
   --   m [2]="Block"
    if map[S]==2 and m [2] ~= "Block" then
      m [2]="Doors ..."
    --else
    --  m [2]="Objects ..."
    end
    if m [2]=="Doors ..."then
      m [3]="Objects ..."
    end
  end
end