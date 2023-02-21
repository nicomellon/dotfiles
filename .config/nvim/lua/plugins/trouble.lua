return {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle", "Trouble" },
  opts = { use_diagnostic_signs = true },
  keys = {
    { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "[TROUBLE] Document Diagnostics" },
    { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "[TROUBLE] Workspace Diagnostics" },
    { "<leader>xL", "<cmd>TroubleToggle loclist<cr>", desc = "[TROUBLE] Location List" },
    { "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>", desc = "[TROUBLE] Quickfix List" },
  },
}
