# kitten.coffee

exports.register_model = (mongoose) ->

	# this initializes the schema for the model
	Kitten = new mongoose.Schema {name: String}

	# NOTE: methods must be added to the schema before compiling it with mongoose.model()
	try 
		Kitten.methods.speak = ->
			greeting = if this.name then "Meow my name is #{this.name}" else "I don't have a name"
			console.log(greeting)
	
	catch err 
		console.log("Still cannot add method speak")
		throw err
	
	# now we compile our model and register it 
	mongoose.model 'Kitten', Kitten

	return null
	
	# If, for example, we assume the model's name is Kitten,
	# then we would have used the following to compile and register it:
	# mongoose.model('Kitten', Kitten);

	# once this has been done, one can obtain the model
	# in other files with
	# Kitten = mongoose.model('Kitten'); 