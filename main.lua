require "l_vars"
require "render"
require "input"
require "menu"
require 'code'



function love.load()
  vars()

  w = lg.getWidth()
  h = lg.getHeight()
   
  g = {  -- game table
    state = 0,
    turn = 0,
    day_cycle = 7
    }
  c_i_mod = {
    n = 10,
    e = 1,
    s = 10,
    w = -1,
    }
  world = { --world table code named s for sandbox
    size = 100, -- total grid size 
    }
  map = {}
  sandbox()
  p = {    -- player table
    --c_sc = ""
    gender = 0,
    st = 0, -- strength
    xp = 0, -- experience
    hp = 0, -- health
    backpack = false,
    heading = 'n',
    compas = {},
    compas = {10,1,10,1},
    start = 25,
    turn_c = 0, -- current turn
    turn_p = 0, -- previous turn 
    a = {},
    
    x = 00,
    y = 00,
    z = 00,  -- altitud    
    l = 0,   -- 0 north, 1 northeast, 2 east, 3 southeast, 4 south, 5 southwest,
            -- 6 west, 7 northwest
    location = tittle,
    sc_name = "The hall",
  }
  --p.compas = {0,1,2,3}
  objects = {
    id = {},
    name = {},
    c = {},  -- countity of objects in a 
    x = 0,
    y = 0,
    w = 0,
    h = 0,
    sl = 0,
    toogle = false
  }
  
 time = 0
  
  save = love.filesystem.getSaveDirectory()
  
  c  = 0
 -- filename = 0000000-- tostring(nx)..tostring(ny)..tostring(nz)..tostring(c)
  f = 0  
  
  initial_dialogs = {}
  
  sc_initial_text ={}
  i = 0
  repeat
    sc_initial_text[i] = ""
    i = i + 1
  until i == 1000009
  
  --the inventory
	inv = {}
		inv.x = lg.getWidth() - 64
		inv.y = lg.getHeight() - 128
		inv.w = 64
		inv.h = 128
    inv.lefthand = 0
    inv.righthand = 0
    inv.slot = {}
		--button = lg.newImage("images/inv_off.png"), -- use a png, not a bmp!
		--button_clicked = lg.newImage("images/inv_on.png"),
		--inv = lg.newImage('images/inv.png'),
    inv.slot.id = {}
    inv.slot.c = {}
    i = 0
    repeat
      inv.slot.c[i] = 0
      i = i+1
    until i == 4
    inv.toggle = false
    
    --icon_empty_hand =
  
    hotspot01 = {
   	x = w/2-64,
		y = h/2-64,
    w = 32,
    h = 32,
    status = 0,
    --icon_l_hand = lg.newImage("images/hotspots/portal_1.png"),
    toggle = false
    
  }
  
      hotspot02 = {
   	x = w-192,
		y = h-96,
    w = 32,
    h = 32,
    status = 0,
    --icon_l_hand = lg.newImage("images/hotspots/portal_1.png"),
    toggle = false
    
  }
  
      hotspot03 = {
   	x = w-192,
		y = h-48,
    w = 32,
    h = 32,
    status = 0,
    --icon_l_hand = lg.newImage("images/hotspots/portal_1.png"),
    toggle = false
    
  }
  
      hotspot04 = {
   	x = w-234,
		y = h-72,
    w = 32,
    h = 32,
    status = 0,
    --icon_l_hand = lg.newImage("images/hotspots/portal_1.png"),
    toggle = false
    
  }
  
  hotspot05 = {
   	x = w-148,
		y = h-72,
    w = 128,
    h = 32,
    status = 0,
    --icon_l_hand = lg.newImage("images/hotspots/portal_1.png"),
    toggle = false
    
  }	
  
  --[[l_hand = {
   	x = lg.getWidth() - lg.getWidth() + 64,
		y = lg.getHeight() - 128+64,
    w = 64,
    h = 64,
    status = 0,
    icon_l_hand = lg.newImage("images/icons/l_hand.png"),
    toggle = true
    
  }
  
  --right hand
  r_hand = {
   -- sc00_hotspot01
   	x = lg.getWidth() - 192,
		y = lg.getHeight() - 128+64,
    w = 64,
    h = 64,
    status = 0,
    icon_l_hand = lg.newImage("images/icons/l_hand.png"),
    toggle = true
    
    }
  

 
  --inv = 0
  inv_button = lg.newImage( 'images/inv_off.png' )
  inv_button_c = lg.newImage( 'images/inv_on.png' )
  w = lg.getWidth()
  h = lg.getHeight()
  --]]
  -- check if initial_dialogs file exists and if so load it in to a table

  if lf.exists('initial_dialogs.txt') then
  for line in lf.lines('initial_dialogs.txt') do
    table.insert(initial_dialogs, line)
  end
  end

  -- check if dialogs file exists and if so load it in to a table
  if lf.exists('dialogs.txt') then
    dialogs = {}
    for line in lf.lines('dialogs.txt') do
      table.insert(dialogs, line)
    end
  end

  
  --title = "The great main hall"
  --love.window.setTitle( title )
