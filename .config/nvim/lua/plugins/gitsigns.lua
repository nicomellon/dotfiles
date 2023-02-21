return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "契" },
      topdelete = { text = "契" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

      map("n", "]h", gs.next_hunk, "[GITSIGNS] Next Hunk")
      map("n", "[h", gs.prev_hunk, "[GITSIGNS] Prev Hunk")
      map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "[GITSIGNS] Stage Hunk")
      map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "[GITSIGNS] Reset Hunk")
      map("n", "<leader>ghS", gs.stage_buffer, "[GITSIGNS] Stage Buffer")
      map("n", "<leader>ghu", gs.undo_stage_hunk, "[GITSIGNS] Undo Stage Hunk")
      map("n", "<leader>ghR", gs.reset_buffer, "[GITSIGNS] Reset Buffer")
      map("n", "<leader>ghp", gs.preview_hunk, "[GITSIGNS] Preview Hunk")
      map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "[GITSIGNS] Blame Line")
      map("n", "<leader>ghd", gs.diffthis, "[GITSIGNS] Diff This")
      map("n", "<leader>ghD", function() gs.diffthis("~") end, "[GITSIGNS] Diff This ~")
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "[GITSIGNS] Select Hunk")
    end,
  },
}
