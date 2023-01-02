##DNP_SerialScratch
- Easy Config for multiple locations
- Requires items of choice
- Skill checks based on item 
	- AdvancedTool = if successful fully scratches serial 
	- ScratchTool = if successful leaves a partial serial
	- Failing any causes damage to player

# Item 
**qb-core/shared/items.lua**
```
	["handfile"]   	= {["name"] = "handfile", 		["label"] = "Hand File Set", 	["weight"] = 150, 		["type"] = "item", 		["image"] = "handfile.png", 			["unique"] = false,   	["useable"] = true,    ["shouldClose"] = false,    ["combinable"] = nil,   ["description"] = "Essentially a hand saw with a very wide blade."},
	
	["dremel"]   	= {["name"] = "dremel", 		["label"] = "Dremel Cordless Rotary Tool", 	["weight"] = 150, 		["type"] = "item", 		["image"] = "dremel.png", 			["unique"] = false,   	["useable"] = true,    ["shouldClose"] = false,    ["combinable"] = nil,   ["description"] = "Dremel Tool suitable for carving, engraving, routing, grinding, sharpening, cleaning, polishing, cutting and sanding."},
```
# Dependencies
- qbcore
- qb-target
- ox_lib - https://github.com/overextended/ox_lib/releases/tag/v2.19.1 or ps-ui for skill check - https://github.com/Project-Sloth/ps-ui

# Credits
- https://github.com/KevinGirardx - forked from kevin-weaponscratch
- https://github.com/pushkart2
- https://github.com/JoeSzymkowiczFiveM
