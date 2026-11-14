extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -700.0
var start_position: Vector2
var direction: Vector2

func teleport_to_start() -> void:
	global_position = start_position

func _ready() -> void:
	start_position = global_position

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	
	# Attempt at getting the teleporting working
	
	# var collision := move_and_collide(direction * delta)
	# if collision != null:
		# var body := collision.get_collider()
		# if body.get_property_list()[name] == "teleporter":
			# teleport_to_start()
# direction = Input.get_axis("move_left", "move_right")
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
