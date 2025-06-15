class_name PhysicsComponent
extends Node

var gravity : float = ProjectSettings.get_setting("physics/2d/default_gravity")

var parent : CharacterBody2D

@export_range(0, 30000, 0.1) var speed : float = 10000
@export_range(0, 1000, 0.1) var jump_force : float = 300
@export_range(0, 1, 0.01) var friction : float = 0.2

var horizontal_direction : int = 0

var jump_scheduled : bool = false

func init(parent : CharacterBody2D):
	self.parent = parent

func process_physics(delta : float) -> void:
	_apply_gravity(delta)
	_process_jump(delta)
	
	_process_horizontal_movement(delta)
	
	parent.move_and_slide()

func _apply_gravity(delta : float) -> void:	
	if not parent.is_on_floor():
		parent.velocity.y += gravity * delta
		
	if parent.is_on_floor():
		parent.velocity.y = 0

func _process_jump(delta: float) -> void:
	if not jump_scheduled:
		return
		
	jump_scheduled = false
	parent.velocity.y = -jump_force

func _process_horizontal_movement(delta: float) -> void:
	parent.velocity.x = lerp(parent.velocity.x, horizontal_direction * speed * delta, friction)

func move(h_direction : float) -> void:
	if h_direction > 0:
		horizontal_direction = 1
	
	if h_direction < 0:
		horizontal_direction = -1
	
	if h_direction == 0:
		horizontal_direction = 0

func stop_moving() -> void:
	move(0)

func schedule_jump() -> void:
	jump_scheduled = true
	
func object_is_on_floor() -> bool:
	return parent.is_on_floor()
	
func get_object_velocity() -> Vector2:
	return parent.velocity
