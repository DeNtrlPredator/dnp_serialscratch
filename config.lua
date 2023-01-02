Config = {}

Config.SkillCheck = 'ps-ui' --can use ps-ui or ox_lib skill check

Config.ScratchModel = `gr_prop_gr_bench_04a`

Config.ScratchTool = 'handfile' -- gives partial serial scratch

Config.AdvancedTool = 'dremel' -- gives full serial scratch

Config.VisnAre = true --Set to true if you are using visn_are by Tim Plate. Set to false used default qbcore damage system

Config.Locations = {
    ['scratch'] = {
        [1] = { x = 56.90, y = 2795.05, z = 58.10, h = 320.84 },
        [2] = { x = -179.43, y = 6157.00, z = 31.21, h = 48.37 },
        --[3] = {x = 56.94, y = 2795.1, z = 58.1, h = 141.77},
    },
}