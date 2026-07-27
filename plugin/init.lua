local M = {}

function M.apply_to_config(config, opts) end

function M.apply_golden_ratio(window, pane)
  local wezterm = require 'wezterm'
  local tab = window:active_tab()

  local pane_info = {}
  for _, curr_pane in ipairs(tab:panes_with_info()) do
    if curr_pane.is_active then
      pane_info = curr_pane
    end
  end

  if pane_info.is_zoomed then
    return
  end

  local tab_dims = tab:get_size()

  local target_width = math.floor(2 * tab_dims.cols / 3)
  local target_height = math.floor(2 * tab_dims.rows / 3)

  local pane_dims = pane:get_dimensions()
  local pane_width = pane_dims.cols
  local pane_height = pane_dims.viewport_rows

  local delta_width = math.tointeger(target_width - pane_width)
  local delta_height = math.tointeger(target_height - pane_height)

  local act = wezterm.action
  if pane_width < target_width then
    local dir = 'Right'
    if pane_info.left > 0 then
      dir = 'Left'
    end
    wezterm.log_info("adjusting: " .. delta_width)
    wezterm.log_info("dir: " .. dir)
    window:perform_action(act.AdjustPaneSize { dir, delta_width }, pane)
  end


  if pane_height < target_height then
    local dir = 'Down'
    if pane_info.top > 0 then
      dir = 'Up'
    end
    wezterm.log_info("adjusting: " .. delta_height)
    wezterm.log_info("dir: " .. dir)
    window:perform_action(act.AdjustPaneSize { dir, delta_height }, pane)
  end
end

return M
