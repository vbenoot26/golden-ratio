# Golden Ratio

A golden ratio implementation for wezterm, inspired by the [vim plugin of the same name](https://github.com/roman/golden-ratio).

## Note
This implementation is very jank. It will break when you put more than two panes next to/on top of each other. I implemented it this way (for now) since it fits my use case.

## Installation
This plugin provides a module with one function: `apply_golden_ratio(window, pane)`. This function makes the active pane 2/3ths of the screen. In order to make this plugin run, add the following code into your config:

```lua
wezterm.on("update-status", function(window, pane)
	local gr = wezterm.plugin.require 'https://github.com/vbenoot26/golden-ratio'
	gr.apply_golden_ratio(window, pane)
end)
```
