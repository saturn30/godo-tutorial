extends Node

@export var basic_enemy_scene: PackedScene
const SPAWN_RADIUS = 330

func _ready() -> void:
	$Timer.timeout.connect(on_timer_timeout)
	
func on_timer_timeout():
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return
		
	# 너비가 640이므로 대충 330픽셀 사이즈의 원을 만들고 해당 원의 둘레에 적 생성할것
	var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	var spawn_position = player.global_position + (random_direction * SPAWN_RADIUS)

	var enemy = basic_enemy_scene.instantiate() as Node2D
	get_parent().add_child(enemy)
	enemy.position = spawn_position
