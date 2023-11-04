class PagesController < ApplicationController
  def home
  end

  def admin
    @agrovet = Agrovet.find(params[:agrovet_id]) if params[:agrovet_id].present?
    @agrovets = Agrovet.all
    @products = Product.all
    @data_entries = DataEntry.all
    @orders = Order.all
    @users = User.all
    # def all_latest_data_entry
    #   @data_entries.order(created_at: :desc).first
    # end
    # def all_latest_product_1_data_entry_total
    #   (@products.first&.price || 0) * (@all_latest_data_entry&.product_1_quantity || 0)
    # end
    # def all_latest_product_2_data_entry_total
    #   (@products.second&.price || 0) * (@all_latest_data_entry&.product_2_quantity || 0)
    # end
    # def all_latest_product_3_data_entry_total
    #   (@products.third&.price || 0) * (@all_latest_data_entry&.product_3_quantity || 0)
    # end
    # def all_latest_product_4_data_entry_total
    #   (@products.fourth&.price || 0) * (@all_latest_data_entry&.product_4_quantity || 0)
    # end
  
    # def all_latest_total_data_entry_amount
    #   @all_latest_product_1_data_entry_total + @all_latest_product_2_data_entry_total + @all_latest_product_3_data_entry_total + @all_latest_product_4_data_entry_total
    # end
    # @all_latest_total_data_entry_amount_sum = DataEntry.sum(:all_latest_total_data_entry_amount)
    # @latest_data_entry = @agrovet.data_entries.order(created_at: :desc).first
    # @latest_product_1_data_entry_total = (@products.first&.price || 0) * (@latest_data_entry&.product_1_quantity || 0)
    # @latest_product_2_data_entry_total = (@products.second&.price || 0) * (@latest_data_entry&.product_2_quantity || 0)
    # @latest_product_3_data_entry_total = (@products.third&.price || 0) * (@latest_data_entry&.product_3_quantity || 0)
    # @latest_product_4_data_entry_total = (@products.fourth&.price || 0) * (@latest_data_entry&.product_4_quantity || 0)
    # @latest_total_data_entry_amount = @latest_product_1_data_entry_total + @latest_product_2_data_entry_total + @latest_product_3_data_entry_total + @latest_product_4_data_entry_total
    @total_money_paid = DataEntry.sum(:money_paid)
    @total_money_owed = DataEntry.sum(:money_owed)
    # @total_data_entries_sum = @agrovet.data_entries.sum do |data_entry|
    #   # Calculate the data entry total for each product
    #   product_1_total = (data_entry.product_1_quantity || 0) * (@products.first&.price || 0)
    #   product_2_total = (data_entry.product_2_quantity || 0) * (@products.second&.price || 0)
    #   product_3_total = (data_entry.product_3_quantity || 0) * (@products.third&.price || 0)
    #   product_4_total = (data_entry.product_4_quantity || 0) * (@products.fourth&.price || 0)
    
    #   # Calculate the total for this data entry
    #   product_1_total + product_2_total + product_3_total + product_4_total
    # end
  end

  def manager
    @agrovet = Agrovet.find(params[:agrovet_id]) if params[:agrovet_id].present?
    @agrovets = Agrovet.all
    @pending_orders = Order.where(status: ['Pending', 'pending'])
  end

  def pendingorders
    @agrovet = Agrovet.find(params[:agrovet_id]) if params[:agrovet_id].present?
    @agrovets = Agrovet.all
    @pending_orders = Order.where(status: ['Pending', 'pending'])
  end

  def dispatchedorders
    @agrovet = Agrovet.find(params[:agrovet_id]) if params[:agrovet_id].present?
    @agrovets = Agrovet.all
    @dispatched_orders = Order.where(status: ['Dispatched', 'dispatched'])
    @pending_orders = Order.where(status: ['Pending', 'pending'])
  end

  def receivedorders
    @agrovet = Agrovet.find(params[:agrovet_id]) if params[:agrovet_id].present?
    @agrovets = Agrovet.all
    @dispatched_orders = Order.where(status: ['Dispatched', 'dispatched'])
    @pending_orders = Order.where(status: ['Pending', 'pending'])
    @received_orders = Order.where(status: ['Received', 'received'])
  end

  def allagrovets
    @agrovet = Agrovet.find(params[:agrovet_id]) if params[:agrovet_id].present?
    @agrovets = Agrovet.all
    @dispatched_orders = Order.where(status: ['Dispatched', 'dispatched'])
    @pending_orders = Order.where(status: ['Pending', 'pending'])
    @received_orders = Order.where(status: ['Received', 'received'])
  end

  def allsalesreps
    @agrovet = Agrovet.find(params[:agrovet_id]) if params[:agrovet_id].present?
    @agrovets = Agrovet.all
    @dispatched_orders = Order.where(status: ['Dispatched', 'dispatched'])
    @pending_orders = Order.where(status: ['Pending', 'pending'])
    @received_orders = Order.where(status: ['Received', 'received'])
    @salesreps = User.where(role: [0])
  end
  
  def salesrep
    # Find the current user's agrovets
    @agrovets = Agrovet.where(user_id: current_user.id)
  
    # Optionally, you can find a specific agrovet if an agrovet_id parameter is provided
    @agrovet = Agrovet.find_by(id: params[:agrovet_id]) if params[:agrovet_id]
  end
  

  def agrovetinfo
    @agrovet = Agrovet.find(params[:id])
  end

  def placeorder
    @agrovet = Agrovet.find(params[:id])
  end

  def allorders
    @agrovet = Agrovet.find(params[:id])
  end
  
end
