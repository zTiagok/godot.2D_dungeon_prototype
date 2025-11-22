extends Control


@export var labelState: Label


# Função utilizada para o sinal "State Changed" no node StateMachine.
func SignalStateChanged(stateName: String) -> void:
	labelState.text = "State: " + stateName
