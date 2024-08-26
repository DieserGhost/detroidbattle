extends MeshInstance3D

# Variables to control speed and direction
var speed : float = 5.0
var rotation_speed : float = 3.0
var velocity : Vector3 = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_handle_movement(delta)

func _handle_movement(delta: float) -> void:
	# Reset velocity each frame
	velocity = Vector3.ZERO

	# Get input for movement (WASD or Arrow Keys)
	if Input.is_action_pressed("ui_forward"):
		velocity.z -= 1
	if Input.is_action_pressed("ui_backward"):
		velocity.z += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	
	# Normalize to prevent diagonal speed boost, then apply speed
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed * delta

	# Rotate with mouse or keyboard input (you can implement rotation logic here)

	# Apply movement in the direction the player is facing
	translate(velocity)

# Called when input is received. Use it to detect mouse or keyboard for rotation.
func _input(event):
	if event is InputEventMouseMotion:
		# Handle mouse rotation (you can expand this for a full rotation system)
		rotate_y(-event.relative.x * rotation_speed * 0.001)
