extends Node

signal vision_enabled
signal vision_disabled

@export var vision_duration : float = 0.0
@export var unlimited_duration : bool = true

var active : bool = false
var timer : float = 0.0

func _process(delta):
	if active and !unlimited_duration:
		timer -= delta

		if timer <= 0:
			disable_vision()

func toggle_vision():
	if active:
		disable_vision()
	else:
		enable_vision()

func enable_vision():
	if active:
		return

	active = true
	timer = vision_duration

	vision_enabled.emit()

func disable_vision():
	if !active:
		return

	active = false

	vision_disabled.emit()

func is_active() -> bool:
	return active
