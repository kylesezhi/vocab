class ListController < ApplicationController
	def lists
		@lists = List.all
	end

	def list
		@entries = List.find(params[:id]).entries
	end

	def search
		@entries = Entry.search(params[:term])
		@highlight_term = params[:term]

		render 'list'
	end

	def export
		list = List.find(params[:id])
		entries = list.entries
		headers = ["front", "back"]
		cards = entries.map { |entry| { "front" => entry.japanese, "back" => entry.english} }
		deck = Anki::Deck.new(card_headers: headers, card_data: cards)

		send_data deck.generate_deck, :filename => "#{list.name}_deck.txt"
	end
end
