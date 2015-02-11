class ListController < ApplicationController
	def lists
		@lists = List.all
	end

	def list
		@entries = List.find(params[:id]).entries
	end

	def search
		@entries = Entry.search(params[:term])
		render 'list'
	end
end
