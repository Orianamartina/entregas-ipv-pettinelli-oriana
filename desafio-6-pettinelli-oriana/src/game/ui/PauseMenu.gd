extends Control

## Menú de pausa genérico, abierto utilizando la acción "pause_menu"
## (por default la tecla Esc).
@onready var options_menu = $OptionsMenu
signal return_requested()

func _ready() -> void:
	hide()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("pause_menu") && !options_menu.visible:
		visible = !visible
		get_tree().paused = visible

func _on_resume_button_pressed() -> void:
	get_tree().paused = false
	hide()


func _on_back_button_pressed() -> void:
	return_requested.emit()
