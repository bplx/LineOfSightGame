extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mapTo = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	Globals.map = mapTo
	get_tree().change_scene("res://Scenes/Game.tscn")
	pass # Replace with function body.
