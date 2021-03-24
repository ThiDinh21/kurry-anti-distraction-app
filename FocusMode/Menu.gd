extends Control

var is_displayed = false

func _on_MenuButton_pressed():
	var move_distance = get_parent().rect_size.x
	self.rect_position.x += -move_distance if is_displayed else move_distance
	is_displayed = not is_displayed
