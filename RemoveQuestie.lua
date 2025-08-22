RemoveQuestie_Selections = {}
local REMOVEQUESTIE_VERSION = "1.02"

-- Localización
local L = {}
local locale = GetLocale()

if locale == "esES" or locale == "esMX" then
  L.ABANDON_ALL = "Abandonar todas"
  L.ABANDON_SELECTED = "Abandonar seleccionadas"
  L.SELECT_ALL = "Seleccionar todas"
  L.UNSELECT_ALL = "Deseleccionar todas"
  L.ALL_ABANDONED = "Todas las misiones han sido abandonadas."
  L.ABANDON_TEXT = "Has abandonado: "
  L.SELECTED_ABANDONED = "Misiones seleccionadas abandonadas."
  L.NO_SELECTED = "No hay misiones seleccionadas para abandonar."
  L.ERROR_QUESTID = "ERROR: questID nil en checkbox"
  L.ADDON_LOADED = "cargado en la versión"
elseif locale == "deDE" then
  L.ABANDON_ALL = "Alle aufgeben"
  L.ABANDON_SELECTED = "Ausgewählte aufgeben"
  L.SELECT_ALL = "Alle auswählen"
  L.UNSELECT_ALL = "Alle abwählen"
  L.ALL_ABANDONED = "Alle Quests wurden aufgegeben."
  L.ABANDON_TEXT = "Du hast aufgegeben: "
  L.SELECTED_ABANDONED = "Ausgewählte Quests wurden aufgegeben."
  L.NO_SELECTED = "Keine ausgewählten Quests zum Aufgeben."
  L.ERROR_QUESTID = "FEHLER: questID nil im Kontrollkästchen"
  L.ADDON_LOADED = "geladen in Version"
elseif locale == "frFR" then
  L.ABANDON_ALL = "Abandonner tout"
  L.ABANDON_SELECTED = "Abandonner sélectionnées"
  L.SELECT_ALL = "Tout sélectionner"
  L.UNSELECT_ALL = "Tout désélectionner"
  L.ALL_ABANDONED = "Toutes les quêtes ont été abandonnées."
  L.ABANDON_TEXT = "Vous avez abandonné : "
  L.SELECTED_ABANDONED = "Quêtes sélectionnées abandonnées."
  L.NO_SELECTED = "Aucune quête sélectionnée à abandonner."
  L.ERROR_QUESTID = "ERREUR : questID nil dans la case à cocher"
  L.ADDON_LOADED = "chargé dans la version"
elseif locale == "zhCN" then
  L.ABANDON_ALL = "放弃全部"
  L.ABANDON_SELECTED = "放弃选中"
  L.SELECT_ALL = "全选"
  L.UNSELECT_ALL = "取消全选"
  L.ALL_ABANDONED = "所有任务已被放弃。"
  L.ABANDON_TEXT = "你已放弃："
  L.SELECTED_ABANDONED = "已放弃选中的任务。"
  L.NO_SELECTED = "没有选中的任务可供放弃。"
  L.ERROR_QUESTID = "错误：checkbox 中的 questID 为 nil"
  L.ADDON_LOADED = "在版本中加载"
elseif locale == "zhTW" then
  L.ABANDON_ALL = "放棄全部"
  L.ABANDON_SELECTED = "放棄選擇"
  L.SELECT_ALL = "全選"
  L.UNSELECT_ALL = "取消全選"
  L.ALL_ABANDONED = "所有任務已被放棄。"
  L.ABANDON_TEXT = "你已放棄："
  L.SELECTED_ABANDONED = "已放棄選中的任務。"
  L.NO_SELECTED = "沒有選中的任務可供放棄。"
  L.ERROR_QUESTID = "錯誤：checkbox 中的 questID 為 nil"
  L.ADDON_LOADED = "在版本中載入"
elseif locale == "koKR" then
  L.ABANDON_ALL = "모두 포기"
  L.ABANDON_SELECTED = "선택한 퀘스트 포기"
  L.SELECT_ALL = "모두 선택"
  L.UNSELECT_ALL = "모두 선택 해제"
  L.ALL_ABANDONED = "모든 퀘스트가 포기되었습니다."
  L.ABANDON_TEXT = "포기한 퀘스트: "
  L.SELECTED_ABANDONED = "선택한 퀘스트가 포기되었습니다."
  L.NO_SELECTED = "포기할 선택된 퀘스트가 없습니다."
  L.ERROR_QUESTID = "오류: checkbox의 questID가 nil입니다."
  L.ADDON_LOADED = "버전에서 로드됨"
