extends Button

onready var currency = Global.game_state["currency"]
onready var price = get_parent().get_node("PriceLabel").price
	
func _process(_delta):
	self.disabled = true if (currency < price) else false
	
func _buy(price):
	if Global.game_state["currency"] >= price:
		Global.game_state["currency"] -= price
		currency = Global.game_state["currency"]
		Global.save_game()
		
	else:
		var rem = price - Global.game_state["currency"]
		print(rem)


func _on_PurchaseButton_pressed():
	_buy(price)
