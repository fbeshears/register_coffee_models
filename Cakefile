# Cakefile
# for register_coffee_models

lib = require("./lib")


task "save", "Save kitten records to MongoDB", ->
  lib.save_the_cats()


task "find", "Find kittens in MongoDb", ->
  lib.find_the_cats()

task "remove", "Deletes all the kittens from MongoDB", ->
  lib.delete_the_cats()