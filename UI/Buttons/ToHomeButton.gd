extends Button

func _on_Button_pressed():
# warning-ignore:return_value_discarded
	SoundController.play_sound()
	get_tree().change_scene("res://UI/Menu.tscn")
	


	