-- love.window.setMode(1024, 600, {resizable=true, vsync=false, minwidth=400, minheight=300})
  
  -- check if options file exists and if so load it in to a table
  if not lf.exists('options.txt') then
  -- the game has 2 graphics modes 0 ( build in graphics ) and 1 ( custom png scenes )
  --graphics = 0
 
  ---list_pngs_found = {} 
  -- player info location, looking at

  
 -- p.start = 25

  
  --[[menu = {
   	x = w-192,
		y = h-96,
    w = 128,
    h = 32,
    status = 0,
    --icon_l_hand = lg.newImage("images/hotspots/portal_1.png"),
    toggle = {}
    toggle[i] = false
    
  } --]] 
  
  
  --i = 0
  --inv.slots = [i]
  
  -- interactive options, a menu like for the player to use
  i = 0
  m = {} -- main menu of the game
  --  repeat 
  --    m[i] = "nil"
  --    i = i +1
  --  until i == 5
  m[6] = 'intro'
    
      
  --[[  i = 0
    menu = {}
    repeat 
      menu[i] = "nil"
      i = i +1
    until i == 5
    i = 0
    menu.item_enabled = {}
    repeat
      menu.item_enabled[i] = false
      i = i + 1
    until i == 5
   --]] 
    
  elseif lf.exists('options.txt') then
    options = {}
    for line in lf.lines('options.txt') do
      table.insert(options, line)
    end
    
    load_info()
    
   -- s = string.find('map' 
    
    

  
  -- the idea is each user can have their own scene_library
  -- a sc_lib is a collection or a game with their selected pictures
  
 -- scene = {
  --  name = "" -- if is empty the hall scene will have spot 5 disable
    
  --  sc_initial_text = {}  -- each scene can hava initial text
    
--  }
  
  sc_tittle = {}
  -- each scene can have an initial text box if the player wants.

  cursor = love.mouse.getSystemCursor("hand")

  nx = 00
  ny = 00
  nz = 00
  c  = 0
 -- filename = tostring(nx)..tostring(ny)..tostring(nz)..tostring(c)
  f = 0

 --if f == 0 then
 --  if love.filesystem.exists(filename..'.png') == true then
  --   f = 1
  -- end  
 -- end

  i = 0
  m = {}
    repeat 
      m[i] = ""
      i = i +1
    until i == 7
  menu()
  edit_mode = 0  
  --c_i_mod = {}
  
lg.setFont(font20)

end
if arg[#arg] == "-debug" then require("mobdebug").start() end
end


function load_info()
  --player= {}
  local A = ''
    
    --A = 'player x'
   -- search_for(A)
   -- p.x = A
    
  --  A = 'player y'
  --  search_for(A)
   -- p.y = A
    
    --A = 'player z'
   -- search_for(A)
   -- p.z = A
    
    --A = 'map 01'
    --search_for(A)
    local I
    local B
    I = 1
    B = 0
    repeat
     map[I] = tonumber(options[I])
     --[[ B = string.sub(A,-2)
        if not (B >= '00' and B <= '99') then
          B = string.sub(A,-1) 
        end
      if B == 'a' then
        map[I] = 0
      elseif B == 'b' then
        map[I] = 1
      elseif B == 'c' then
        map[I] = 2
      elseif B == 'd' then
        map[I] = 3
      elseif B == 'e' then
        map[I] = 4
      elseif B == 'f' then
        map[I] = 5
      elseif B == 'g' then
        map[I] = 6
      elseif B == 'h' then
        map[I] = 7
      elseif B == 'i' then
        map[I] = 8
      elseif B == 'j' then
      map[0] = 9
      end]]--
    I = I + 1
    until I == 100
end


        
function save_game()
 -- if not lf.exists('options.txt') then
    local F 
    F = lf.newFile('options.txt')
    F:open('w')
    -- map get saved to a string
   -- F:write('Map 01'.."\n")
    --F:append() 
    I= 0
    repeat
    --[[local B = map[I]
    if B == 0 then
      B = 'a'
    elseif B == 1 then
      B = 'b'
    elseif B == 2 then
      B = 'c'
    elseif B == 3 then
      B = 'd'
    elseif B == 4 then
      B = 'e'
    elseif B == 5 then
      B = 'f'
    elseif B == 6 then
      B = 'g'
    elseif B == 7 then
      B = 'h'
    elseif B == 8 then
      B = 'i'
    elseif B == 9 then
      B = 'j']]
   --end
   --B = B..','
    --B =
    if I ~= nil then
      F:write(map[I].."\n")
    end
I = I + 1
  until I == 100
    F:close()
 -- end
end

function search_for(A)
  local I
  local A
  I = 0
  repeat
    if options[I] == A then
      A = tostring(options[I+1])
      return(A)
    end
  I = I + 1
  until I == 10
end


function love.update(dt)
  local x = love.mouse.getX()
  local y = love.mouse.getY()
 --[[   	if x >= sc00_hotspot01.x and x <= sc00_hotspot01.x + sc00_hotspot01.w and y >= sc00_hotspot01.y and y <= sc00_hotspot01.y + sc00_hotspot01.h then
		sc00_hotspot01.toggle = true-- not sc00_hotspot01.toggle
        lg.circle ("fill", sc00_hotspot01.x, sc00_hotspot01.y, sc00_hotspot01.w, sc00_hotspot01.h)
    love.graphics.printf("This text is aligned center",100, h-520, 200,"center")
	end]]
end



function love.draw()
   
    -- if no images found we make a empty room
 --  check_background()
   --if graphics == 0 then
     -- an empty room will be drawn
  if g.state == 0 then
   --sandbox()
    draw_start()
    --draw_sc()
    --menu()

  end

  if g.state == 1 then
     --game_rules_default()
     draw_sc()

     --lg.setColor(255,255,255,255)
     --lg.polygon('line',1,1 , w/2-192,h/2-96, w/2-192,h/2+96, 1,500)
    -- lg.polygon('line',1,1 , w/2-192,h/2-96, w/2-192+64,h/2+96, 1,500)
  --   lg.rectangle('line',w/2-192,h/2-96,384,192)
--     lg.polygon('line',w,1 , w/2+192,204, w/2+192,396, w,500 )
   
     -- player can add a story if he or she wants to.
 --    if sc_initial_text[tonumber(filename)] == nil then
   --[[    lg.setColor(255,255,128,255)
       lg.rectangle('fill',1,1,256,128)
       i = 1
       y = 16
     repeat
       lg.setColor(C_WHITE)
       lg.print(dialogs[i],16,y)
       y = y + 16
       i = i+1
     until i == 3
    end]]--
  -- contents, size = love.filesystem.read( save..'/'..a , all )
   --love.filesystem.write
   -- players interactive options
   --if graphics == 0 and 
--   if m.toggle == true then

  --  end



 --[[ if l_hand.toggle then
   -- lg.draw(l_hand.icon_l_hand, l_hand.x, l_hand.y)
  else
    
  end
  
  if l_hand.toggle then
   -- lg.draw(r_hand.icon_l_hand, r_hand.x, r_hand.y)
  else
    
  end
  ]]--
  
  --[[if hotspot01.toggle then
    --lg.rectangle ("line", hotspot01.x+16, hotspot01.y+128, hotspot01.w, hotspot01.h)
  
   -- love.graphics.printf("This text is aligned center",100, h-520, 200,"center") -- center your text around x = 200/2 + 100 = 200
 -- else
   -- lg.rectangle ('line', hotspot01.x, hotspot01.y, hotspot01.w, hotspot01.h)
 -- end
 -- love.graphics.setColor(255,255,255,255)
  --love.graphics.print(save, 320, 20)
  --if inv == 0 then
 --- lg.draw(inv.button, w-64,h-128 )
  
  --elseif inv == 1 then
  --lg.draw(inv_button_c, w-64,h-128 )
  --end--]]
  i = 0
  x = w-192
  y = 8
  repeat
    if i % 10 == 0 then
      y=y+16
      x=w-192
      lgp(map[i] ,x,y)
    elseif i % 10 ~= 10 then
      x = x + 24
      lgp(map[i],x,y)
    end
    i = i +1
   until i == 100 
     lg.setColor(C_WHITE)
     lgp(p.heading.. p.turn_c,32,h/2)
    end
  menu()
    gui()
end