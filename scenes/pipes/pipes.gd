extends Node2D

@onready var score_sound = $ScoreSound


func _ready():
	pass


func _process(delta):
	position.x -= GameManager.SCROLL_SPEED * delta

func _on_screen_exited():
	queue_free()


func _on_pipe_body_entered(body):
	if body.is_in_group(GameManager.GROUP_PLAYER) && body is PlaneObject:
		body._die()
		



func _on_laser_body_exited(body):
	score_sound.play()
	if body.is_in_group(GameManager.GROUP_PLAYER):
		ScoreManager.increment_score()
		print("laser exited")
	
