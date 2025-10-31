extends Area2D

var current_area = 1
var area_path = "res://archivekeeper/scenes/areas/"

func _on_body_entered(body: Node2D):
	if body is PlayerController:
		print('bleh dead')
		kill_player()
		
func kill_player():
	get_tree().reload_current_scene()
	
