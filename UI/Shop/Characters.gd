extends Tabs

onready var price2 = str2var($RichTextLabel/Control/Panel2/Label.text)
onready var price3 = str2var($RichTextLabel/Control/Panel3/Label.text)


func _process(delta):
	$RichTextLabel/Control.position.x = -$HScrollBar.value

func _buy(price):
	if ScoreLabel.num >= price:
		ScoreLabel.num -= price
	else:
		var rem = price - ScoreLabel.num
		printt(rem)


func _on_Button2_pressed():
	_buy(price2)


func _on_Button3_pressed():
	_buy(price3)


func _on_Button4_pressed():
	pass # Replace with function body.


func _on_Button5_pressed():
	pass # Replace with function body.
