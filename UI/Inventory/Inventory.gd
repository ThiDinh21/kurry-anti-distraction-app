extends Control


var invSlot = preload("res://UI/Inventory/InventorySlot.tscn")

onready var gridContainer = $MContainer/VBox/ScrollContainer/GridContainer

func _ready():
	for key in InventoryData.inventory_data.keys():
		var new_inv_slot = invSlot.instance()
		new_inv_slot.name = key
		var furn_id = InventoryData.inventory_data[key]["Item"]
		if furn_id != null:
			var icon_texture = load("res://Furniture/" + get_asset_path_from_id(furn_id))
			new_inv_slot.get_node("Icon").set_texture(icon_texture)
		gridContainer.add_child(new_inv_slot, true)

func get_asset_path_from_id(id):
	var category = FurnitureData.furniture_data[id]["Category"]
	var assets = FurnitureData.furniture_data[id]["Assets"]
	return category + "/Assets/" + assets
