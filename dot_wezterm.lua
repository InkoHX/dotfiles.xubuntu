local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- General
config.enable_scroll_bar = true
config.disable_default_key_bindings = true

-- Font
config.font = wezterm.font 'Moralerspace Krypton NF'
config.font_size = 10.0

-- Color
config.color_scheme = 'Bim (Gogh)'

-- Bindings
config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 5000 }

-- Key bindings
config.keys = {
  { key = 'b', mods = 'LEADER', action = wezterm.action.SendKey { key = 'b', mods = 'CTRL' }, }, -- LEADERに設定しているキーでシグナルを送る為の回避策
  { key = 'v', mods = 'CTRL|SHIFT', action = wezterm.action.PasteFrom 'Clipboard' }, -- 貼り付け
  { key = 'c', mods = 'CTRL|SHIFT', action = wezterm.action.CopyTo 'Clipboard' }, -- コピー
  { key = 'LeftArrow', mods = 'CTRL', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'LeftArrow', mods = 'SHIFT|ALT|CTRL', action = wezterm.action.AdjustPaneSize{ 'Left', 1 } },
  { key = 'RightArrow', mods = 'CTRL', action = wezterm.action.ActivatePaneDirection 'Right' },
  { key = 'RightArrow', mods = 'SHIFT|ALT|CTRL', action = wezterm.action.AdjustPaneSize{ 'Right', 1 } },
  { key = 'UpArrow', mods = 'CTRL', action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'UpArrow', mods = 'SHIFT|ALT|CTRL', action = wezterm.action.AdjustPaneSize{ 'Up', 1 } },
  { key = 'DownArrow', mods = 'CTRL', action = wezterm.action.ActivatePaneDirection 'Down' },
  { key = 'DownArrow', mods = 'SHIFT|ALT|CTRL', action = wezterm.action.AdjustPaneSize{ 'Down', 1 } },
  -- ターミナルを水平方向に分割
  {
    key = '|',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  -- ターミナルを垂直方向に分割
  {
    key = '=',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  -- パネルを閉じる
  -- {
  --   key = 'x',
  --   mods = 'CTRL',
  --   action = wezterm.action.CloseCurrentPane { confirm = true },
  -- },
  -- タブを閉じる
  {
    key = 'x',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
}

---- Mouse bindings
config.mouse_bindings = {
  -- Ctrl + 左クリックでリンクを開く
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = wezterm.action.OpenLinkAtMouseCursor,
  }
}

return config
