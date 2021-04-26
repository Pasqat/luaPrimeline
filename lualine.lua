local Worktree = require("git-worktree")

local git_branch = ""

local colors = {
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  red      = '#ec5f67';
}

local function harpoon_status()
    local status = require("harpoon.mark").status()
    if status == "" then
        status = "N"
    end

    return string.format("H:%s", status)
end

local function get_git_info(force)
    if force or not git_branch or git_branch == "" then
        git_branch = vim.fn["fugitive#head"]()
        if not git_branch or git_branch == "" then
            git_branch = ''
        end
        if #git_branch > 14 then
            git_branch = git_branch:sub(1, 11) .. "..."
        end
    end

    return git_branch
end

Worktree.on_tree_change(function(op)
    if op == Worktree.Operations.Switch then
        get_git_info(true)
    end
end)

require('lualine').setup{
    options = {
        theme = 'gruvbox',
        section_separators = {'', ''},
        component_separators = {'', ''},
        icons_enabled = true,
    },
    sections = {
        lualine_a = { {'mode', upper = true} },
        lualine_b = { {get_git_info, icon = ''} },
        lualine_c = { {'filename', file_status = true}, },
        lualine_x = { 'filetype' },
        lualine_y = { {'diagnostics',
          sources = {'nvim_lsp'},
          symbols = {error = ' ', warn = ' ', info= ' '},
          color_error = colors.red,
          color_warn = colors.yellow,
          color_info = colors.cyan,
            }
        },
        lualine_z = { harpoon_status  },
    },
    inactive_sections = {
        lualine_a = {  },
        lualine_b = {  },
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {  },
        lualine_z = {   }
    },
    extensions = { 'fzf' }
}
