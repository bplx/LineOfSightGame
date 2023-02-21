extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var button = preload("res://Scenes/Button.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in Globals.list:
		print(i)
		var btn = button.instance()
		btn.mapTo = i.rstrip(".tscn")
		print(btn.mapTo)
		btn.text = btn.mapTo
		add_child(btn)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
