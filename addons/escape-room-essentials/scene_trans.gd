@icon("res://addons/escape-room-essentials/scene_trans.svg")

class_name SceneTrans

extends Node

signal leave_complete


func _ready() -> void:
	add_to_group("scene_trans")


func enter() -> void:
	pass


func leave() -> void:
	pass


func _on_leave_complete() -> void:
	leave_complete.emit()
