extends Node2D

@onready var main : Node2D = $"../../"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func get_spawn(state: int = 0) -> Vector2i:
	
	var spawn: Vector2i
	
	match state:
		0: spawn = Vector2i(-112,147)
		1: spawn = Vector2i(107,14)
		_: spawn = Vector2i(-112,147)
	
	return spawn

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
