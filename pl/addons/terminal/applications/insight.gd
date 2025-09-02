extends TApp
func _ready():
	name = "INSIGHT"
	description = ""

func run(Terminal : terminal, params : Array):
	if params.is_empty():
		Terminal.add_to_log("You must name them.")
		return

	if FileAccess.file_exists("user://"+ params[0] + ".save"):
		Terminal.add_to_log("Loading not yet implemented :(")
		#implement loading
	else:
		var save_file = FileAccess.open("user://"+ params[0] + ".save",FileAccess.WRITE)
		var save_dict = {}
		save_dict["file_name"] = params[0]
		var data = JSON.stringify(save_dict)
		save_file.store_line(data)
		save_file.close()
		Terminal.add_to_log("Save file created")
	
func breakdown_params(params):
	var to_return = []
	for i in range(params.size()):
		var param_breakdown = [params[i], i]
		to_return += [param_breakdown]
	return to_return
