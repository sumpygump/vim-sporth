# vim-sporth

Vim plugin for working with Sporth, a small stack-based audio language by Paul Batchelor.

https://paulbatchelor.github.io/proj/sporth

## Installation

Use your preferred vim plugin manager to install.

- VimPlug: `Plug 'sumpygump/vim-sporth'`
- Pathogen: `git clone https://github.com/sumpygump/vim-sporth.git ~/.vim/bundle/vim-sporth`
- Vundle: `Plugin 'sumpygump/vim-sporth'`
- NeoBundle: `NeoBundle 'sumpygump/vim-sporth'`

You should have [sporth](https://github.com/PaulBatchelor/Sporth) installed
using the supplied installation instructions.

## Usage

This plugin provides the following:

- Syntax highlighting sporth files (`*.sp`)
- Commands to run `sp_eval_file` and `spparse` on the current file
- Help on sporth ugens by calling `ugen_lookup`

### Syntax highlighting

When an `*.sp` file is loaded, vim will highlight the keywords, numbers,
operators and strings in sporth code.

### As realtime player

When you have the "sporth server" running, you can press keys in vim to send
the current file to the server.

```
$ sporth -b jack -0
```

While the above command is running, sporth is waiting for calls to the
`sp_eval_file` on a sporth call to activate and evaluation sporth code.

When a sporth file is loaded in vim, press `<leader>[` or `F8` to evaluate and
play the file.

Press `<leader>]` or `F9` to send `0` to the sporth server, effectively
stopping the playback.

When a block of sporth code is visually highlighted, pressing `<leader>[` to
send that text to the sporth server. This uses `spparse 6449`

### Sporth help

When the cursor is on a ugen word, press `<leader>h` to pull up a help window
and provide the documentation for that ugen function. This calls `ugen_lookup
<word>` to fetch the appropriate documentation.
