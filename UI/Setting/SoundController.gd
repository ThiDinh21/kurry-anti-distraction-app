extends Node

var sound = load("res://UI/Click-Sound.wav") 

func _ready():
	pass
	
func play_sound():
	$Click.stream = sound
	$Click.play()
