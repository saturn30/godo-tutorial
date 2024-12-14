extends CanvasLayer

@export var arena_time_manager: Node
@onready var label = %Label

func _process(delta: float) -> void:
	if arena_time_manager == null:
		return
	var time_elpased = arena_time_manager.get_time_elapse()
	label.text = format_seconds_to_string(time_elpased)

func format_seconds_to_string(seconds: float):
	var minutes = floor(seconds / 60)
	var remaining_seconds = floor(fmod(seconds, 60))

	return str(minutes) + ":" + ("%02d" % remaining_seconds)
