extends Node
class_name HealthComponent

signal die

@export var max_health: float = 10
var current_health

func _ready():
	current_health = max_health

func damage(damage_value: float):
	current_health = max(current_health - damage_value, 0)
	Callable(check_death).call_deferred()

func check_death():
	if(current_health == 0):
		die.emit()
		owner.queue_free()
