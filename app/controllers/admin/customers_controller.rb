class Admin::CustomersController < ApplicationController
  def index
    @customer = Customer.all
    
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
  end
  
end
