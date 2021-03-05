extends Node

const SAVE_GAME_PATH = 'user://GameData.json'
var game_state = {
	"name": "Kurry",
	"currency": 0,
	"exp": 0,
	"num_of_floor": 1
}

func _ready():
	Global.load_game()

func save_game():
	var file = File.new()
	file.open(SAVE_GAME_PATH, file.WRITE_READ)
	file.store_string(to_json(game_state))
	file.close()
	
func load_game():
	var file = File.new()
	if file.file_exists(SAVE_GAME_PATH):
		file.open(SAVE_GAME_PATH, File.READ)
		var data : Dictionary = parse_json(file.get_line())
		file.close()
		if typeof(data) == TYPE_DICTIONARY:
			game_state = data
		else:
			printerr("Corrupted data!")
	else:
		printerr("No saved data!")
