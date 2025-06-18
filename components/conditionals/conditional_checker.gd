class_name ConditionalChecker
extends Node

var integer : int = 0
@export var tester : int = 2

func _ready():
	_ensure_children_conditionals()
	_ensure_one_child()

func _process(delta : float) -> void:
	integer += 1
	
	if integer % tester == 0:
		print(check_conditional())

func check_conditional() -> bool:
	return (get_child(0) as Conditional).check()

func _ensure_children_conditionals() -> void:
	for child in get_children():
		if not (child is Conditional):
			push_error(name + " contains non-Conditional chilren")
			get_tree().quit()
		
func _ensure_one_child() -> void:
	if get_child_count() != 1:
		push_error(name + " contains no children or more than one child")
		get_tree().quit()
