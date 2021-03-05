extends Label

#onready var num = _load(Global.score, save_path)
var save_path = 'my_number'
onready var currency = Global.game_state["currency"]
	
func _process(_delta):
	text = str(Global.game_state["currency"])

func _on_Button_pressed():
	Global.game_state["currency"] += 10
	Global.save_game()
	

	
