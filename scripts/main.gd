extends Node2D

@export var texture_rect_scene: PackedScene

func _ready():
	spawn_texture_rect_blue()
	spawn_texture_rect_purple()
	spawn_texture_rect_pink()
	
func spawn_texture_rect_blue():
	var texture_rect_scene = preload("res://archivekeeper/scenes/blue_box.tscn")
	var new_texture_rect = texture_rect_scene.instantiate()
	add_child(new_texture_rect)
	new_texture_rect.position = Vector2(-300,-320)
	
func spawn_texture_rect_purple():
	var texture_rect_scene = preload("res://archivekeeper/scenes/purple_box.tscn")
	var new_texture_rect = texture_rect_scene.instantiate()
	add_child(new_texture_rect)
	new_texture_rect.position = Vector2(-280,-320)
	
func spawn_texture_rect_pink():
	var texture_rect_scene = preload("res://archivekeeper/scenes/Packet.tscn")
	var new_texture_rect = texture_rect_scene.instantiate()
	add_child(new_texture_rect)
	new_texture_rect.position = Vector2(-250,-320)
	
