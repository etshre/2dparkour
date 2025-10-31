extends Node

var current_area = 1
var area_path = "res://archivekeeper/scenes/areas/"

var coins = 0


func _ready():
	reset_coins()

func next_level():
	current_area += 1
	var full_path = area_path + "area_" + str(current_area) + ".tscn"
	get_tree().change_scene_to_file(full_path)
	print('The player has moved to area' + str(current_area))
	setup_area()

func setup_area():
	reset_coins()
	
func add_coin():
	coins += 1
	if coins >= 4:
		var portal = get_tree().get_first_node_in_group("area_exits") as AreaExit
		portal.open()

func reset_coins():
	coins = 0
