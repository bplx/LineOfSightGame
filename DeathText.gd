extends Label

var messages = [
	"WHOOPS",
	"GET GOOD",
	"YOU DIED",
	"TRY HARDER",
	"EZ NO RE",
	"DISSAPOINTING",
	"ROFL"
]


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	rect_pivot_offset = rect_scale/2

	randomize()
	text = messages[int(rand_range(0, messages.size()))]
	visible = false
	anchor_bottom = 0.5
	anchor_top = 0.5
	anchor_left = 0.5
	anchor_right = 0.5
	#set_rotation(10)
	yield(get_tree(), "idle_frame")
	rect_scale = Vector2(2,2)
	rect_rotation = 10
	#rect_scale = Vector2(2, 2)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
