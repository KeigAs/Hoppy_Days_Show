extends CanvasLayer


func _ready():
	pass


func update_lives(lives_left):
	$Control/TextureRect/HBoxContainer/LifeContainer/LifeCount.text = String(lives_left)

func update_coins(coins):
	$Control/TextureRect/HBoxContainer/CoinCointainer/CoinCount.text = String(coins)
