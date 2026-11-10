extends Node

enum VisionType {
	CLUE,
	OBJECTIVE,
	COLLECTIBLE,
	PUZZLE,
	INTERACTIVE,
	HIDDEN_PATH
}

@export var vision_type : VisionType
@export var target_sprite : NodePath

var sprite : CanvasItem

func _ready():
	if Engine.has_singleton("EnhancedVisionManager"):
		pass
	
	sprite = get_node_or_null(target_sprite)
	var vision_manager = get_node("/root/EnhancedVisionManager")
	
	EnhancedVisionManager.vision_enabled.connect(show_highlight)
	EnhancedVisionManager.vision_disabled.connect(hide_highlight)

	hide_highlight()

func show_highlight():
	if sprite:
		sprite.visible = true

	var parent = get_parent()

	if parent.has_method("enable_highlight"):
		parent.enable_highlight(vision_type)

func hide_highlight():
	var parent = get_parent()

	if parent.has_method("disable_highlight"):
		parent.disable_highlight()
