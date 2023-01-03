extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	var animation_player = get_node("AnimationPlayer")
	animation_player.play("OpenClose")
	animation_player.connect("animation_finished", animation_player, "play")
