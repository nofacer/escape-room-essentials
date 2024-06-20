@icon("res://addons/escape-room-essentials/scene_nav.svg")
class_name SceneNav
extends Area2D

signal nav_to(target_scene: String)

@export_file var target_scene


func _ready() -> void:
	add_to_group("scene_nav")


func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if not event.is_action_pressed("interact"):
		return
	nav_to.emit(target_scene)
