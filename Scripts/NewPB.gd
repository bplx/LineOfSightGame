extends Label

var oldPB = 0

func _ready():
	oldPB = Globals.pb
	visible = false

func _on_Player_died():
	if oldPB < Globals.pb:
		visible = true
