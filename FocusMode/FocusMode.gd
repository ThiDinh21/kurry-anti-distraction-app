extends Control

const ProjectModeAnimation = preload("res://FocusMode/ProjectModeAnimation.tscn")
const DeadlineModeAnimation = preload("res://FocusMode/DeadlineModeAnimation.tscn")

enum {
	STAND_BY,
	WORK,
	REST,
}

enum {
	PROJECT_MODE,
	DEADLINE_MODE,
}

var state = STAND_BY
var mode = PROJECT_MODE

onready var setTimerUI = $SetTimerUI
onready var background = $Background
onready var background2 = $SetTimerUI/TimerDisplay

func _ready():
	switch_project_mode()

func _on_StartButton_pressed():
	if state == STAND_BY:
		state = WORK
		setTimerUI.start_timer(state)
	elif state == WORK:
		setTimerUI.reset()
		state = STAND_BY

func _on_Timer_timeout():
	setTimerUI.cycle -= 1
	if setTimerUI.cycle <= 0:
		setTimerUI.reset()
		return
	setTimerUI.start_timer(state)
	
func switch_project_mode():
	mode = PROJECT_MODE
	var deadlineAnimation = get_node_or_null("DeadlineModeAnimation")
	if deadlineAnimation != null:
		deadlineAnimation.queue_free()
	var newAnimation = ProjectModeAnimation.instance()
	self.add_child(newAnimation)
	move_child(newAnimation, 2)
	background.color = "bb7d3a"
	background2.color = "bb7d3a"	

func switch_deadline_mode():
	mode = DEADLINE_MODE
	var projectAnimation = get_node_or_null("ProjectModeAnimation")
	if projectAnimation != null:
		projectAnimation.queue_free()
	var newAnimation = DeadlineModeAnimation.instance()
	self.add_child(newAnimation)
	move_child(newAnimation, 2)
	background.color = "f25814"
	background2.color = "f25814"	

func _on_ModeButton_toggled(button_pressed):
	if button_pressed == true:
		switch_deadline_mode()
	else:
		switch_project_mode()


func _on_ExitButton_pressed():
	get_tree().change_scene('res://TestFloor.tscn')