elseif locale == "ruRU" then
  L.ABANDON_ALL = "Отказаться от всех"
  L.ABANDON_SELECTED = "Отказаться от выбранных"
  L.SELECT_ALL = "Выбрать все"
  L.UNSELECT_ALL = "Снять выбор со всех"
  L.ALL_ABANDONED = "Все задания были отменены."
  L.ABANDON_TEXT = "Вы отказались от: "
  L.SELECTED_ABANDONED = "Выбранные задания отменены."
  L.NO_SELECTED = "Нет выбранных заданий для отмены."
  L.ERROR_QUESTID = "ОШИБКА: questID nil в флажке"
  L.ADDON_LOADED = "загружен в версии"
elseif locale == "ptBR" then
  L.ABANDON_ALL = "Abandonar Todos"
  L.ABANDON_SELECTED = "Abandonar Selecionados"
  L.SELECT_ALL = "Selecionar Todos"
  L.UNSELECT_ALL = "Desmarcar Todos"
  L.ALL_ABANDONED = "Todas as missões foram abandonadas."
  L.ABANDON_TEXT = "Você abandonou: "
  L.SELECTED_ABANDONED = "Missões selecionadas abandonadas."
  L.NO_SELECTED = "Nenhuma missão selecionada para abandonar."
  L.ERROR_QUESTID = "ERRO: questID nil na caixa de seleção"
  L.ADDON_LOADED = "carregado na versão"
elseif locale == "itIT" then
  L.ABANDON_ALL = "Abbandona Tutto"
  L.ABANDON_SELECTED = "Abbandona Selezionate"
  L.SELECT_ALL = "Seleziona Tutto"
  L.UNSELECT_ALL = "Deseleziona Tutto"
  L.ALL_ABANDONED = "Tutte le missioni sono state abbandonate."
  L.ABANDON_TEXT = "Hai abbandonato: "
  L.SELECTED_ABANDONED = "Missioni selezionate abbandonate."
  L.NO_SELECTED = "Nessuna missione selezionata da abbandonare."
  L.ERROR_QUESTID = "ERRORE: questID nil nella casella di controllo"
  L.ADDON_LOADED = "caricato nella versione"
elseif locale == "ptPT" then
  L.ABANDON_ALL = "Abandonar Todas"
  L.ABANDON_SELECTED = "Abandonar Selecionadas"
  L.SELECT_ALL = "Selecionar Todas"
  L.UNSELECT_ALL = "Desmarcar Todas"
  L.ALL_ABANDONED = "Todas as missões foram abandonadas."
  L.ABANDON_TEXT = "Você abandonou: "
  L.SELECTED_ABANDONED = "Missões selecionadas abandonadas."
  L.NO_SELECTED = "Nenhuma missão selecionada para abandonar."
  L.ERROR_QUESTID = "ERRO: questID nil na caixa de seleção"
  L.ADDON_LOADED = "carregado na versão"
elseif locale == "jaJP" then
  L.ABANDON_ALL = "すべて放棄"
  L.ABANDON_SELECTED = "選択したクエストを放棄"
  L.SELECT_ALL = "すべて選択"
  L.UNSELECT_ALL = "すべて選択解除"
  L.ALL_ABANDONED = "すべてのクエストが放棄されました。"
  L.ABANDON_TEXT = "放棄したクエスト: "
  L.SELECTED_ABANDONED = "選択したクエストを放棄しました。"
  L.NO_SELECTED = "放棄する選択されたクエストがありません。"
  L.ERROR_QUESTID = "エラー: checkboxのquestIDがnilです。"
  L.ADDON_LOADED = "バージョンでロードされました"
else
  L.ABANDON_ALL = "Abandon All"
  L.ABANDON_SELECTED = "Abandon Selected"
  L.SELECT_ALL = "Select All"
  L.UNSELECT_ALL = "Unselect All"
  L.ALL_ABANDONED = "All quests have been abandoned."
  L.ABANDON_TEXT = "You have abandoned: "
  L.SELECTED_ABANDONED = "Selected quests have been abandoned."
  L.NO_SELECTED = "No selected quests to abandon."
  L.ERROR_QUESTID = "ERROR: questID nil in checkbox"
  L.ADDON_LOADED = "loaded in version"
