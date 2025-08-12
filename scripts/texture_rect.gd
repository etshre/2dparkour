extends TextureRect


func _get_drag_data(_at_position):
	
	var preview_texture = TextureRect.new()
	
	preview_texture.texture = texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(40,40)
	
	var preview = Control.new()
	preview.add_child(preview_texture)
	
	set_drag_preview(preview)
	texture = null
	
	return preview_texture.texture
	
func _can_drop_data(_pos, data):
	return data is Texture2D
	
func _drop_data(_pos, data):
	texture = null
	speed = 0
	direction = 0

var speed = 50
var direction = 1 #1 is to the right

var y = randi_range(-480, -310)

func _process(delta):
	position.x += speed * direction * delta
	position.y = y
