class Public::CustomersController < ApplicationController

def show
  @customer = Customer.find(params[:id])
end

def edit
  @customer = Customer.find(params[:id])
end

def update
  @customer = Customer.find(params[:id])
  @user.update
end


end
