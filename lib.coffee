# lib.coffee

mongoose = require 'mongoose'
fs = require 'fs'


exports.start_the_server = ->

	mongoose.connect 'mongodb://localhost/test', (err) ->
		if err
			throw err
		else
			console.log 'connected to MongoDB'
		return null

	return null


get_files = (path, ext=null) ->
	if !fs.existsSync(path)
		return []  

	if ext == null
		files = (f for f in fs.readdirSync(path))
	else
		pattern = new RegExp(ext + "$")
		files = (f for f in fs.readdirSync(path) when pattern.test(f))

	return files



exports.register_models = ->

	path = "./models"

	files = get_files(path, ".coffee")

	for fn in files

		path_fn = path + "/" + fn
		console.log(path_fn)

		model = require(path_fn)
		model.register_model(mongoose)

	return null


exports.save_the_cats = ->

	cat_names = "fluffy,morris,felix,sylvester,puss_n_boots,sabu".split(",")

	Kitten = mongoose.model('Kitten')

	for cat_name in cat_names

		cat = new Kitten {
			name: cat_name
		}

		# note that since this has a callback, the
		# save happens asychronously. So, the find
		# that follows may not (probably will not)
		# retrieve the cat you're trying to save.

		cat.save (err, cat) ->
			if err 
				console.log("could not save #{cat.name}")
			else
				console.log "saved #{cat.name}"
			return null

	return null

exports.find_the_cats = ->
	
	Kitten = mongoose.model('Kitten')


	Kitten.find (err, kittens) ->
		if err
			console.error "could not find any kittens"
		else if kittens.length <= 0
			console.log "I have no kittens"
		else
			for k in kittens
				cat = new Kitten(k)
				cat.speak()

		return null


	return null
