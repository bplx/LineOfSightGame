extends ProgressBar


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var plr = get_tree().get_nodes_in_group("Player")[0]


# Called when the node enters the scene tree for the first time.
func _ready():
	value = 100
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var val = plr.get_node("AttackLine/AttackDelay").time_left * 100
	value = 100 - val
	if value == 100:
		modulate = Color( 0.941176, 0.972549, 1, 1 )
	else:
		modulate = Color(100, 100, 100, 1)
	pass
