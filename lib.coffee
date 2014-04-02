# lib.coffee

mongoose = require 'mongoose'
async = require 'async'
fs = require 'fs'


start_the_server = (callback) ->

  mongoose.connect 'mongodb://localhost/test', (err) ->
    if err
      callback(err, null)
    else
      register_models()
      callback(null, 'connected to MongoDB')
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


register_models = ->

  path = "./models"

  files = get_files(path, ".coffee")

  for fn in files

    path_fn = path + "/" + fn
    #console.log(path_fn)

    model = require(path_fn)
    model.register_model(mongoose)

  return null


save_the_cats = ->
  start_the_server (err, start_msg) ->
    throw err if err
    #console.log start_msg

    cat_names = "fluffy,morris,felix,sylvester,puss_n_boots,sabu".split(",")

    Kitten = mongoose.model('Kitten')

    save_one_cat = (cat_name, callback) ->
      cat = new Kitten {
        name: cat_name
      }
      cat.save (err, cat) ->
        if err 
          console.log("could not save #{cat.name}")
        else
          console.log "saved #{cat.name}"
        callback()
      return

    async.each cat_names, save_one_cat, (err) ->
      throw err if err
      console.log("finished saving cats") 
      mongoose.disconnect()

  return

find_the_cats =  ->
  start_the_server (err, start_msg) ->
    throw err if err
    #console.log start_msg
  
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

      mongoose.disconnect()
      return 


  return 


delete_the_cats = ->
  start_the_server (err, start_msg) ->
    throw err if err
    #console.log start_msg

    Kitten = mongoose.model('Kitten')

    Kitten.remove (err) ->
      throw err if err
      console.log "no more kittens"
      mongoose.disconnect()


module.exports = {
  save_the_cats
  find_the_cats
  delete_the_cats
}