extends Node

@export var highlighter: Node

func _ready():

	EnhancedVisionManager.vision_enabled.connect(show_highlight)
	EnhancedVisionManager.vision_disabled.connect(hide_highlight)

func show_highlight():
	if highlighter:
		highlighter.enable_highlight()

func hide_highlight():
	if highlighter:
		highlighter.disable_highlight()
