extends RayCast

onready var prompt = $Prompt


func _ready() -> void:
	add_exception(owner)

func _physics_process(delta: float):
	prompt.text = ""
	if is_colliding():
		var detected = get_collider()
		if detected is Interactable: 
			prompt.text = "Press E to Interact"
			if Input.is_action_just_pressed("interact"):
				detected.get_child(0).play("rotat")
		
