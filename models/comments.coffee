#comments.coffee

exports.register_model = (mongoose) ->

	Comments = new mongoose.Schema {
			title: String
			body: String
			date: Date			
	}

	mongoose.model "Comments", Comments
	
	return null


