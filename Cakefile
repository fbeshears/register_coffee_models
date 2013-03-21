# Cakefile
# for register_coffee_models

lib = require("./lib")

task "start", "Don't need to call me", ->
	console.log("Remember to hit Ctrl-C to quit")
	lib.start_the_server()
	lib.register_models()

task "save", "Save kitten records to MongoDB", ->
	invoke "start"
	lib.save_the_cats()


task "find", "Find kittens in MongoDb", ->
	invoke "start"
	lib.find_the_cats()

task "remove", "Deletes all the kittens from MongoDB", ->
	invoke "start"
	lib.delete_the_cats()