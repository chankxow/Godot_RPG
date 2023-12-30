extends CharacterBody2D

const speed = 100
var target_position = Vector2()

func _physics_process(delta):
	if Input.is_action_just_pressed("click"):
		target_position = get_global_mouse_position()

	player_movement(delta)

func player_movement(delta):
	var direction = (target_position - global_position).normalized()

	if direction.length() > 0.1:
		velocity = direction * speed
	else:
		velocity = Vector2(0, 0)

	move_and_slide(velocity)
