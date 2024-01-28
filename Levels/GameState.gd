extends Node2D

var lives = 3
var coins = 0
const COINS_TO_LIVE = 5

func _ready():
	add_to_group("GameState")
	update_GUI()

func coin_up():
	coins += 1
	
	if COINS_TO_LIVE == coins:
		lives += 1
		coins = 0
	update_GUI()	

func hurt():
	lives -= 1
	get_tree().call_group("Player", "hurt")
	update_GUI()
	if lives < 0:
		end_game()
		
func update_GUI():
	get_tree().call_group("GUI", "update_lives", lives)
	get_tree().call_group("GUI", "update_coins", coins)

func win_game():
	get_tree().change_scene_to_file("res://Menues/LevelComplete.tscn")	
	
func end_game():
	get_tree().change_scene_to_file("res://Menues/GameOver.tscn")
