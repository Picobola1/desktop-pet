extends Node2D



@onready var pet: AnimatedSprite2D = $Pet

var clicks = 0

func _ready() -> void:
	var petScale = pet.scale
	petScale = Vector2(2,2)
	pet.scale = petScale
	get_window().size = Vector2i(pet.sprite_frames.get_frame_texture(pet.animation, 0).get_size()* petScale)
	var ScreenSize = DisplayServer.screen_get_size()
	var window_size = get_window().size
	get_window().position = ScreenSize - window_size - Vector2i(0,70) 

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if clicks == 0:
			if event.pressed:
				clicks += 1
				for i in range(355):
					get_window().position += Vector2i(-5,0)
					pet.play("walk")
					await get_tree().process_frame
				pet.flip_h = false
				await get_tree().create_timer(1.0).timeout
				pet.play("idle")
		elif clicks == 1:
			clicks = 0
			for i in range(355):
				get_window().position += Vector2i(5,0)
				pet.play("walk")
				await get_tree().process_frame
			pet.flip_h = true
			pet.play("idle")
