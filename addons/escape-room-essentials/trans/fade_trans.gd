extends SceneTrans
class_name FadeTrans

@onready var rect = $ColorRect


func _ready() -> void:
	super()


func enter() -> void:
	rect.color.a = 1
	rect.show()
	var tween := create_tween()
	tween.tween_property(rect, "color:a", 0, 0.5)


func leave() -> void:
	rect.show()
	rect.color.a = 0
	var tween := create_tween()
	tween.tween_property(rect, "color:a", 1, 0.5)
	tween.connect("finished", _on_leave_complete)
