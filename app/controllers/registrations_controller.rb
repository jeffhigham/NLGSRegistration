class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :edit, :update, :destroy]

  # GET /registrations
  # GET /registrations.json
  def index
    @registrations = Registration.all
  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
  end

  # GET /registrations/new
  def new
    @registration = Registration.new
    @registration.companies.build
    # @registration.pop_spaces.build
    # @registration.prototype_spaces.build
    @primary_contact = @registration.company.primary_contacts.build
    @secondary_contacts = 2.times { @registration.company.secondary_contacts.build }
    @industries = Industry.all
  end

  # GET /registrations/1/edit
  def edit
    @industries = Industry.all
  end

  # POST /registrations
  # POST /registrations.json
  def create
    @registration = Registration.new(registration_params)
    
    respond_to do |format|
      if @registration.save
        @registration.company.update_industries(params[:company_industries])
        format.html { redirect_to @registration, notice: 'Registration was successfully created.' }
        format.json { render action: 'show', status: :created, location: @registration }
      else
        format.html { render action: 'new' }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registrations/1
  # PATCH/PUT /registrations/1.json
  def update
    # company_industries"=>["1", "2"]
    respond_to do |format|
      if @registration.update(registration_params)
        
        @registration.company.update_industries(params[:company_industries])

        format.html { redirect_to @registration, notice: 'Registration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    @registration.destroy
    respond_to do |format|
      format.html { redirect_to registrations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(
        :registration_id, :payment_status, :payment_type, :pop_spaces, :primary_pop_display_type,
        :pop_display_type,:proto_spaces, :proto_display_type, :via_sponsor, :lg_priorities, :pet_priorities,
        :acknowledgement, :vendor_loyalty_discount, :pay_in_full, :payment_method, :cc_number,
        :cc_exp_month, :cc_exp_year, :cc_code, :cc_name, :primary_pop_display_type, :buyer_num_stores,
        :buyer_areas_served, :buyer_avg_sqft, :buyer_annual_lg_volume, :lg_categories, :pet_categories,

        companies_attributes: [ :id, :type, :company_type, :name, :division, :address,
        :city, :state, :zip,:country, :phone, :fax, :email, :website, :description,
        primary_contacts_attributes: [:id, :type, :first_name, :last_name, :title, :email, :phone, :primary_contact, :_destroy],
        secondary_contacts_attributes: [:id, :type, :first_name, :last_name, :title, :email, :phone, :primary_contact, :_destroy],
        company_industries: []
        # pop_spaces_attributes: [:id, :display_type, :size, :_destroy],
        # prototype_spaces_attributes: [:id, :display_type, :size, :_destroy]
        ]
      )
    end
end




