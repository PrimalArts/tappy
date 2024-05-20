extends Control

@onready var hs_score = $MC/HsScore

func _ready():
	hs_score.text = str(ScoreManager.high_score)



func _process(_delta):
	if Input.is_action_just_pressed("fly"):
		GameManager.load_game_scene()
