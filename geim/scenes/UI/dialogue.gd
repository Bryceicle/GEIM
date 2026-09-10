extends CanvasLayer

enum Characters {
	FISHERMAN,
	NONE
}

@onready var dialougeText: RichTextLabel = $dialogueBox/dialogueText
@onready var characters: CanvasLayer = $characters

func addText(text: String = "", char: int = -1):
	
	dialougeText.add_text(text)
	
	if char != -1:
		characters.get_child(char).visible = true

func clearText():
	dialougeText.clear()
	for child in characters.get_children():
		child.visible = false
