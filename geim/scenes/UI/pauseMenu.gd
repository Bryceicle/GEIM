extends CanvasLayer

@onready var camera: Camera2D = $"../../"
@onready var continueSelect: TextureRect = $continueButton/continueSelect
@onready var root: SceneTree = get_tree()

func _on_continue_area_mouse_entered() -> void:
	continueSelect.visible = true

func _on_continue_area_mouse_exited() -> void:
	continueSelect.visible = false

func _on_continue_area_input_event(viewport: Node, event: InputEventMouseButton, shape_idx: int) -> void:
	root.paused = false
	camera.togglePauseMenu()
