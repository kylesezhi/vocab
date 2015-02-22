class EntriesController < ApplicationController

  def new
  end

	def create
		@list = List.find(params[:list_id])
    @entry = @list.entries.create(entry_params)

    @list.save
    redirect_to list_path(@list)
	end

end

private
  def entry_params
    params.require(:entry).permit(:english, :japanese)
  end
