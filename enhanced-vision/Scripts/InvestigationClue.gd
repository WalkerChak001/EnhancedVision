extends Area2D

@export var clue_name : String
@export_multiline var clue_description : String

var discovered : bool = false

func investigate():
	discovered = true

	print("Clue Found: " + clue_name)
	print(clue_description)
