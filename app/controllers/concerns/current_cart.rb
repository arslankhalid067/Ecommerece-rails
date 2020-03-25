# frozen_string_literal: true

module CurrentCart
  private

  def set_cart
    # @cart = Cart.find(session[:cart_id])
    # rescue ActiveRecord::RecordNotFound
    # if @cart
    #   echo 'We Have Found the Cart'
    # else
    #   echo 'nil'
    # end
    if current_user
      @cart = Cart.find_by(user_id: current_user.id, checkout: false)
      if @cart.nil?
        find_cart
        @cart.user_id = current_user.id
        @cart.save
      end
      session[:cart_id] = @cart.id
    else
      set_guest_cart
    end
    # if current_user
    #   @cart = Cart.find_by_id(user_id: current_user.id)
    #   @cart = Cart.find(session[:cart_id])
    #   @cart ||= Cart.create(user_id: current_user.id)
    # else
    #   @cart = Cart.find(session[:cart_id])
    # rescue ActiveRecord::RecordNotFound
    #   @cart.create
    # end
    # session[:cart_id] = @cart.id
  end

  def find_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.new
  end

  def set_guest_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
