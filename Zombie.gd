extends KinematicBody2D
onready var plr = get_tree().get_nodes_in_group("Player")[0]
var deathParticles = preload("res://Entities/ZombieDieParticles.tscn")
var speed = 0
var max_speed = 200
var velocity = Vector2.ZERO
func _ready():
	add_to_group("Enemies")
	look_at(plr.global_transform.origin)
	$AnimationPlayer.play("Spawn")
	pass
	
func _physics_process(delta):
	look_at(plr.global_transform.origin)
	#velocity = transform.x * speed * delta
	#speed = lerp(speed, 15000, 0.0111)
	var mv = position.direction_to(plr.global_transform.origin)
	velocity += mv.normalized() * 500 * delta
	velocity.x = clamp(velocity.x, -max_speed, max_speed)
	velocity.y = clamp(velocity.y, -max_speed, max_speed)
	velocity = move_and_slide(velocity)
	#velocity = move_and_slide(velocity)

func die():
	print("OWEI!!!")
	var object = deathParticles.instance()
	object.position = position
	object.emitting = true
	get_tree().get_root().get_node("Game").add_child(object)
	$AnimationPlayer.play("die")
	set_physics_process(false)


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "die":
		queue_free()
	pass # Replace with function body.
