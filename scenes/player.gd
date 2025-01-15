extends CharacterBody2D


const GRAVITY = 4200
const JUMP_VELOCITY = -1800


func _physics_process(delta: float) -> void:
	# Add the gravity.
	velocity.y += GRAVITY * delta

	# Handle movement.
	if is_on_floor():
		if not get_parent().game_running:
			$AnimatedSprite2D.play("idle")
		else:
			$RunningCol.disabled = false
			if Input.is_action_pressed("ui_accept"):
				velocity.y = JUMP_VELOCITY
				$JumpSound.play()
			elif Input.is_action_pressed("ui_down"):
				$AnimatedSprite2D.play("duck")
				$RunningCol.disabled = true
			else:
				$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("jump")
	move_and_slide()
