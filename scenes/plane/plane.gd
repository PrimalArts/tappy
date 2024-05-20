extends CharacterBody2D

class_name PlaneObject



var speed:float = 20
const POWER:float = -350
const BOUNCE:float = 50

const GRAVITY: float = 880.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: AnimatedSprite2D = $Sprite
@onready var engine_sound = $EngineSound


func _ready():
	pass 
	
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	_fly()
	
	move_and_slide()
	
	if is_on_floor(): 
		_die()
	
	if is_on_ceiling(): 
		_bounce()


func _die() ->  void:
	sprite.stop()
	SignalManager.on_plane_died.emit()
	#ScoreManager.reset_score()
	set_physics_process(false)
	engine_sound.stop()
	
	
	
func _fly(): 
	if Input.is_action_just_pressed("fly"):
		velocity.y = POWER
		animation_player.play("power")
		
func _bounce() -> void:
	velocity.y = BOUNCE
	
