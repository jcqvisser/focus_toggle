# focus_toggle
Toggle focus on ruby tests

This package is only useful if you're using the [minitest-focus](https://github.com/seattlerb/minitest-focus) gem.

## Commands
- `Af` adds focus to all tests in the current file
- `Rf` removes focus to all tests in the current file
- `AddFocusHere` adds focus to the test the cursor is currently in
- `RemoveFocusHere` removes focus from the test the cursor is currently in

## Proposed Keybindings
- `nnoremap <leader>af :AddFocusHere<CR>`
- `nnoremap <leader>rf :RemoveFocusHere<CR>`

## Installation
- Follow the directions of your plugin manager
  - Vundle: `Plugin 'jcqvisser/focus_toggle'`
  - Plug: `Plug 'jcqvisser/focus_toggle'`
