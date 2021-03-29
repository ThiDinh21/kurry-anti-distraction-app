extends Node

var setting_music = load("res://UI/Cianwood-City.wav") 

func _ready():
	pass
	
func play_sound():
	$Music.stream = setting_music
	$Music.play()
