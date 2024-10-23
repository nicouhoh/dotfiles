return {{
    "nvim-treesitter/vim-treesitter",
    run = ':TSUpdate', url = "git@github.com:nvim-treesitter/nvim-treesitter.git",
    opts = {
      ensure_installed = {
        "astro",
        "cmake",
        "cpp",
        "css",
        "fish",
        "gitignore",
        "go",
        "graphql",
        "html",
        "java",
        "php",
        "rust",
        "scss",
        "sql",
        "svelte",
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)

      -- MDX
    vim.filetype.add({
      extension = {
        mdx= "mdx"
      }
    })
    vim.treesitter.language.register('markdown', 'mdx')
    end
  }
}
