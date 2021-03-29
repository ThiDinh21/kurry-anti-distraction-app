extends Control

const SAVE_PATH = "user://setting.cfg"
var config = ConfigFile.new()
var load_response = config.load(SAVE_PATH)
# Called when the node enters the scene tree for the first time.
func _ready():
	#load_setting()
	pass

func _on_SliderMusic_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"),value)

func _on_SliderSound_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sound"),value)

#func save_setting():
#	var file = File.new()
#	file.open(SAVE_PATH, file.WRITE_READ)
#	#file.store_line(to_json(setting_data))
#	file.close()
#
#func load_setting():
#	var setting_file = File.new()	
#	if not setting_file.file_exists(SAVE_PATH):
#		print("Default Setting")
#		return
#	setting_file.open("user://setting.json", File.READ)
#	var setting_json = JSON.parse(setting_file.get_as_text())
#	setting_file.close()
#	setting_data = setting_json.result
