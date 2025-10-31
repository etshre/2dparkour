extends Area2D


func _on_body_entered(body):
	if body is PlayerController:
		GameManager.add_coin()
		queue_free()
