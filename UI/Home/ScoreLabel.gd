extends Label

onready var currency = Global.game_state["currency"]
	
func _process(_delta):
	text = str(Global.game_state["currency"])

func _on_Button_pressed():
	Global.game_state["currency"] += 10
	Global.save_game()
	

	
