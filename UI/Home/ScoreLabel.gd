extends Label

onready var num = _load(Global.score, save_path)
var save_path = 'my_number'

func _ready():
	 pass 
	
func _process(delta):
	text = str(num)

func _save(content, path):
	var file = File.new()
	file.open('user://' + path, file.WRITE)
	file.store_var(content)
	file.close()

func _load(content, path):
	var file = File.new()
	if not file.file_exists('user://' + path):
		return 0
	file.open('user://' + path , file.READ)
	content = file.get_var(content)
	file.close()
	return content
	
	
func _on_Button_pressed():
	num += 10
	_save(num, save_path)
	

	
