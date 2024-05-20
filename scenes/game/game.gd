extends Node2D


@export var pipes_scene: PackedScene
@onready var pipes_holder = $PipesHolder
@onready var top_marker = $TopMarker
@onready var bottom_marker = $BottomMarker
@onready var spawn_timer = $SpawnTimer
@onready var parallax_background = $ParallaxBackground

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	ScoreManager.reset_score()
	SignalManager.on_plane_died.connect(_on_plane_died)




func _spawn_pipes() -> void:
	var new_pipes = pipes_scene.instantiate()
	var rand_y = randf_range(bottom_marker.position.y, top_marker.position.y)
	new_pipes.position = Vector2(top_marker.position.x, rand_y)
	pipes_holder.add_child(new_pipes)
	
func _stop_pipes() -> void:
	spawn_timer.stop()
	for pipe in pipes_holder.get_children():
		pipe.set_process(false)
	
	
func _on_spawn_timer_timeout():
	_spawn_pipes()

func _on_plane_died():
	_stop_pipes()
