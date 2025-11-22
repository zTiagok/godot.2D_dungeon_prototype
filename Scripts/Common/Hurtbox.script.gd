class_name Hurtbox extends Area2D

signal isDamaged(damage: float)

func TakeDamage( damage: float ) -> void:
	print("Took Damage: ", damage)

	isDamaged.emit(damage)