extends Node2D
var zombie = preload("res://Entities/Zombie.tscn")
func _on_SpawnTimer_timeout():
	var object = zombie.instance()
	object.position = position
	get_tree().get_root().get_node("Game").add_child(object)
	pass # Replace with function body.
