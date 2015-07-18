function menu()
  -- main menu
  local I
   I=0
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
 
  if m[6]=='build' then
    --Check if there is a empty space or a block in front
    if map[p.l+c_mod[p.v]]==1 or map[p.l+c_mod[p.v]]==2 or
    --north
       map[p.l+c_mod[p.v]]~=nil and map[p.l+c_mod[p.v]]==3 then
      --  and map[p.l-10]>6 and map[p.l-10]<10 then
          m[0]='Add ...'
       -- end
    --south
      elseif map[p.l+10]~=nil then
        if p.v~='s' and map[p.l+10]==4 or p.v~='s'
        and map[p.l+10]==7 or p.v~='s' and map[p.l+10]>9
        and map[p.l+10]<12 or p.v~='s' and map[p.l+10]>6
        and map[p.l+10]<10 then
          m[0]='Add ...'
        end
    --east
    elseif map[p.l+1]~=nil then
      if p.v=='e' and map[p.l+1]==5 or p.v=='e' and
      map[p.l+1]==8 or p.v=='e' and map[p.l+1]==10 or
      p.v=='e' and map[p.l+1]==12 then
        m[0]='Add ...'
      end
    -- west
    elseif map[p.l-1]~=nil then
    if p.v=='w' and map[p.l-1]==6 then
    --> 0 and map[p.l+c_mod[p.v]]<3 or
    --map[p.l+c_mod[p.v]] --> 3 and map[p.l+c_mod[p.v]]<13 then
    --p.v=='w' then
        m[0]='Add ...'
      end
    elseif map[p.l+c_mod[p.v]] ~= 1 then --and map[p.l-c_mod[p.v]]
      
      --m[0]=""
    elseif map[p.l]>8 and map[p.l] <20 then--or map[p.l]==3 then
      m[0]="Remove"
    elseif map[p.l+c_mod[p.v]] ~= nil then
      if not (map[p.l+c_mod[p.v]]==0) or not (map[p.l+c_mod[p.v]]>1 and map[p.l-10]<20) or map[p.l]==3 then
        m[1]='Remove'
      end
    end
    --interactive
    if map[p.l]==30 then --if actual grid has a npc
     m[2]='Interact ...'
    end 
    m[4]="Quit"
  end
  
  if m[6]=='interact' then
    m[0]='<< Back'
    m[1]='talk'
    --m[2]==''
  end
  
  if m[6]=='talk0' then
    m[0]='<< Back'
    m[1]='Greet ...'
    m[2]='Ask ...'
    m[3]='Order ...'
  end
  
  if m[6]=='add' then
    m[0]='<< Back'
    if p.v=='n' and map[p.l-20]~=nil then
      --north
      if map[p.l-20]==1 or map[p.l-20]==2 or map[p.l-20]==5
      or map[p.l-20]==6 or map[p.l-20]>9 and map[p.l-20]<14 then
        m[1]='Block'
        m[2]='Door'
      elseif map[p.l-20]==3 or map[p.l-20]==2 or map[p.l-20]==5
      or map[p.l-20]==6 or map[p.l-20]>9 and map[p.l-20]<14 then
    --    if map [p.l+c_mod[p.v]]==1 then
        m[1]='Door'
      end

    elseif p.v=='e' and map[p.l+2]~=nil then
      --north
      if map[p.l+2]==1 or map[p.l+2]==2 or map[p.l+2]==5
      or map[p.l+2]==6 or map[p.l+2]>9 and map[p.l+2]<14 then
        m[1]='Block'
        m[2]='Door'
      elseif map[p.l+2]==3 or map[p.l+2]==2 or map[p.l+2]==5
      or map[p.l+2]==6 or map[p.l+2]>9 and map[p.l+2]<14 then
    --    if map [p.l+c_mod[p.v]]==1 then
        m[1]='Door'
      end
      
    elseif p.v=='s' and map[p.l+20]~=nil then
      --north
      if map[p.l+20]==1 or map[p.l+20]==2 or map[p.l+20]==5
      or map[p.l+20]==6 or map[p.l+20]>9 and map[p.l+20]<14 then
        m[1]='Block'
        m[2]='Door'
      elseif map[p.l+20]==3 or map[p.l+20]==2 or map[p.l+20]==5
      or map[p.l+20]==6 or map[p.l+20]>9 and map[p.l+20]<14 then
    --    if map [p.l+c_mod[p.v]]==1 then
        m[1]='Door'
      end

    elseif p.v=='w' and map[p.l-2]~=nil then
      --north
      if map[p.l-2]==1 or map[p.l-2]==2 or map[p.l-2]==5
      or map[p.l-2]==6 or map[p.l-2]>9 and map[p.l-2]<14 then
        m[1]='Block'
        m[2]='Door'
      elseif map[p.l-2]==3 or map[p.l-2]==2 or map[p.l-2]==5
      or map[p.l-2]==6 or map[p.l-2]>9 and map[p.l-2]<14 then
    --    if map [p.l+c_mod[p.v]]==1 then
        m[1]='Door'
      end       
    --[[elseif map [p.l+1]==1 then
                  m[0]="<< Add"
                  m[1]='Block'
    elseif map [p.l+10]==1 then
                  m[0]="<< Add"
                  m[1]='Block'
    elseif map [p.l-1]==1 then
                  m[0]="<< Add"
                  m[1]='Block']]--
      --elseif map[p.l+c_mod[p.v]]==2 or
    
    -- if there is a block with no door on the wall player is look at
    -- or a block player can place a door
    elseif p.v==c_mod[p.v] and map[p.l+c_mod[p.v]]>3 and
    map[p.l+c_mod[p.v]]<10 or map[p.l+c_mod[p.v]]==2 then
        m[1]='Door'
     end

  end

  ---end
 --[[ if m[1]==nil then

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
  ]]--


end

function menu_objects()
  --if m[0]=="<< Objects" then
    --  if map[p.l]==1 then
        m[0]="<< Objects"
        m[1]="Sticks"
        m[2]="Stones"
        m[3]="Leaves"
end

function menu_add()
  if m[6]=='add' then
    
    m[0]="<< Add"
    
    if map [p.l-c_mod[p.v]] ~= nil and map [p.l-c_mod[p.v]]==1 then --and map [p.l-c_mod[p.v]]<8 then
              m[1]="Block"
        m[2]="Stones"
        m[3]="Leaves"
    else
      m[1]="Block"
    end
   -- else
   --   m[2]="Block"
    if map[p.l]==2 and m[2] ~= "Block" then
      m[2]="Doors ..."
    --else
    --  m[2]="Objects ..."
    end
    if m[2]=="Doors ..."then
      m[3]="Objects ..."
    end
  end
end
