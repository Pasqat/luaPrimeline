# lualine.lua<a name="luaPrimeLine"></a>

This is a simple custom configuration of [lualine](https://github.com/hoob3rt/lualine.nvim) that works with ThePrimagen plugin:
- [harpoon](https://github.com/ThePrimeagen/harpoon)
- [git-worktree](https://github.com/ThePrimeagen/git-worktree.nvim)

I've just copy-pasted the function made by ThePrimagen himself during is streaming. You can find his custom statusline (not lualine) [here](https://github.com/awesome-streamers/awesome-streamerrc/blob/master/ThePrimeagen/lua/theprimeagen/statusline.lua)

## Dependencies<a name="dependencies"></a>

- Requires NeoVim 0.5+
- native LSP
- [lualine](https://github.com/hoob3rt/lualine.nvim)
- [harpoon](https://github.com/ThePrimeagen/harpoon)
- [git-worktree](https://github.com/ThePrimeagen/git-worktree.nvim)


## Usage<a name="usage"></a>

Follow lualine repo to further customize lualine.

**Git branch** use the worktree plugin instead of the standard branch component. On the left the hanpoon mark if exist and the lsp diagnostic

![img](lualine.png)
