class AddressesController < ApplicationController
	def new 
		@address = Address.new
	end

	def create 
		@address = Address.new(address_params)

		if @address.save
			redirect_to [current_user, @address], notice: 'Address Created'
		else
			redirect_to new_address_path, notice: 'Address Not Saved'
		end
	end

	def show 
		@address = Address.find(params[:id])
	end

	private

		def address_params
			params.require(:address).permit(:address_1, :address_2, :city, :state, :zip)
		end
end
