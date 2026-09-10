extends CanvasLayer

@onready var inventory: CanvasLayer = $inventory
@onready var astroParts: CanvasLayer = $astroParts
@onready var itemDescription: RichTextLabel = $itemDescription
@onready var player: CharacterBody2D = $"/root/main/Fisherman"

func _ready() -> void:
	displayInventory()

func displayInventory() -> void:
	
	var inventoryCopy = player.getInventory()
	
	for i in inventoryCopy:
		if inventoryCopy[i] == 1:
			inventory.get_child(i).visible = true
		else:
			inventory.get_child(i).visible = false

func _on_keys_area_mouse_entered() -> void:
	itemDescription.append_text("[u][b]Keys[/b][/u]
The keys to my heart. Just kidding! They're for my boat.")

func _on_keys_area_mouse_exited() -> void:
	itemDescription.clear()


func _on_knife_area_mouse_entered() -> void:
	pass # Replace with function body.


func _on_knife_area_mouse_exited() -> void:
	pass # Replace with function body.
