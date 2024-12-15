extends Node

var current_experience = 0

func _ready() -> void:
	GameEvents.experience_vial_collected.connect(increase_experience)

func increase_experience(number: float):
	current_experience += number
	print(current_experience)

func on_experience_vial_collected(number: float):
	increase_experience(number)
