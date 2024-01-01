extends CharacterBody2D

var enemy_inattack_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true

var speed = 100
var current_direction = "none"

func _ready():
	$AnimatedSprite2D.play("front_idle")
	
func _physics_process(delta):
	player_movement(delta)
	enemy_attack()
	
func player_movement(delta):
	if Input.is_action_pressed("ui_up"):
		play_animation(1)
		current_direction = "up"
		velocity.x = 0
		velocity.y = -speed
	elif Input.is_action_pressed("ui_down"):
		play_animation(1)		
		current_direction = "down"
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("ui_left"):
		play_animation(1)
		current_direction = "left"
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_right"):
		play_animation(1)
		current_direction = "right"
		velocity.x = speed
		velocity.y = 0
	else:
		play_animation(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
	
func play_animation(movement):
	var direction = current_direction
	var animation = $AnimatedSprite2D
	if direction == "right":
		animation.flip_h = false
		if movement == 1:
			animation.play("side_walk")
		elif movement == 0 :
			animation.play("side_idle")
	if direction == "left":
		animation.flip_h = true
		if movement == 1:
			animation.play("side_walk")
		elif movement == 0 :
			animation.play("side_idle")
	if direction == "up":
		animation.flip_h = true
		if movement == 1:
			animation.play("back_walk")
		elif movement == 0 :
			animation.play("back_idle")
	if direction == "down":
		animation.flip_h = true
		if movement == 1:
			animation.play("front_walk")
		elif movement == 0 :
			animation.play("front_idle")

func player():
	pass

func _on_player_hitbox_area_shape_entered(body):
	if body.has_method("enemy"):
		enemy_inattack_range = true


func _on_player_hitbox_area_shape_exited(body):
	if body.has_method("enemy"):
		enemy_inattack_range = false
		
func enemy_attack():
	if enemy_inattack_range:
		print("player took damage")

