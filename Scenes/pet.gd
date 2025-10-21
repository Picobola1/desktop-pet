extends AnimatedSprite2D

# 🐾 Variables for dragging
var able_drag: bool = false
var drag_offset: Vector2 = Vector2.ZERO

func _ready() -> void:
	# Make window clickable + visible
	get_window().transparent = true
	get_window().mouse_passthrough = false
	get_window().always_on_top = true

func _process(delta: float) -> void:
	# When dragging, move window to follow the cursor
	if able_drag:
		get_window().position = Vector2i(get_global_mouse_position() - drag_offset)

# 🖱️ Called when you interact with the Area2D around the sprite
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			# Start dragging when mouse is pressed
			able_drag = true
			drag_offset = (get_global_mouse_position() - Vector2(get_window().position)) * 0.5

			print("hello")  # Optional feedback when clicked
		else:
			# Stop dragging when mouse is released
			able_drag = false
