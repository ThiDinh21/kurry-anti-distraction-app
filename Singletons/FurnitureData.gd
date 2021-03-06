extends Node

var furniture_data = {}

func _ready():
	var furniture_data_file = File.new()
	furniture_data_file.open("res://DB/FurnitureData.json", File.READ)
	var furniture_data_json = JSON.parse(furniture_data_file.get_as_text())
	furniture_data_file.close()
	furniture_data = furniture_data_json.result
