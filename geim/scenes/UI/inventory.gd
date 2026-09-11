extends CanvasLayer

enum itemEnum {
	KEYS,
	KNIFE
}

var itemDict = {
	itemEnum.KEYS: ["Keys", "The keys to my heart. Just kidding! They're for my boat."],
	itemEnum.KNIFE: ["Knife", "A pointy knife. What am I cutting?"]
}

@onready var inventory: CanvasLayer = $inventory
@onready var astroParts: CanvasLayer = $astroParts
@onready var itemDescription: RichTextLabel = $itemDescription
@onready var itemLabel: RichTextLabel = $itemLabel
@onready var player: CharacterBody2D = $"/root/main/Fisherman"

func _ready() -> void:
	displayInventory()

func displayInventory() -> void:
	
	var inventoryCopy = player.getInventory()
	
	for i in range(inventoryCopy.size()):
		if inventoryCopy[i]:
			inventory.get_child(i).visible = true
		else:
			inventory.get_child(i).visible = false

func displayItemInfo(item) -> void:
	itemLabel.append_text(itemDict[item][0])
	itemDescription.append_text(itemDict[item][1])

func clearItemInfo() -> void:
	itemLabel.clear()
	itemDescription.clear()

func _on_keys_area_mouse_entered() -> void:
	displayItemInfo(itemEnum.KEYS)

func _on_keys_area_mouse_exited() -> void:
	clearItemInfo()

func _on_knife_area_mouse_entered() -> void:
	displayItemInfo(itemEnum.KNIFE)

func _on_knife_area_mouse_exited() -> void:
	clearItemInfo()
