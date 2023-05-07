local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- webdev stuff
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- Git
  b.code_actions.gitrebase,
  b.code_actions.gitsigns,
  --b.diagnostics.commitlint,

  -- Ansible
  b.diagnostics.ansiblelint,

  -- C/C++
  b.diagnostics.clang_check,
  b.formatting.clang_format,

  -- PHP
  b.diagnostics.phpcs,
  b.diagnostics.phpstan,
  b.formatting.phpcbf,

  -- Rust
  b.formatting.rustfmt,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
