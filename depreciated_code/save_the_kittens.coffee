# save_the_kittens.coffee

lib = require("./lib")

main =  ->
	lib.start_the_server()
	lib.register_models()
	lib.save_the_cats()


main()
