local status_ok, grug = pcall(require, "grug-far")

if not status_ok then
	return
end

grug.setup()

vim.keymap.set("n", "<leader>gr", function()
	grug.open({ prefills = { search = vim.fn.expand("<cword>") } })
end, { noremap = true, desc = "Search w/ current word under the cursor" })

vim.keymap.set("n", "<leader>gl", function()
	grug.open({ prefills = { paths = vim.fn.expand("%") } })
end, { noremap = true, desc = "Search/Replace within current file" })
