@icon("res://addons/escape-room-essentials/scene.svg")
class_name Scene
extends Node

@onready var scene_nav_list = get_tree().get_nodes_in_group("secne_nav")
@onready var scene_trans_list: Array[SceneTrans] = (
	get_tree().get_nodes_in_group("secne_trans") as Array[SceneTrans]
)
@onready var scene_trnas_num = scene_trans_list.size()
var completed_trans := 0


func _ready() -> void:
	for scene_nav in scene_nav_list:
		scene_nav.connect("nav_to", _on_nav_to)
	for scene_trans in scene_trans_list:
		scene_trans.enter()


func _on_nav_to(scene: String):
	if scene_trnas_num == 0:
		get_tree().change_scene_to_file(scene)
	for scene_trans in scene_trans_list:
		scene_trans.connect("leave_complete", _on_leave_complete.bind(scene))
		scene_trans.leave()


func _on_leave_complete(scene: String):
	completed_trans += 1
	if completed_trans == scene_trnas_num:
		get_tree().change_scene_to_file(scene)
