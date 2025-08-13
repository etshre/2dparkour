extends TextureRect

@export var accepts_item_id: String = ""

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	print("--- _can_drop_data called on:", name, "---")
	print("dragged_data =", data)
	print("Expected item id for this slot:", accepts_item_id)
	
	if data is Dictionary and data.has("type") and data["type"] == "item":
		print("data is an item Dictionary.")
		if data.has("item_id"):
			print("dragged item id =", data["item_id"])
			if data["item_id"] == accepts_item_id:
				print("item id matches, returning True")
				return true
			else:
				print("item id mismatch, returning False")
		else:
			print("dragged data does not have 'item_id', returning False")
	else:
		print("dragged data is not an item dictionary, returning False")
	return false
	#return data is Texture2D
	
func _drop_data(pos, data):
	print("--- _drop_data called on:", name, "---")
	if data is Dictionary and data.has("item_id"):
		print("Item dropped: " + str(data["item_id"]) + " into " + name)
		if data.has("texture"):
			texture = data["texture"]
	else:
		print("Error, _drop_data called with invalid data")
			
