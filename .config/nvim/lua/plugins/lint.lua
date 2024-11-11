-- Suppress diagnostic warnings in markdown
return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = { "markdownlint" },
  },
  config = function()
    local markdownlint = require("lint").linters.markdownlint
    markdownlint.args = {
      "--disable",
      "MD013", -- Line length warning
      "MD007",
      "--", -- Required
    }
  end,
}
