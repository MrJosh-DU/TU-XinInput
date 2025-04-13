local amount = 30000 --export
local itemID = {262147665, 299255727, 3724036288, 4234772167} --export

local content
local pId = 1

if (amount == nil or amount < 0) or #itemID == 0 then
  system.setScreen('<p style="font-size: 80px; text-align: center; padding-top: '.. system.getScreenHeight()/4 ..'px;">Please check if the lua parameters are correct</p>')
  system.showScreen(true)
  unit.setTimer('exitA3', 3)
  return
else

  local itemExist = false
  local notExist = ''
  
  for k,v in ipairs(itemID) do
    if system.getItem(v).id == 0 then
       notExist = notExist .. system.getItem(v).displayName .. ', '
    end
  end
    
    if #notExist == 0 then
        itemExist = true
    end
    
    notExist = string.sub(notExist, 0, #notExist - 2)

  if not itemExist then
      system.setScreen('<p style="font-size: 80px; text-align: center; padding-top: '.. system.getScreenHeight()/4 ..'px;">'.. notExist .. ' does not exist</p>')
      system.showScreen(true)
      unit.setTimer('exitA3', 3)
      return
  else
    local itemNames = ''

    for i, v in ipairs(itemID) do
      itemNames = itemNames .. system.getItem(v).displayName .. ', '
    end

    itemNames = string.sub(itemNames, 0, #itemNames - 2)

      system.setScreen('<p style="font-size: 80px; text-align: center; padding-top: '.. system.getScreenHeight()/4 ..'px;">Items found: '.. itemNames ..'</p>')
      system.showScreen(true)
      unit.setTimer('screenA3', 3)
      input.updateContent()
      unit.setTimer('update', 30)
  end
end

local function exitA3()
  unit.exit()
end

local function screenA3()
  system.showScreen(0)
end

local function update()
  input.updateContent()
end

unit:onEvent('onTimer', function (source, timerID)
  if timerID == 'exitA3' then
    exitA3()
  elseif timerID == 'screenA3' then
    screenA3()
  elseif timerID == 'update' then
    update()
  end
end)

input:onEvent('onContentUpdate', function (source)
  content = input.getContent()

  if #content == 0 then
    return
  end

  if transfer.getState() ~= 1 then
    return
  end

  ::again::

  local isItemInStorage = false --Bool for the existence for the Item in Container
  local item

  for k,v in pairs(content) do
      if v.id == itemID[pId] then
          isItemInStorage = true
          item = v
      end
  end

  if isItemInStorage then
      if item.quantity > amount then
          transfer.setOutput(item.id)
          transfer.startFor(math.max(1, math.floor((item.quantity - amount)/transfer.getOutputs()[1].quantity)))
          pId = pId + 1
          if pId > #itemID then
            pId = 1
            return
          end
      end
    end
    pId = pId + 1
    if pId > #itemID then
      pId = 1
      return
    end
    goto again
end)

transfer:onEvent('onStatusChanged', function (source, status)
  if transfer.getState() ~= 1 then
    return
  end


  ::again::

  local isItemInStorage = false --Bool for the existence for the Item in Container
  local item

  for k,v in pairs(content) do
      if v.id == itemID[pId] then
          isItemInStorage = true
          item = v
      end
  end

  if isItemInStorage then
    if item.quantity > amount then
        transfer.setOutput(item.id)
        transfer.startFor(math.max(1, math.floor((item.quantity - amount)/transfer.getOutputs()[1].quantity)))
        pId = pId + 1
        if pId > #itemID then
          pId = 1
          return
        end
    end
  end
  pId = pId + 1
  if pId > #itemID then
    pId = 1
    return
  end
  goto again
end)