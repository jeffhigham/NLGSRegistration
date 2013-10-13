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
    @contacts = @registration.company.contacts.build
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

        :registration_id, :payment_status, :payment_type, :pop_spaces, :pop_display_type,
        :proto_spaces, :proto_display_type, :via_sponsor, :lg_priorities, :pet_priorities,
        :acknowledgement, :vendor_loyalty_discount, :pay_in_full, :payment_method, :cc_number,
        :cc_exp_month, :cc_exp_year, :cc_code, :cc_name,
        
        companies_attributes: [ :id, :type, :company_type, :name, :division, :address,
        :city, :state, :zip,:country, :phone, :fax, :email, :website, :description,
        contacts_attributes: [:id, :first_name, :last_name, :title, :email, :phone, :primary_contact, :_destroy],
        company_industries: []
        ]
      )
    end
end
