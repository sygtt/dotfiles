local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- =========================
-- 基本
-- =========================
config.automatically_reload_config = true
config.check_for_updates = false

-- =========================
-- WSLをデフォルトにする
-- WSL側で zsh をデフォルトシェルにしている前提
-- =========================
config.default_domain = "WSL:Ubuntu-24.04"

-- =========================
-- PowerShell / cmd.exe も起動できるようにする
-- =========================
config.launch_menu = {
  {
    label = "PowerShell",
    args = { "powershell.exe", "-NoLogo" },
    domain = { DomainName = "local" },
  },
  {
    label = "PowerShell 7",
    args = { "pwsh.exe", "-NoLogo" },
    domain = { DomainName = "local" },
  },
  {
    label = "Command Prompt",
    args = { "cmd.exe" },
    domain = { DomainName = "local" },
  },
  {
    label = "WSL Ubuntu-24.04",
    domain = { DomainName = "WSL:Ubuntu-24.04" },
  },
}

-- =========================
-- GitHub Dark風カラー
-- =========================
config.colors = {
  foreground = "#e6edf3",
  background = "#0d1117",

  cursor_bg = "#e6edf3",
  cursor_border = "#e6edf3",
  cursor_fg = "#0d1117",

  selection_bg = "#264f78",
  selection_fg = "#e6edf3",

  ansi = {
    "#484f58",
    "#ff7b72",
    "#3fb950",
    "#d29922",
    "#58a6ff",
    "#bc8cff",
    "#39c5cf",
    "#b1bac4",
  },

  brights = {
    "#6e7681",
    "#ffa198",
    "#56d364",
    "#e3b341",
    "#79c0ff",
    "#d2a8ff",
    "#56d4dd",
    "#f0f6fc",
  },

  tab_bar = {
    background = "#0d1117",

    active_tab = {
      bg_color = "#161b22",
      fg_color = "#e6edf3",
      intensity = "Bold",
    },

    inactive_tab = {
      bg_color = "#0d1117",
      fg_color = "#8b949e",
    },

    inactive_tab_hover = {
      bg_color = "#161b22",
      fg_color = "#e6edf3",
    },

    new_tab = {
      bg_color = "#0d1117",
      fg_color = "#8b949e",
    },

    new_tab_hover = {
      bg_color = "#161b22",
      fg_color = "#e6edf3",
    },
  },
}

-- =========================
-- 透過とぼかし
-- =========================
config.window_background_opacity = 0.95
config.text_background_opacity = 1.0
-- config.win32_system_backdrop = "Acrylic"

-- Mica / Acrylic は使わない
-- config.win32_system_backdrop = "Mica"
-- config.win32_system_backdrop = "Acrylic"

-- =========================
-- ウィンドウ
-- =========================

-- タイトルバーあり。マウスで掴んで動かせる
config.window_decorations = "TITLE|RESIZE"

-- タブバーは常に表示
config.hide_tab_bar_if_only_one_tab = false

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false

config.window_padding = {
  left = 12,
  right = 12,
  top = 10,
  bottom = 10,
}

config.initial_cols = 120
config.initial_rows = 32

-- =========================
-- フォント
-- =========================
config.font = wezterm.font_with_fallback({
  { family = "Moralerspace Argon", weight = "Regular" },
  { family = "Noto Color Emoji" },
})

config.font_size = 12
config.line_height = 1.12

-- =========================
-- カーソル
-- =========================
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 600

-- =========================
-- スクロール
-- =========================
config.scrollback_lines = 10000
config.enable_scroll_bar = false

-- =========================
-- 日本語入力
-- =========================
config.use_ime = true

return config