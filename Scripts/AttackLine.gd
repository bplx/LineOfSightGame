extends Line2D

func _process(_delta):
	for i in points.size() - 1:
		var segment = $Area2D/CollisionShape2D.shape
		segment.a = points[i]
		segment.b = points[i + 1]
