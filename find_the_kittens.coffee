# find_the_kittens.coffee

lib = require("./lib")

main =  ->
	lib.start_the_server()
	lib.register_models()
	lib.find_the_cats()


main()
