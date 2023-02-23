extends Node2D
onready var tilemap = $Map/Solids
signal doneloading;
var zombieEntity = preload("res://Entities/Zombie.tscn")
var zombieSpawner = preload("res://Entities/ZombieSpawner.tscn")

var levelthing = "res://Levels/%s.tscn" % str(Globals.map)

func _ready():
	var map = load(levelthing)
	add_child(map.instance())
	tilemap = $Map/Solids
	emit_signal("doneloading")
	
func _on_Game_doneloading():
	for cellpos in tilemap.get_used_cells():
		var cell = tilemap.get_cellv(cellpos)
		if cell == 1 or cell == 2:		
			var object
			if cell == 1:
				object = zombieEntity.instance()
			if cell == 2:
				object = zombieSpawner.instance()
			object.position = tilemap.map_to_world(cellpos) * scale
			call_deferred("add_child", object)
			tilemap.set_cellv(cellpos, -1)
