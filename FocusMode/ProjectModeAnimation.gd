extends Control

enum {
	MOVE,
	READ,
	SIT1,
	PHONE,
	SHOPPING,
}

onready var player = $Player

func _ready():
	player.state = SIT1
