extends Area2D

onready var menuPopup = get_node("../PopUp")

func _on_AnimationPlayer_animation_finished(anim_name):
	var levelName = get_tree().get_current_scene().get_name()
	if levelName == "Level6":
		menuPopup.thankYou()
	else:
		menuPopup.levelComplete()
	menuPopup.popup()


func _on_AnimationPlayer_animation_started(anim_name):
	BackgroundMusic.stop()
	$FanfareSound.play()
