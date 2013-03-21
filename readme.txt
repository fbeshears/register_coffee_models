Readme Notes:

You need to have node.js, mongoDB, coffee-script, and npm installed.

You should have npm, coffee-script installed globally.

To install mongoose locally, you need to run:

> npm install

in the directory where Cakefile and the package.json files live.

After running npm install, you should 
have a node_modules subdirectory

To save some kittens in MongoDB, run:

> cake save


Even if all goes well, mongoose will hang. 
This is true for the commands discussed below.
In all cases, hit ctrl-C to escape.

To see the kittens you've saved, run:

> cake find

If all goes well, you'll see the cats you
saved the last time around in the listing of all cats saved.

To delete the kittens you've saved, run:

> cake remove


