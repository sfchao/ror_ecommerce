class Admin::Merchandise::BrandsController < Admin::BaseController
  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find(params[:id])
  end

  def new
    form_info
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(params[:brand])
    if @brand.save
      flash[:notice] = "Successfully created brand."
      redirect_to admin_merchandise_brand_url(@brand)
    else
      form_info
      render :action => 'new'
    end
  end

  def edit
    form_info
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])
    if @brand.update_attributes(params[:brand])
      flash[:notice] = "Successfully updated brand."
      redirect_to admin_merchandise_brand_url(@brand)
    else
      form_info
      render :action => 'edit'
    end
  end

  def destroy
    @brand = Brand.find(params[:id])

    if @brand.products.empty?
      @brand.destroy
    else
      flash[:alert] = "Sorry this brand is already associated with a product.  You can not delete this brand."
    end

    redirect_to admin_merchandise_brands_url
  end

  private

  def form_info

  end
end
