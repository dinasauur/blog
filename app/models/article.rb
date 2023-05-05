class Article < ApplicationRecord
  # handle invalid user input (part of creating a resource's multi-step process) using Rails feature, validations
  # Validations are rules that are checked before a model object is saved. If any of the checks fail, the save will be aborted, 
  # and appropriate error messages will be added to the errors attribute of the model object
  # Because title is a string, this means that the title value must contain at least one non-whitespace character.
  
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
