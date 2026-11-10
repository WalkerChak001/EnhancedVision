extends Node

@export var mesh_path : NodePath

var mesh : MeshInstance3D

func _ready():
	mesh = get_node(mesh_path)

func enable_highlight(type):
	if !mesh:
		return

	var material = StandardMaterial3D.new()

	match type:
		0:
			material.albedo_color = Color.BLUE

		1:
			material.albedo_color = Color.YELLOW

		2:
			material.albedo_color = Color.GREEN

		_:
			material.albedo_color = Color.WHITE

	material.emission_enabled = true
	material.emission = material.albedo_color

	mesh.material_override = material

func disable_highlight():
	if mesh:
		mesh.material_override = null
