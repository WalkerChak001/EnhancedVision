extends Node

@export var mesh: MeshInstance3D

var original_material
enum VisionType {
	CLUE,
	PUZZLE,
	COLLECTIBLE,
	OBJECTIVE
}

func _ready():
	if mesh:
		original_material = mesh.material_override

func enable_highlight(type):

	var mat = StandardMaterial3D.new()

	match type:
		VisionType.CLUE:
			mat.albedo_color = Color.BLUE

		VisionType.PUZZLE:
			mat.albedo_color = Color.PURPLE

		VisionType.COLLECTIBLE:
			mat.albedo_color = Color.GREEN

		VisionType.OBJECTIVE:
			mat.albedo_color = Color.YELLOW

	mat.emission_enabled = true
	mat.emission = mat.albedo_color
	mat.emission_energy_multiplier = 3.0

	mesh.material_override = mat
func disable_highlight():
	mesh.material_override = original_material
