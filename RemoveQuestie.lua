RemoveQuestie_Selections = {}
local REMOVEQUESTIE_VERSION = "1.01"

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
elseif locale == "deDE" then -- Alemán
  L.ABANDON_ALL = "Alle abbrechen"
  L.ABANDON_SELECTED = "Ausgewählte abbrechen"
  L.SELECT_ALL = "Alle auswählen"
  L.UNSELECT_ALL = "Auswahl aufheben"
  L.ALL_ABANDONED = "Alle Quests wurden abgebrochen."
  L.SELECTED_ABANDONED = "Ausgewählte Quests abgebrochen."
  L.NO_SELECTED = "Keine Quests ausgewählt zum Abbrechen."
  L.ERROR_QUESTID = "FEHLER: questID nil in Checkbox"
  L.ADDON_LOADED = "geladen in Version"
elseif locale == "frFR" then -- Francés
  L.ABANDON_ALL = "Abandonner tout"
  L.ABANDON_SELECTED = "Abandonner sélectionnés"
  L.SELECT_ALL = "Tout sélectionner"
  L.UNSELECT_ALL = "Tout désélectionner"
  L.ALL_ABANDONED = "Toutes les quêtes ont été abandonnées."
  L.SELECTED_ABANDONED = "Quêtes sélectionnées abandonnées."
  L.NO_SELECTED = "Aucune quête sélectionnée à abandonner."
  L.ERROR_QUESTID = "ERREUR : questID nil dans la case"
  L.ADDON_LOADED = "chargé en version"
elseif locale == "ruRU" then -- Ruso
  L.ABANDON_ALL = "Отменить все"
  L.ABANDON_SELECTED = "Отменить выбранные"
  L.SELECT_ALL = "Выбрать все"
  L.UNSELECT_ALL = "Снять выбор"
  L.ALL_ABANDONED = "Все задания отменены."
  L.SELECTED_ABANDONED = "Выбранные задания отменены."
  L.NO_SELECTED = "Нет выбранных заданий для отмены."
  L.ERROR_QUESTID = "ОШИБКА: questID nil в флажке"
  L.ADDON_LOADED = "загружен в версии"
elseif locale == "zhCN" then -- Chino simplificado
  L.ABANDON_ALL = "放弃所有"
  L.ABANDON_SELECTED = "放弃选中"
  L.SELECT_ALL = "全选"
  L.UNSELECT_ALL = "取消全选"
  L.ALL_ABANDONED = "所有任务已被放弃。"
  L.SELECTED_ABANDONED = "已放弃选中任务。"
  L.NO_SELECTED = "没有选中任务可放弃。"
  L.ERROR_QUESTID = "错误：checkbox中questID为空"
  L.ADDON_LOADED = "已加载版本"
elseif locale == "zhTW" then -- Chino tradicional
  L.ABANDON_ALL = "放棄所有"
  L.ABANDON_SELECTED = "放棄選中"
  L.SELECT_ALL = "全選"
  L.UNSELECT_ALL = "取消全選"
  L.ALL_ABANDONED = "所有任務已被放棄。"
  L.SELECTED_ABANDONED = "已放棄選中任務。"
  L.NO_SELECTED = "沒有選中任務可放棄。"
  L.ERROR_QUESTID = "錯誤：checkbox中questID為空"
  L.ADDON_LOADED = "已加載版本"
elseif locale == "koKR" then -- Coreano
  L.ABANDON_ALL = "모두 포기"
  L.ABANDON_SELECTED = "선택한 퀘스트 포기"
  L.SELECT_ALL = "모두 선택"
  L.UNSELECT_ALL = "선택 해제"
  L.ALL_ABANDONED = "모든 퀘스트를 포기했습니다."
  L.SELECTED_ABANDONED = "선택한 퀘스트를 포기했습니다."
  L.NO_SELECTED = "포기할 선택한 퀘스트가 없습니다."
  L.ERROR_QUESTID = "오류: 체크박스에 questID 없음"
  L.ADDON_LOADED = "버전 로드 완료"
else
  -- Inglés por defecto
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
  abandonAllBtn:SetSize(130, 22) -- ancho aumentado para idiomas largos
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
  RemoveQuestie_AbandonSelectedButton = CreateFrame("Button", "RemoveQuestie_AbandonSelectedButton", QuestLogFrame, "UIPanelButtonTemplate")
  RemoveQuestie_AbandonSelectedButton:SetSize(180, 22) -- ancho aumentado
  RemoveQuestie_AbandonSelectedButton:SetText(L.ABANDON_SELECTED)
  RemoveQuestie_AbandonSelectedButton:SetPoint("BOTTOMLEFT", QuestLogFrame, "BOTTOMLEFT", 4.5, -25)
  RemoveQuestie_AbandonSelectedButton:SetScript("OnClick", function()
    local questIDToIndex = {}
    local numEntries = GetNumQuestLogEntries()

    -- Paso 1: Mapear questID → índice actual
    for i = 1, numEntries do
      local _, _, _, isHeader, _, _, _, questID = GetQuestLogTitle(i)
      if not isHeader and questID then
        questIDToIndex[questID] = i
      end
    end

    local hasSelected = false

    -- Paso 2: Abandonar solo los questID seleccionados
    for questID, _ in pairs(RemoveQuestie_Selections) do
      local index = questIDToIndex[questID]
      if index then
        SelectQuestLogEntry(index)
        SetAbandonQuest()
        AbandonQuest()
        RemoveQuestie_Selections[questID] = nil
        hasSelected = true
      end
    end

    if hasSelected then
      print("|cffffff00[|r|cffd597ffRemoveQuestie|r|cffffff00]|r " .. L.ABANDON_SELECTED)
    else
      print("|cffffff00[|r|cffff00ffRemoveQuestie|r|cffffff00]|r " .. L.NO_SELECTED)
    end
  end)

  -- Botón: Seleccionar todas
  local selectAllBtn = CreateFrame("Button", "RemoveQuestie_SelectAllButton", QuestLogFrame, "UIPanelButtonTemplate")
  selectAllBtn:SetSize(130, 22) -- ancho aumentado
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
  unselectAllBtn:SetSize(150, 22) -- ancho aumentado
  unselectAllBtn:SetText(L.UNSELECT_ALL)
  unselectAllBtn:SetPoint("TOPLEFT", QuestLogFrame, "TOPLEFT", 327, -32)
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
            local questIndex = self:GetParent():GetID()
            local _, _, _, isHeader, _, _, _, questID = GetQuestLogTitle(questIndex)
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
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("QUEST_LOG_UPDATE")

frame:SetScript("OnEvent", function(self, event, ...)
  if event == "PLAYER_LOGIN" then
    RemoveQuestie_OnLoad()
  elseif event == "QUEST_LOG_UPDATE" then
    HookQuestLogCheckboxes()
  end
end)