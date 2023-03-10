extends KinematicBody2D

signal died


onready var audioplayer = $AudioStreamPlayer2D
var upgraded = 0
var velocity = Vector2.ZERO
var mv = Vector2.ZERO
var dead = false
var attack_enabled = true
var attack_active = false
var startPB = 0

func _ready():
	startPB = Globals.pb
	$AttackLine.add_point(Vector2(0,0), 0)
	$AttackLine.add_point(get_local_mouse_position(), 1)
	$AttackLine.default_color = Color(0, 0, 0, 0.3)
	$AnimationPlayer.play("Start")
	pass

func _process(_delta):
	if dead == false:
		$Sprite.look_at(get_global_mouse_position())
		$AttackLine.set_point_position(0, Vector2(0,0))
		$AttackLine.set_point_position(1, get_local_mouse_position())
		$AttackLine.default_color = Color(lerp(1, 0, $AttackLine/AttackDelay.time_left),
										  1,
										  lerp(1, 0, $AttackLine/AttackDelay.time_left), 
										  lerp(0.1, 1, $AttackLine/AttackDelay.time_left))
										
		if Input.is_action_just_pressed("fire") and attack_enabled:
			audioplayer.stream = load("res://Sounds/Player/shoot.wav")
			audioplayer.volume_db = -10
			audioplayer.play()
			$AttackLine.default_color = Color(1, 1, 1, 1)
			$AttackLine/AttackDelay.start()
			attack_enabled = false
			attack_active = true
			
		if attack_active == true:
			var comboCounter = 1
			for i in $AttackLine/Area2D.get_overlapping_bodies():
				if i.is_in_group("Enemies"):
					print("AAAA")
					i.die(comboCounter)
					comboCounter += 1
			
		attack_active = false
	if dead == true:
		if Input.is_action_just_pressed("ui_accept"):
			$AnimationPlayer.play("End")
	

func upgrade():
	if Globals.score >= 70 and upgraded == 60:
		$AnimationPlayer.play("Upgrade")
		$AttackLine/AttackDelay.wait_time -= 0.1
		upgraded = 70
	elif Globals.score >= 60 and upgraded == 40:
		$AnimationPlayer.play("Upgrade")
		$AttackLine/AttackDelay.wait_time -= 0.1
		upgraded = 60
	elif Globals.score >= 40 and upgraded == 20:
		$AnimationPlayer.play("Upgrade")
		$AttackLine/AttackDelay.wait_time -= 0.1
		upgraded = 40
	elif Globals.score >= 20 and upgraded == 10:
		$AnimationPlayer.play("Upgrade")
		$AttackLine/AttackDelay.wait_time -= 0.1
		upgraded = 20
	elif Globals.score >= 10 and upgraded == 0:
		$AnimationPlayer.play("Upgrade")
		$AttackLine/AttackDelay.wait_time -= 0.1
		upgraded = 10

func _physics_process(delta):
	
	
	upgrade()
	mv = position.direction_to(get_global_mouse_position())
	velocity += mv.normalized() * 500 * delta
	velocity = move_and_slide(velocity)
	$Sprite/CPUParticles2D.scale_amount = abs((velocity.x + velocity.y*2)/50)

	pass

func die():
	audioplayer.volume_db = 1
	dead = true
	audioplayer.stream = load("res://Sounds/Player/death.wav")
	set_physics_process(false)
	$Sprite/CPUParticles2D.emitting = false
	emit_signal("died")
	$AnimationPlayer.play("Die")

func _on_AttackDelay_timeout():
	attack_enabled = true
	pass 


func _on_Area2D_body_entered(body):
	if body.is_in_group("Enemies") and dead == false:
		die()
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "End":
		get_tree().reload_current_scene()
	if anim_name == "Die":
		if Globals.pb > startPB:
			$"../CanvasLayer/Death/VBoxContainer/NewPB".visible = true
		else:
			$"../CanvasLayer/Death/VBoxContainer/NewPB".visible = false
		
	pass # Replace with function body.
