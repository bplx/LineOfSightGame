extends Node

func list_files_in_directory(path):
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			files.append(file)

	dir.list_dir_end()
	
	return files




var score = 0
var pb = 0
var map = 1
var list
# Called when the node enters the scene tree for the first time.
func _ready():
	list = list_files_in_directory("res://Levels/")
	list.sort()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if score > pb:
		pb = score
	pass
