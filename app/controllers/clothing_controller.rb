class ClothingController < ApplicationController

  def index
    @clothings = Clothing.all
  end

  def show
    @clothing = Clothing.find(params[:id])
  end

  def new
    @clothing = Clothing.new(params[:clothing])
    @types = Type.all
  end

  def create
    @clothing = Clothing.new(params[:clothing])
    @clothing.type = Type.find(params[:type_id])
    if @clothing.save
      redirect_to :action => 'index'
    else
      @types = Type.all
      render :action => 'new'
    end
  end

  def edit
    @clothing = Clothing.find(params[:id])
    @types = Type.all
  end

  def update
    @clothing = Clothing.find(params[:id])
    @clothing.update(params)
    if @clothing.save
      redirect_to :action => 'index'
    else
      @types = Type.all
      render :action => 'edit'
    end
  end

  def destroy
    @clothing = Clothing.find(params[:id])
    @clothing.destroy
    if @clothing.destroy 
      redirect_to :action => 'index'
    end
  end

  def upload
    
  end
end