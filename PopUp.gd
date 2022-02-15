extends Popup

var button1
var button2
var button3

func _ready():
	button1 = get_node("CenterContainer/Panel/VBoxContainer/Button1")
	button2 = get_node("CenterContainer/Panel/VBoxContainer/Button2")
	button1.connect("pressed", self, "playAgain")
	button2.connect("pressed", self, "levelSelect")

func playAgain():
	get_tree().reload_current_scene()

func mainMenu():
	get_tree().change_scene("res://TitleScreen.tscn")

func levelSelect():
	get_tree().change_scene("res://LevelSelect.tscn")
	BackgroundMusic.menuMusic()

func nextLevel():
	var sceneName = get_tree().get_current_scene().get_name()
	var levelNumber = int(sceneName[-1]) + 1
	get_tree().change_scene("res://Level"+str(levelNumber)+".tscn")
	BackgroundMusic.levelMusic()

func levelComplete():
	button1.disconnect("pressed", self, "playAgain")
	button1.connect("pressed", self, "nextLevel")
	$CenterContainer/Panel/VBoxContainer/Label.text = "\n\nLEVEL COMPLETE!\n"
	$CenterContainer/Panel/VBoxContainer/Button1.text = "Next Level"
	$CenterContainer/Panel/VBoxContainer/Button2.text = "Level Select"

func thankYou():
	button1.connect("pressed", self, "levelSelect")
	button2.connect("pressed", self, "mainMenu")
	$CenterContainer/Panel/VBoxContainer/Label.text = "\nThank you for playing my very first Game Jam game! I hope you enjoyed it!\n"
	$CenterContainer/Panel/VBoxContainer/Button1.text = "Level Select"
	$CenterContainer/Panel/VBoxContainer/Button2.text = "Main Menu"
