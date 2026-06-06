@tool

extends Node

@onready var input: Label = $HBoxContainer/PanelInput/Input
@onready var action: Label = $HBoxContainer/Action

@export var action_input: String: set = _set_action_input
@export var action_name: String: set = _set_action_name

func _ready() -> void:
	if input:
		input.text = action_input
	if action:
		action.text = action_name

func _set_action_input(new_input: String) -> void:
	action_input = new_input
	if Engine.is_editor_hint() && has_node("HBoxContainer/PanelInput/Input"):
		input.text = new_input

func _set_action_name(new_name: String) -> void:
	action_name = new_name
	if Engine.is_editor_hint() && has_node("HBoxContainer/Action"):
		action.text = new_name
