extends Area2D

@onready var player: CharacterBody2D = $"../../../Fisherman"
@onready var camera: Camera2D = $"../../../Camera"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		player.interactableNode = self

func interact() -> void:
	player.addItem("KNIFE")
	camera.loadDialogue("Never know when you'll need a knife ...", 0)
	self.queue_free()
