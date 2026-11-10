extends Node2D

@export var reveal_sprite : NodePath

var sprite : CanvasItem

func _ready():
	sprite = get_node_or_null(reveal_sprite)

	EnhancedVisionManager.vision_enabled.connect(reveal)
	EnhancedVisionManager.vision_disabled.connect(hide_path)

	hide_path()

func reveal():
	if sprite:
		sprite.visible = true

func hide_path():
	if sprite:
		sprite.visible = false
