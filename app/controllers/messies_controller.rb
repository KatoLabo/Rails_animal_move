require 'net/http'
require 'openssl'

class MessiesController < ApiController
  before_action :set_messy, only: [:show, :update, :destroy]

  def post_to_ras

      uri = URI.parse("http://382f1e6f.ngrok.io/")
      http = Net::HTTP.new(uri.host, uri.port)
      http.ssl_version = :SSLv3

      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      req = Net::HTTP::Post.new(uri.path)
      req.set_form_data({ "hoge" : 1, "bar" : "bar" })

      @res = http.request(req)
  end


  # GET /messies
  # GET /messies.json
  def index
    @messies = Messy.all

    render json: @messies
  end

  # GET /messies/1
  # GET /messies/1.json
  def show
    render json: @messy
  end

  # POST /messies
  # POST /messies.json
  def create
    logger.debug("Hello, world!")
    logger.debug(messy_params)
    logger.debug(params)

    # @messy = Messy.new(params)
    @messy = Messy.new(messy_params)

    if @messy.save
      render :show, status: :created, location: @messy
    else
      render json: @messy.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messies/1
  # PATCH/PUT /messies/1.json
  def update
    if @messy.update(messy_params)
      render :show, status: :ok, location: @messy
    else
      render json: @messy.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messies/1
  # DELETE /messies/1.json
  def destroy
    @messy.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_messy
      @messy = Messy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def messy_params
      params.permit(:total_score, :mess, :smell, :user_id)
      # params.fetch(:messy, {}).permit(:total_score, :mess, :smell, :user_id)
    end
end
