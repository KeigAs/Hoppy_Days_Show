extends Control



func _on_TryAgainButton_pressed():
	get_tree().change_scene_to_file("res://Levels/Level1.tscn")
	


func _on_EndGameButton_pressed():
	get_tree().quit()





func _on_try_again_row_mouse_entered():
#	$CenterContainer/VBoxContainer/HBoxContainer/try_again_row/BunnyIcon.set_visible(true)
# still dont know how to make those bunnyicons work on mouse over !
	pass
