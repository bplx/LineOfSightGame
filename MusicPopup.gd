extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var text = $PanelContainer/Label
onready var player = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	print(Globals.map_data[int(Globals.map)-1]["musictitle"])
	text.text = Globals.map_data[int(Globals.map)-1]["musictitle"]
	player.play("Show")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
