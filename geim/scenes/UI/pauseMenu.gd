extends CanvasLayer

@onready var camera: Camera2D = $"/root/main/Camera"
@onready var continueSelect: TextureRect = $continueButton/continueSelect
@onready var quitSelect: TextureRect = $quitButton/quitSelect
@onready var root: SceneTree = get_tree()

func _on_continue_area_mouse_entered() -> void:
	continueSelect.visible = true

func _on_continue_area_mouse_exited() -> void:
	continueSelect.visible = false

func _on_continue_area_input_event(viewport: Node, event: InputEventMouseButton, shape_idx: int) -> void:
	root.paused = false
	camera.togglePauseMenu()

func _on_quit_area_mouse_entered() -> void:
	quitSelect.visible = true

func _on_quit_area_mouse_exited() -> void:
	quitSelect.visible = false

func _on_quit_area_input_event(viewport: Node, event: InputEventMouseButton, shape_idx: int) -> void:
	root.quit()
