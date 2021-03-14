extends Control


func _on_BackButton_pressed():
	get_tree().change_scene("res://UI/Menu.tscn")

func _process(delta):
	$Cash.text = "Cash: " + str(Global.game_state["currency"])



