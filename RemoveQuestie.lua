RemoveQuestie_Selections = {}
local REMOVEQUESTIE_VERSION = "1.0"

-- Localización
local L = {}
local locale = GetLocale()

if locale == "esES" or locale == "esMX" then
  L.ABANDON_ALL = "Abandonar todas"
  L.ABANDON_SELECTED = "Abandonar seleccionadas"
  L.SELECT_ALL = "Seleccionar todas"
  L.UNSELECT_ALL = "Deseleccionar todas"
  L.ALL_ABANDONED = "Todas las misiones han sido abandonadas."
  L.SELECTED_ABANDONED = "Misiones seleccionadas abandonadas."
  L.NO_SELECTED = "No hay misiones seleccionadas para abandonar."
  L.ERROR_QUESTID = "ERROR: questID nil en checkbox"
  L.ADDON_LOADED = "cargado en la versión"
else
  L.ABANDON_ALL = "Abandon All"
  L.ABANDON_SELECTED = "Abandon Selected"
  L.SELECT_ALL = "Select All"
  L.UNSELECT_ALL = "Unselect All"
  L.ALL_ABANDONED = "All quests have been abandoned."
  L.SELECTED_ABANDONED = "Selected quests have been abandoned."
  L.NO_SELECTED = "No selected quests to abandon."
  L.ERROR_QUESTID = "ERROR: questID nil in checkbox"
  L.ADDON_LOADED = "loaded in version"
end

local function CreateRemoveQuestieButtons()
  if RemoveQuestie_AbandonAllButton then return end

  -- Botón: Abandonar todas
  local abandonAllBtn = CreateFrame("Button", "RemoveQuestie_AbandonAllButton", QuestLogFrame, "UIPanelButtonTemplate")
  abandonAllBtn:SetSize(120, 22)
  abandonAllBtn:SetText(L.ABANDON_ALL)
  abandonAllBtn:SetPoint("BOTTOMLEFT", QuestLogFrame, "BOTTOMLEFT", 188, -25)
  abandonAllBtn:SetScript("OnClick", function()
    local numEntries = GetNumQuestLogEntries()
    for i = numEntries, 1, -1 do
      local _, _, _, isHeader, _, _, _, questID = GetQuestLogTitle(i)
      if not isHeader and questID and questID ~= 0 then
        SelectQuestLogEntry(i)
        SetAbandonQuest()
        AbandonQuest()
        RemoveQuestie_Selections[questID] = nil
      end
    end
    print("|cffffff00[|r|cffd597ffRemoveQuestie|r|cffffff00]|r " .. L.ALL_ABANDONED)
  end)

  -- Botón: Abandonar seleccionadas
  local abandonSelectedBtn = CreateFrame("Button", "RemoveQuestie_AbandonSelectedButton", QuestLogFrame, "UIPanelButtonTemplate")
  abandonSelectedBtn:SetSize(160, 22)
  abandonSelectedBtn:SetText(L.ABANDON_SELECTED)
  abandonSelectedBtn:SetPoint("BOTTOMLEFT", QuestLogFrame, "BOTTOMLEFT", 4.5, -25)
  abandonSelectedBtn:SetScript("OnClick", function()
    local hasSelected = false
    local numEntries = GetNumQuestLogEntries()
    for i = numEntries, 1, -1 do
      local _, _, _, isHeader, _, _, _, questID = GetQuestLogTitle(i)
      if not isHeader and questID and questID ~= 0 and RemoveQuestie_Selections[questID] then
        SelectQuestLogEntry(i)
        SetAbandonQuest()
        AbandonQuest()
        RemoveQuestie_Selections[questID] = nil
        hasSelected = true
      end
    end
    if hasSelected then
      print("|cffffff00[|r|cffd597ffRemoveQuestie|r|cffffff00]|r " .. L.SELECTED_ABANDONED)
    else
      print("|cffffff00[|r|cffff00ffRemoveQuestie|r|cffffff00]|r " .. L.NO_SELECTED)
    end
  end)

  -- Botón: Seleccionar todas
  local selectAllBtn = CreateFrame("Button", "RemoveQuestie_SelectAllButton", QuestLogFrame, "UIPanelButtonTemplate")
  selectAllBtn:SetSize(120, 22)
  selectAllBtn:SetText(L.SELECT_ALL)
  selectAllBtn:SetPoint("TOPLEFT", QuestLogFrame, "TOPLEFT", 195, -32)
  selectAllBtn:SetScript("OnClick", function()
    local numEntries = GetNumQuestLogEntries()
    for i = 1, numEntries do
      local _, _, _, isHeader, _, _, _, questID = GetQuestLogTitle(i)
      if not isHeader and questID and questID ~= 0 then
        RemoveQuestie_Selections[questID] = true
      end
    end
    QuestLog_Update()
  end)

  -- Botón: Deseleccionar todas
  local unselectAllBtn = CreateFrame("Button", "RemoveQuestie_UnselectAllButton", QuestLogFrame, "UIPanelButtonTemplate")
  unselectAllBtn:SetSize(140, 22)
  unselectAllBtn:SetText(L.UNSELECT_ALL)
  unselectAllBtn:SetPoint("TOPLEFT", QuestLogFrame, "TOPLEFT", 317, -32)
  unselectAllBtn:SetScript("OnClick", function()
    for k in pairs(RemoveQuestie_Selections) do
      RemoveQuestie_Selections[k] = nil
    end
    QuestLog_Update()
  end)
end

local function HookQuestLogCheckboxes()
  local buttons = QuestLogListScrollFrame.buttons or {}
  for _, button in ipairs(buttons) do
    local questIndex = button:GetID()
    if questIndex then
      local _, _, _, isHeader, _, _, _, questID = GetQuestLogTitle(questIndex)
      if not isHeader and questID and questID ~= 0 then
        if not button.checkbox then
          local cb = CreateFrame("CheckButton", nil, button, "UICheckButtonTemplate")
          cb:SetSize(18, 18)
          cb:SetPoint("LEFT", button, "LEFT", 10, 0)
          cb:SetAlpha(1)
          cb:Show()
          cb:SetScript("OnClick", function(self)
            if questID and questID ~= 0 then
              RemoveQuestie_Selections[questID] = self:GetChecked() or nil
            else
              print("|cffffff00[|r|cffff00ffRemoveQuestie|r|cffffff00]|r " .. L.ERROR_QUESTID)
            end
          end)
          button.checkbox = cb
        end
        button.checkbox:SetChecked(RemoveQuestie_Selections[questID] or false)
        button.checkbox:Show()
      elseif button.checkbox then
        button.checkbox:Hide()
      end
    end
  end
end

function RemoveQuestie_OnLoad()
  hooksecurefunc("QuestLog_Update", HookQuestLogCheckboxes)
  CreateRemoveQuestieButtons()

  local version = GetAddOnMetadata("RemoveQuestie", "Version") or REMOVEQUESTIE_VERSION
  print("|cffffff00[|r|cffd597ffRemoveQuestie|r|cffffff00]|r " .. L.ADDON_LOADED .. " |cffffff00" .. version .. "|r.")
end

-- Eventos
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
  RemoveQuestie_OnLoad()
end)

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("QUEST_LOG_UPDATE")
frame:RegisterEvent("QUEST_LOG_SHOW")

frame:SetScript("OnEvent", function(self, event, ...)
  if event == "PLAYER_LOGIN" then
    RemoveQuestie_OnLoad()
  elseif event == "QUEST_LOG_UPDATE" or event == "QUEST_LOG_SHOW" then
    HookQuestLogCheckboxes()
  end
end)
