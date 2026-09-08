extends CharacterBody2D

enum Items {
	COAT,
	KEYS,
	KNIFE
}

const SPEED = 120
const ACCELERATION = 1000
const DEACCELERATION = 1500

var map: Node2D
var interactableNode: Node2D
var inventory: Array

@onready var character_sprite: AnimatedSprite2D = $Sprite
@onready var camera: Camera2D = $"../Camera"

func _input(event: InputEvent) -> void:
	
	# Checks for an interactible node, and if one exists, interacts with it
	if Input.is_action_just_pressed("interact"):
		if interactableNode != null:
			interactableNode.interact()
		return
	
	if Input.is_action_just_pressed("clear"):
		if camera.dialogueShown:
			camera.removeDialogue()
		return
	
	# Updates sprite based on direction of movement 
	if Input.is_action_pressed("move_down"):
		character_sprite.play("Fisherman Walk Down")
		return
	
	if Input.is_action_pressed("move_up"):
		character_sprite.play("Fisherman Walk Up")
		return
	
	if Input.is_action_pressed("move_left"):
		character_sprite.play("Fisherman Walk Left")
		character_sprite.flip_h = false
		return
	
	if Input.is_action_pressed("move_right"):
		character_sprite.play("Fisherman Walk Left")
		character_sprite.flip_h = true
		return
	
	# Ignores events that arent currently pressed 
	if not event.is_pressed():
		character_sprite.stop()
		return

func _physics_process(delta: float) -> void:

	# Get the input direction
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	# Get the desired velocity
	var desired_velocity := Vector2(SPEED * direction.x, SPEED * direction.y)
	# Accelerate player to desired velocity 
	velocity = Vector2(
		move_toward(velocity.x,desired_velocity.x, (ACCELERATION if sign(velocity.x) == sign(direction.x) else DEACCELERATION) * delta),
		move_toward(velocity.y,desired_velocity.y, (ACCELERATION if sign(velocity.y) == sign(direction.y) else DEACCELERATION) * delta)
	)

	move_and_slide()

func addItem(item):
	inventory.append(item)


"""
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
"""
