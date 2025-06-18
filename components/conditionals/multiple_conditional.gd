extends Conditional

enum BOOLEAN_RELATION { AND, OR, NOT }

@export var relation : BOOLEAN_RELATION = BOOLEAN_RELATION.AND

func _ready():
	_ensure_children_conditionals()	

func check() -> bool:
	match relation:
		BOOLEAN_RELATION.AND: return _check_and()
		BOOLEAN_RELATION.OR: return _check_or()
		BOOLEAN_RELATION.NOT: return _check_not()
	
	return false

func _check_and() -> bool:
	for child : Conditional in get_children():
		if not child.check():
			return false
		
	return true

func _check_or() -> bool:
	for child : Conditional in get_children():
		if child.check():
			return true
	
	return false
	
func _check_not() -> bool:
	return not _check_or()
	
func _ensure_children_conditionals() -> bool:
	for child in get_children():
		if not (child is Conditional):
			push_error(name + " contains non-Conditional chilren")
			get_tree().quit()
	
	return true
