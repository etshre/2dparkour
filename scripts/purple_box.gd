extends TextureRect

@export var item_id: String = ""
#@export var accepts_item_id: String = ""
var original_position: Vector2
var original_parent: Node

func _ready():
	original_position = position
	original_parent = get_parent()

func _get_drag_data(at_position: Vector2) -> Variant:
	print("--- _get_drag_data called on:", name, "---")
	original_position = position
	original_parent = get_parent()
	
	var tree = get_tree()
	if tree == null:
		print("Error, SceneTree is null during drag start for node:", name)
		return null
	
	var drag_data = {
		"type": "item",
		"item_id": item_id,
		"texture": texture,
		"source_node": self
	}
	print("Returning drag_data:", drag_data)
	
	var preview = TextureRect.new()
	
	preview.texture = texture
	preview.expand_mode = 1
	preview.size = size / 1.5
	preview.modulate = Color(1,1,1,0.7)
	set_drag_preview(preview)
	
	get_parent().remove_child(self)
	
	tree.root.add_child(self)
	global_position = get_global_mouse_position() - size / 2

	print("returning drag data:", drag_data)

	return drag_data
	
func _notification(what: int):
	if what == NOTIFICATION_DRAG_END:
		if not get_viewport().gui_is_drag_successful():
			print("drag was unsuccessful, returning to original position.")
			
			if get_parent():
				get_parent().remove_child(self)
				
			if original_parent and is_instance_valid(original_parent):
				original_parent.add_child(self)
				position = original_position
			else:
				print("Warning, original_parent is either invalid or null. Cannot return to original position.")

			
func _process(delta):
	if is_anything_dragging() and get_viewport().gui_get_drag_data() == _get_drag_data(Vector2.ZERO):
		global_position = get_global_mouse_position() - size / 2
		position.x += speed * direction * delta
		position.y = y

func is_anything_dragging() -> bool:
	return get_viewport().gui_get_drag_data()!= null
#func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
#	if data is Dictionary and data.has("type") and data["type"] == "item":
#		if data["item_id"] == accepts_item_id:
#			return true
#	return false
#	return data is Texture2D
	
func _drop_data(pos, _data):
	texture = null
	speed = 0
	direction = 0
	
var speed = 50
var direction = 1 #1 is to the right

var y = randi_range(-480, -310)
	
