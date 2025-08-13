extends TextureRect

@export var accepts_item_id: String = ""

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	if data is Dictionary and data.has("type") and data["type"] == "item":
		if data["item_id"] == accepts_item_id:
			return true
	return false
	return data is Texture2D
	
func _drop_data(pos, data):
	if data is Dictionary and data.has("item_id"):
		print("Item dropped: " + str(data["item_id"]) + " into " + name)
		if data.has("texture"):
			texture = data["texture"]
