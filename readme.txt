Readme Notes:

You need to have node.js, mongoDB, coffee-script, and npm installed.

You should have npm, coffee-script installed globally.

To install mongoose locally, you need to run:

> npm install

in the directory where save_the_kittens.coffee,
find_the_kittens.coffee, and the package.json files live.

After running npm install, you should 
have a node_modules subdirectory

Now run:

> coffee save_the_kittens.coffee

Even if all goes well, mongoose will hang. To escape,
hit ctrl-C.

To see the kittens you've saved, run:

> coffee find_the_kittens.coffee

If all goes well, you'll see the cats you
saved the last time around in the listing of all cats saved.

