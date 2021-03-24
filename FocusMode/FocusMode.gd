extends Control

const ProjectModeAnimation = preload("res://FocusMode/ProjectModeAnimation.tscn")
const DeadlineModeAnimation = preload("res://FocusMode/DeadlineModeAnimation.tscn")

enum {
	STAND_BY,
	PROJECT_MODE,
	DEADLINE_MODE,
	REST,
}

var state = STAND_BY

onready var setTimerUI = $SetTimerUI

func _ready():
	self.add_child(ProjectModeAnimation.instance())

func _on_StartButton_pressed():
	if state == STAND_BY:
		state = PROJECT_MODE
		setTimerUI.start_timer(state)
	elif state == PROJECT_MODE or state == DEADLINE_MODE:
		setTimerUI.reset()
#		pass

func _on_Timer_timeout():
	setTimerUI.cycle -= 1
	if setTimerUI.cycle <= 0:
		setTimerUI.reset()
		return
	setTimerUI.start_timer(state)

























