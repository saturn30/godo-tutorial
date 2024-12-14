extends Camera2D

var target_position = Vector2.ZERO

func _ready() -> void:
	make_current()


func _process(delta: float) -> void:
	acquire_target()
	if global_position.distance_to(target_position) > 1:
		global_position = global_position.lerp(target_position, 1 - exp(-delta * 30))

func acquire_target():
	var player_nodes = get_tree().get_nodes_in_group("player")
	if player_nodes.size() > 0:
		var player = player_nodes[0] as Node2D
		target_position = player.global_position
		
