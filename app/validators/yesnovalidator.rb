class Yesnovalidator < ActiveModel::Validator
	def validate(record)
		if record.title.include?("yes") && record.description.include?("no")
			record.errors[:title] << "Title has the word \"yes\" and description has the word \"no\""
		end	
	end
end