extends Resource
class_name Inventory

export(Array, Resource) var items = [
	null, null, null, null, null, null, null, null, null,
]

signal item_changed(indexes)

func set_item(target_index, item):
	var previous_item = items[target_index]
	items[target_index] = item
	emit_signal("item_changed", [target_index])
	return previous_item
	
func swap_items(origin_index, target_index):
	var targeted_item = items[target_index]
	var origin_item = items[origin_index]
	items[target_index] = origin_item
	items[origin_index] = targeted_item
	emit_signal("item_changed", [origin_index, target_index])

func remove_item(target_index):
	var previous_item = items[target_index]
	items[target_index] = null
	emit_signal("item_changed", [target_index])
	return previous_item
