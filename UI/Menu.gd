extends Control

var scene_path_to_load
func _ready():
	$MenuBox/CenterRow/Buttons/HomeButton.grab_focus()
	for button in $MenuBox/CenterRow/Buttons.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])

func _on_Button_pressed(scene_to_load):
	scene_path_to_load = scene_to_load
	$FadeIn.show()
	$FadeIn.fade_in()
	
func _on_FadeIn_fade_finished():
# warning-ignore:return_value_discarded
	SoundController.play_sound()
	get_tree().change_scene(scene_path_to_load)

func _on_BackButton_pressed():
	SoundController.play_sound()
	get_tree().change_scene('res://TestFloor.tscn')
