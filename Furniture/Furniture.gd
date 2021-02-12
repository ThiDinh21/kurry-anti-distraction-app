extends StaticBody2D

var is_dragged = false

func _on_Furniture_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("select"):
		get_tree().set_input_as_handled()
		is_dragged = true

func _input(event):
	if event.is_action_released("select"):
		is_dragged = false

func _physics_process(delta):
	if is_dragged:
		global_position = lerp(global_position, get_global_mouse_position(), delta * 25)
