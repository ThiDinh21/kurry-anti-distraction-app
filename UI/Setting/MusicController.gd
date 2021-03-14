extends Node

var setting_music = load("res://UI/Cianwood-City.wav") 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func play_music():
	$Music.stream = setting_music
	$Music.play()
