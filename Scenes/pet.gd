extends Node2D



@onready var pet: AnimatedSprite2D = $Pet

func _ready() -> void:
	
	get_window().size = pet.sprite_frames.get_frame_texture(pet.animation, 0).get_size()
	get_window().position = Vector2i(0,0)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			print("IT CLICKS")
