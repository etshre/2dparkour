extends Node2D

@onready var scene = load("res://archivekeeper/scripts/blue_box.gd")

func spawn():
	var scene_to_spawn = scene.instantiate()
	add_child(scene_to_spawn)
	scene_to_spawn.set_global_position()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
