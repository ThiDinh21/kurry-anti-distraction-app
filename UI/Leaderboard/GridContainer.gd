extends GridContainer


const player_info = [
	["Alex","50","80","1"],
	["Ben","42","50","2"],
	["James","31","45","3"],
	["Mary","23","33","4"],
	["Bruce","14","20","5"],
	["Chris","7","14","6"],
	["Michael","2","1","7"],
]

func _ready():
	for player in player_info:
		for x in player:			
			var grid_content = Label.new()
			grid_content.add_font_override("font", load("res://Fonts/Silver_60.tres"))
			grid_content.set_align(1)
			grid_content.set_valign(1)
			grid_content.text = x
			self.add_child(grid_content)
			
