extends Control
enum GAME_OVER_STATE {over, space}



@onready var go = $MarginContainer/GO
@onready var space_label = $MarginContainer/SpaceLabel
@onready var timer = $Timer
@onready var game_over_sound = $GameOverSound

var state: GAME_OVER_STATE = GAME_OVER_STATE.over

# Called when the node enters the scene tree for the first time.
func _ready():
	
	hide()
	SignalManager.on_plane_died.connect(on_plane_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("fly") && state == GAME_OVER_STATE.space:
		GameManager.load_main_scene()


func on_plane_died() -> void:
	game_over_sound.play()
	timer.start()
	show()


func run_squence():
	go.hide()
	space_label.show()
	state = GAME_OVER_STATE.space
	

func _on_timer_timeout():
	run_squence()
