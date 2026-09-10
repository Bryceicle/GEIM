extends Camera2D

@onready var main: Node2D = $"/root/main"
@onready var player: CharacterBody2D = $"/root/main/Fisherman"
@onready var dialogue: Node2D = $dialogue
@onready var pauseMenu: Node2D = $pauseMenu
@onready var inventoryMenu: Node2D = $inventoryMenu

const dialoguePreload = preload("res://scenes/UI/dialogue.tscn")
const pauseMenuPreload = preload("res://scenes/UI/pauseMenu.tscn")
const inventoryMenuPreload = preload("res://scenes/UI/inventoryMenu.tscn")

var staticCam: bool
var dialogueNode: CanvasLayer = dialoguePreload.instantiate()
var pauseMenuNode: CanvasLayer = pauseMenuPreload.instantiate()
var inventoryMenuNode: CanvasLayer = inventoryMenuPreload.instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !staticCam:
		self.position = player.position

func setCamera(x:int,y:int) -> void:
	self.position = Vector2(x,y)

func loadDialogue(text: String = "", char: int = -1) -> void:
	
	dialogue.add_child(dialogueNode)
	dialogue.get_child(0).addText(text, char)

func removeDialogue() -> void:
	
	if dialogue.get_child_count() != 0:
		dialogue.get_child(0).clearText()
		dialogue.remove_child(dialogueNode)

func toggleInventoryMenu() -> void:
	
	if inventoryMenu.get_child_count() == 0:
		inventoryMenu.add_child(inventoryMenuNode)
		inventoryMenu.get_child(0).request_ready()
	else:
		inventoryMenu.remove_child(inventoryMenuNode)

func togglePauseMenu() -> void:
	
	if inventoryMenu.get_child_count() != 0:
		inventoryMenu.remove_child(inventoryMenuNode)
	
	if pauseMenu.get_child_count() == 0:
		pauseMenu.add_child(pauseMenuNode)
	else:
		pauseMenu.remove_child(pauseMenuNode)
