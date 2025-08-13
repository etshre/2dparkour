extends TextureRect

@export var item_id: String = ""

func _get_drag_data(at_position: Vector2) -> Variant:
	var drag_data = {
		"type": "item",
		"item_id": item_id,
		"texture": texture,
		"source_node": self
	}
	var preview_texture = TextureRect.new()
	
	preview_texture.texture = texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(40,40)
	
	var preview = Control.new()
	preview.add_child(preview_texture)
	
	set_drag_preview(preview)
	texture = null
	
	return preview_texture.texture
	return drag_data
	
#func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
#	if data is Dictionary and data.has("type") and data["type"] == "item":
#		if data["item_id"] == accepts_item_id:
#			return true
#	return false
#	return data is Texture2D
	
#func _drop_data(pos, data):
#	texture = null
#	speed = 0
#	direction = 0
#	if data is Dictionary and data.has("item_id"):
#		print("Item dropped: " + str(data["item_id"]) + " into " + name)
#		if data.has("texture"):
#			texture = data["texture"]
	
var speed = 50
var direction = 1 #1 is to the right

var y = randi_range(-480, -310)

func _process(delta):
	position.x += speed * direction * delta
	position.y = y
	