end

local function CreateRemoveQuestieButtons()
  if RemoveQuestie_AbandonAllButton then return end

  -- Botón: Abandonar todas
  local abandonAllBtn = CreateFrame("Button", "RemoveQuestie_AbandonAllButton", QuestLogFrame, "UIPanelButtonTemplate")
  abandonAllBtn:SetSize(130, 22)
  abandonAllBtn:SetText(L.ABANDON_ALL)
  abandonAllBtn:SetPoint("BOTTOMLEFT", QuestLogFrame, "BOTTOMLEFT", 188, -25)
  abandonAllBtn:SetScript("OnClick", function()
    local numEntries = GetNumQuestLogEntries()
    local abandonedAny = false
    for i = numEntries, 1, -1 do
      local title, _, _, isHeader, _, _, _, questID = GetQuestLogTitle(i)
      if not isHeader and questID and questID ~= 0 then
        SelectQuestLogEntry(i)
        SetAbandonQuest()
        AbandonQuest()
        RemoveQuestie_Selections[questID] = nil
        if title then
          print("|cffffff00[|r|cffd597ffRemoveQuestie|r|cffffff00]|r " .. L.ABANDON_TEXT .. "|cffffff00" .. title .. "|r")
        end
        abandonedAny = true
      end
    end
    if abandonedAny then
      print("|cffffff00[|r|cffd597ffRemoveQuestie|r|cffffff00]|r " .. L.ALL_ABANDONED)
    end
  end)

  -- Botón: Abandonar seleccionadas
  RemoveQuestie_AbandonSelectedButton = CreateFrame("Button", "RemoveQuestie_AbandonSelectedButton", QuestLogFrame, "UIPanelButtonTemplate")
  RemoveQuestie_AbandonSelectedButton:SetSize(180, 22)
  RemoveQuestie_AbandonSelectedButton:SetText(L.ABANDON_SELECTED)
  RemoveQuestie_AbandonSelectedButton:SetPoint("BOTTOMLEFT", QuestLogFrame, "BOTTOMLEFT", 4.5, -25)
  RemoveQuestie_AbandonSelectedButton:SetScript("OnClick", function()
    local questIDToIndex = {}
    local numEntries = GetNumQuestLogEntries()

    -- Mapear questID → índice
    for i = 1, numEntries do
      local _, _, _, isHeader, _, _, _, questID = GetQuestLogTitle(i)
      if not isHeader and questID then
        questIDToIndex[questID] = i
      end
    end

    local hasSelected = false

    for questID, _ in pairs(RemoveQuestie_Selections) do
      local index = questIDToIndex[questID]
      if index then
        local title = GetQuestLogTitle(index)
        SelectQuestLogEntry(index)
        SetAbandonQuest()
        AbandonQuest()
        RemoveQuestie_Selections[questID] = nil
        hasSelected = true
        if title then
          print("|cffffff00[|r|cffd597ffRemoveQuestie|r|cffffff00]|r " .. L.ABANDON_TEXT .. "|cffffff00" .. title .. "|r")
        end
      end
    end

    if hasSelected then
      print("|cffffff00[|r|cffd597ffRemoveQuestie|r|cffffff00]|r " .. L.SELECTED_ABANDONED)
    else
      print("|cffffff00[|r|cffd597ffRemoveQuestie|r|cffffff00]|r " .. L.NO_SELECTED)
    end
  end)

  -- Botón: Seleccionar todas
  local selectAllBtn = CreateFrame("Button", "RemoveQuestie_SelectAllButton", QuestLogFrame, "UIPanelButtonTemplate")
  selectAllBtn:SetSize(130, 22)
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
  unselectAllBtn:SetSize(150, 22)
  unselectAllBtn:SetText(L.UNSELECT_ALL)
  unselectAllBtn:SetPoint("TOPLEFT", QuestLogFrame, "TOPLEFT", 327, -32)
  unselectAllBtn:SetScript("OnClick", function()
    for k in pairs(RemoveQuestie_Selections) do
      RemoveQuestie_Selections[k] = nil
    end
    QuestLog_Update()
  end)
end

-- Hook de los checkboxes
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
              print("|cffffff00[|r|cffd597ffRemoveQuestie|r|cffffff00]|r " .. L.ERROR_QUESTID)
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
