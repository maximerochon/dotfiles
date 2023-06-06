local distant_ok, distant = pcall(require, "distant")

if distant_ok then
    distant.setup({
        ["*"] = require("distant.settings").chip_default(),
    })
end
