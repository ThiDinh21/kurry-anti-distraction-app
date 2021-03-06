extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var m_value = get_node("Audio/Master/SliderMaster").value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),m_value)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_SliderMaster_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),value)

# Not used yet
func _on_SliderMusic_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"),value)

# Not used yet
func _on_SliderSound_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sound"),value)
