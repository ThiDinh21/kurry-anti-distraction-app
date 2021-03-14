extends Control

var setting_music = load("res://UI/Cianwood-City.wav") 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_SliderMusic_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"),value)

# Not used yet
func _on_SliderSound_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sound"),value)
