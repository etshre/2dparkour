extends Control

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://archivekeeper/scenes/areas/area_1.tscn")


func _on_levels_pressed() -> void:
	get_tree().change_scene_to_file("res://archivekeeper/scenes/levels.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
