-- :ClangStyleInit — copy the personal .clang-format/.clang-tidy (Linux-Kernel-
-- Inspired Readable C++ Style) from <config>/templates into the root of the
-- repository containing the current file. The copies are plain files meant to
-- be committed, so the style travels with the repo and works for every tool
-- and machine. Existing files are kept; :ClangStyleInit! overwrites them.

local templates = {
  ["clang-format"] = ".clang-format",
  ["clang-tidy"] = ".clang-tidy",
}

vim.api.nvim_create_user_command("ClangStyleInit", function(opts)
  local buf_path = vim.api.nvim_buf_get_name(0)
  local start_dir = buf_path ~= "" and vim.fs.dirname(buf_path) or vim.fn.getcwd()
  local root = vim.fs.root(start_dir, ".git") or vim.fn.getcwd()

  local template_dir = vim.fn.stdpath("config") .. "/templates"
  local created, kept = {}, {}

  for template, target in pairs(templates) do
    local src = template_dir .. "/" .. template
    local dst = root .. "/" .. target

    if vim.uv.fs_stat(dst) and not opts.bang then
      table.insert(kept, target)
    else
      local ok, err = vim.uv.fs_copyfile(src, dst)
      if not ok then
        vim.notify("ClangStyleInit: " .. dst .. ": " .. tostring(err), vim.log.levels.ERROR)
        return
      end
      table.insert(created, target)
    end
  end

  if #created > 0 then
    vim.notify("Created " .. table.concat(created, ", ") .. " in " .. root)
  end
  if #kept > 0 then
    vim.notify(
      table.concat(kept, ", ") .. " already exist in " .. root .. " (use :ClangStyleInit! to overwrite)",
      vim.log.levels.WARN
    )
  end
end, {
  bang = true,
  desc = "Copy personal .clang-format/.clang-tidy into the current repo root",
})
