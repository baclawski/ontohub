# 
# Lists axioms of a ontology
# 
class AxiomsController < InheritedResources::Base
  
  belongs_to :ontology
  actions :index
  has_pagination
  
end
