extends State

var enemy : EnemyBehaviour

func Enter() -> void:
	enemy = entity
	enemy.StartAnimation(self)