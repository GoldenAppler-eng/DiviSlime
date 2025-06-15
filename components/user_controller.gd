extends Controller

func get_horizontal_axis() -> float:
	return Input.get_axis("move_left", "move_right")

func get_jump_request() -> bool:
	return Input.is_action_just_pressed("jump")
