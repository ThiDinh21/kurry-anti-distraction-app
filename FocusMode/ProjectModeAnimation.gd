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


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
