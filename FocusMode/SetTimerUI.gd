extends Control

onready var timePicker = $V/V/H/TimePicker
onready var cyclePicker = $V/V/H/CyclePicker
onready var timerDisplay = $TimerDisplay
onready var timerDisplayLabel = $TimerDisplay/Label
onready var timer = $Timer

enum {
	STAND_BY,
	PROJECT_MODE,
	DEADLINE_MODE,
	REST,
}

# Modes of worktime and breaktime
const WORKTIME = [25 * 60, 50 * 60]  # mins
const BREAKTIME = [5 * 60, 10 * 60]  # mins

var state = STAND_BY
var mode = 0
var cycle = 1

func _ready():
	reset()

func reset():
	state = STAND_BY
	mode = 0
	cycle = 1
	
	timer.stop()
	
	timePicker.disabled = false
	timePicker.add_item("25:00 | 05:00")
	timePicker.add_item("50:00 | 10:00")
	
	cyclePicker.disabled = false
	cyclePicker.add_item("1")
	cyclePicker.add_item("2")
	cyclePicker.add_item("3")
	cyclePicker.add_item("4")
	
	timerDisplayLabel.text = ""
	timerDisplay.visible = false

func _on_TimePicker_item_selected(id):
	mode = id

func _on_CyclePicker_item_selected(id):
	cycle = id + 1
	
func start_timer(new_state):
	state = new_state
	timerDisplay.visible = true
	timer.wait_time = (WORKTIME[mode] + BREAKTIME[mode])
	timer.start()

func _physics_process(_delta):
	if state == PROJECT_MODE or state == DEADLINE_MODE:
		var display_text = "%d : %d\n %d cycle(s) left!"
		var time_in_sec = int(timer.time_left)
		var minutes = time_in_sec / 60
		var seconds = time_in_sec - minutes * 60
		timerDisplayLabel.text = display_text % [minutes, seconds, cycle]



























