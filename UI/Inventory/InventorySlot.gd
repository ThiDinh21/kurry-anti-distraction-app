extends TextureRect
# Script for the Inventory Icon inside the InventorySlot


func get_drag_data(_position):
	var inventory_slot_name = get_parent().get_name()
	var furn_id = InventoryData.inventory_data[inventory_slot_name]["Item"]
	if furn_id == null:
		return null
		
	var data = {}
	data["origin_slot"] = self
	data["origin_texture"] = self.texture
	data["origin_furniture_id"] = furn_id
	
	var drag_texture = TextureRect.new()
	drag_texture.expand = true
	drag_texture.texture = self.texture
	drag_texture.rect_size = Vector2(90, 90)
	
	var wrapper = Control.new()
	wrapper.add_child(drag_texture)
	drag_texture.rect_position = -0.5 * drag_texture.rect_size
	set_drag_preview(wrapper)
	
	return data
	
func can_drop_data(_position, data):
	var target_inventory_slot = get_parent().get_name()
	var furn_id = InventoryData.inventory_data[target_inventory_slot]["Item"]
	data["target_texture"] = self.texture
	data["target_furniture_id"] = furn_id
	return true
	
func drop_data(_position, data):
	var target_inventory_slot = get_parent().get_name()
	var origin_inventory_slot = data["origin_slot"].get_parent().get_name()
	
	# Update inventory data
	InventoryData.inventory_data[origin_inventory_slot]["Item"] = data["target_furniture_id"]
	InventoryData.inventory_data[target_inventory_slot]["Item"] = data["origin_furniture_id"]
	
	# Update textures
	data["origin_slot"].texture = data["target_texture"]
	texture = data["origin_texture"]
	
	InventoryData.save_data()













