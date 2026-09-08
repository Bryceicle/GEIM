extends Node2D

@onready var main : Node2D = $"../../"
@onready var camera : Node2D = $"../../Camera"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera.staticCam = true
	
func get_spawn(state: int = 0) -> Vector2i:
	
	var spawn: Vector2i
	
	match state:
		0: spawn = Vector2i(-113,141)
		1: spawn = Vector2i(107,14)
		_: spawn = Vector2i(-112,147)
	
	return spawn

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_door_body_entered(body: Node2D) -> void:
	main.load_map(0, 0)
