local nnoremap = require("rob.keymap").nnoremap
local vnoremap = require("rob.keymap").vnoremap

-- NEO TREE
nnoremap("<leader>e", "<cmd>:Neotree toggle<CR>")

-- PACKER
nnoremap("<leader>ps", "<cmd>:PackerSync<CR>")

-- FILES
nnoremap("<leader>ff", function() require("telescope.builtin").find_files() end)
nnoremap("<leader>fw", function() require("telescope.builtin").live_grep() end)
nnoremap("<leader>fW", function()
      require("telescope.builtin").live_grep {
        additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
      }
    end)
-- COMMENT 
vnoremap("<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>")

-- WINDOW
nnoremap("<leader>ww", "<cmd>:wq<CR>")
nnoremap("<leader>qq", "<cmd>:q!<CR>")
nnoremap("<leader>h", "<cmd>nohlsearch<cr>")

-- SPLITS
nnoremap("<C-h>", function() require("smart-splits").move_cursor_left() end)
nnoremap("<C-j>", function() require("smart-splits").move_cursor_down() end)
nnoremap("<C-k>", function() require("smart-splits").move_cursor_up() end)
nnoremap("<C-l>", function() require("smart-splits").move_cursor_right() end)

nnoremap("<C-Up>", function() require("smart-splits").resize_up() end)
nnoremap("<C-Down>", function() require("smart-splits").resize_down() end)
nnoremap("<C-Left>", function() require("smart-splits").resize_left() end)
nnoremap("<C-Right>", function() require("smart-splits").resize_right() end)
