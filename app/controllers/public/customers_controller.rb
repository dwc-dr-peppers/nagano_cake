class Public::CustomersController < ApplicationController

def show
  @customer = current_customer
end

def edit
  @customer = current_customer
end

def update
  @customer = current_customer
  @customer.update(customer_params)
  redirect_to customers_my_page_path(@customer)
end

def unsubscribe
end

private
def customer_params
  params.require(:customer).permit(:family_name, :first_name_kana, :family_name_kana, :first_name_kana, :postcode, :address, :telephone_number, :email)
end
end
