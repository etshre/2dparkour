extends TextureRect

@export var item_id: String = ""
#@export var accepts_item_id: String = ""
var original_position: Vector2
var original_parent: Node

var is_being_dragged: bool = false

var speed = 50.0
var direction = 1.0 #to the right
var y_drift_target: float

func _ready():
	original_position = position
	original_parent = get_parent()
	y_drift_target = randf_range(-480.0, -310.0)

func _get_drag_data(at_position: Vector2) -> Variant:
	print("--- _get_drag_data called on:", name, "---")
	
	original_position = position
	original_parent = get_parent()
	
	# Get a reference to the SceneTree *before* detaching the node
	var tree = get_tree()
	if tree == null:
		print("Error, SceneTree is null during drag start for node:", name)
		return null # Returning null prevents the drag operation from starting

	var drag_data = {
		"type": "item",
		"item_id": item_id,
		"texture": texture, 
		"source_node": self
	}
	print("Preparing drag_data:", drag_data)
	
	# Create the visual preview that follows the mouse
	var preview = TextureRect.new()
	preview.texture = texture
	preview.expand_mode = 1
	preview.size = size / 1.5 
	preview.modulate = Color(1,1,1,0.7)
	
	set_drag_preview(preview)
	
	#hidden orig item when dragging
	visible = false
	
	is_being_dragged = true 

	print("Returning drag_data (after setup):", drag_data)
	
	#gives data
	return drag_data 

func _notification(what: int):
	if what == NOTIFICATION_DRAG_END:
		is_being_dragged = false 
		if not get_viewport().gui_is_drag_successful():
			print("Drag was unsuccessful. Returning to original position and making visible.")
			#make the original item visible
			visible = true 
			position = original_position
		else:
			# successful drag, remove original
			print("Drag was successful. Hiding original item and possibly queue_freeing.")
			queue_free() 
			
func _process(delta):
	if not is_being_dragged:
		# drift to the right when not dragged
		position.x += speed * direction * delta
		position.y = y_drift_target
		
		if position.x > get_viewport_rect().size.x + size.x: 
			position.x = -size.x 
			y_drift_target = randf_range(-480.0, -310.0)

func is_anything_dragging() -> bool:
	return get_viewport().gui_get_drag_data()!= null

# You would put the following functions on the drop target's script, not the draggable item's:
#func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
#    # ... (your drop logic) ...
#	if data is Dictionary and data.has("type") and data["type"] == "item":
#		if data["item_id"] == accepts_item_id:
#			return true
#	return false
#
#func _drop_data(pos, _data):
#    # ... (handle the dropped item on the target) ...
#	texture = null
#	speed = 0
#	direction = 0

# var y = randi_range(-480, -310) # This variable is not used and can be removed
