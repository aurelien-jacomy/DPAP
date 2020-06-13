class LabelsController < ApplicationController
	def index
		@labels = policy_scope(Label).joins(:label_impact).joins(:label_category)
		@categories = LabelCategory.all
		@impacts = LabelImpact.all
	end
end
