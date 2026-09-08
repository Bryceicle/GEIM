extends Camera2D

enum Characters {
	NONE,
	FISHERMAN
}

@onready var main: Node2D = $"../"
@onready var player: CharacterBody2D = $"../Fisherman"
@onready var dialogueUI: CanvasLayer = $dialogueUI
@onready var dialogueText: RichTextLabel = $dialogueUI/dialogueBox/dialogueText
@onready var characters: CanvasLayer = $dialogueUI/characters

var staticCam: bool = true
var dialogueShown: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !staticCam:
		self.position = player.position

func showDialogue(text: String = "", char: int = -1) -> void:
	
	dialogueShown = true
	dialogueUI.visible = true
	dialogueText.add_text(text)
	
	if char != -1:
		characters.get_child(char).visible = true

func removeDialogue() -> void:
	dialogueShown = false
	dialogueText.clear()
	dialogueUI.visible = false
	for child in characters.get_children():
		child.visible = false
