extends Node2D

@onready var main : Node2D = get_node("/root/main")
@onready var camera : Node2D = get_node("/root/main/Camera")
@onready var animation: AnimatedSprite2D = $beachAnimation

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera.staticCam = false
	waves()

func waves() -> void:
	animation.play()

func get_spawn(state: int = 0) -> Vector2i:
	
	var spawn: Vector2i
	
	match state:
		0: spawn = Vector2i(-278, -319)
		1: spawn = Vector2i(-677, -580)
		_: spawn = Vector2i(-677, -580)
	
	return spawn

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_fish_door_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		main.load_map(1, 0)
