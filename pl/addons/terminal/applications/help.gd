extends TerminalApplication

func _init():
	name="HELP"
	description="Shows descriptions of all available programs"
	
func run(Terminal : terminal, params : Array):
	var files = DirAccess.get_files_at(Terminal.path)
	if(is_verbose(params)):
		for file in files:
			if(".gd" in file):
				var file_name : String = file.replace('.remap', '') #Godot 4 production, renames files when compiled, automapped in load function
				var application = load(Terminal.path+file).new()
				var help_text = application.name + " - " + application.description
				Terminal.add_to_log(help_text)
	else:
		for file in files:
			if(".gd" in file):
				Terminal.add_to_log(file.replace(".gd",""))
				
func is_verbose(params):
	var verbose_tags = ['verbose','-v']
	for param in params:
		if param.to_lower() in verbose_tags:
			return true
	return false
