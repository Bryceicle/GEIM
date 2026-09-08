extends Camera2D

@onready var main: Node2D = $"../"
@onready var player: CharacterBody2D = $"../Fisherman"
@onready var dialogue: Node2D = $dialogue
@onready var pauseMenu: Node2D = $pauseMenu

const dialoguePreload = preload("res://scenes/UI/dialogue.tscn")
const pauseMenuPreload = preload("res://scenes/UI/pauseMenu.tscn")

var staticCam: bool
var dialogueNode: CanvasLayer = dialoguePreload.instantiate()
var pauseMenuNode: CanvasLayer = pauseMenuPreload.instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !staticCam:
		self.position = player.position

func loadDialogue(text: String = "", char: int = -1) -> void:
	
	dialogue.add_child(dialogueNode)
	dialogue.get_child(0).addText(text, char)

func removeDialogue() -> void:
	
	if dialogue.get_child_count() != 0:
		dialogue.get_child(0).clearText()
		dialogue.remove_child(dialogueNode)

func togglePauseMenu() -> void:
	
	if pauseMenu.get_child_count() == 0:
		pauseMenu.add_child(pauseMenuNode)
	else:
		pauseMenu.remove_child(pauseMenuNode)
