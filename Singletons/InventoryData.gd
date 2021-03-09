extends Node

const SAVE_PATH = "user://InventoryData.json"

var inventory_data = {
		"Slot1": {"Item": null}, "Slot2": {"Item": null}, "Slot3": {"Item": null}, "Slot4": {"Item": null},
		"Slot5": {"Item": null}, "Slot6": {"Item": null}, "Slot7": {"Item": null}, "Slot8": {"Item": null},
		"Slot9": {"Item": null}, "Slot10": {"Item": null}, "Slot11": {"Item": null}, "Slot12": {"Item": null},
		"Slot13": {"Item": null}, "Slot14": {"Item": null}, "Slot15": {"Item": null}, "Slot16": {"Item": null},
		"Slot17": {"Item": null}, "Slot18": {"Item": null}, "Slot19": {"Item": null}, "Slot20": {"Item": null}
	}

func _ready():
	InventoryData.load_data()

func save_data():
	var file = File.new()
	file.open(SAVE_PATH, file.WRITE_READ)
	file.store_line(to_json(inventory_data))
	file.close()

func load_data():
	var inventory_data_file = File.new()	
	if not inventory_data_file.file_exists(SAVE_PATH):
		print("No saved data for inventory!")
		return
	inventory_data_file.open("user://InventoryData.json", File.READ)
	var inventory_data_json = JSON.parse(inventory_data_file.get_as_text())
	inventory_data_file.close()
	inventory_data = inventory_data_json.result
