extends CharacterBody3D

@export var speed := 5.0

func _physics_process(_delta):

	var input_dir := Vector2.ZERO

	input_dir.x = Input.get_axis("ui_left","ui_right")
	input_dir.y = Input.get_axis("ui_up","ui_down")

	var direction = (
		transform.basis.x * input_dir.x +
		-transform.basis.z * input_dir.y
	).normalized()

	velocity.x = direction.x * speed
	velocity.z = direction.z * speed

	move_and_slide()

func _input(event):

	if event.is_action_pressed("enhanced_vision"):
		EnhancedVisionManager.toggle_vision()
