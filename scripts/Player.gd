extends KinematicBody

export var sense = .1
export var max_angle = 90
export var min_angle = -80
export var speed = 20


var rotation_look = Vector3.ZERO
var move_direction = Vector3.ZERO
var velocity = Vector3.ZERO

onready var head = $Neck

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _physics_process(delta: float) -> void:
	head.rotation_degrees.x = rotation_look.x
	rotation_degrees.z = rotation_look.z
	
	
	move_direction = Vector3(Input.get_axis("left","right"), 0, Input.get_axis("back", "forward")).normalized().rotated(Vector3.UP, - rotation.z)
	
	velocity.x = move_direction.x
	velocity.z = move_direction.z
	
	velocity = move_and_slide(velocity * speed, Vector3.UP)
	
func _input(event):
	if event is InputEventMouseMotion:
		rotation_look.z -= (event.relative.x * sense)
		rotation_look.x -= (event.relative.y * sense)
		rotation_look.x = clamp(rotation_look.x, min_angle, max_angle)
		
