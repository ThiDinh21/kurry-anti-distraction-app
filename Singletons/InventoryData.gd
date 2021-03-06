extends Node

var inventory_data = {}

func _ready():
	var inventory_data_file = File.new()
	inventory_data_file.open("user://InventoryData.json", File.READ)
	var inventory_data_json = JSON.parse(inventory_data_file.get_as_text())
	inventory_data_file.close()
	inventory_data = inventory_data_json.result
