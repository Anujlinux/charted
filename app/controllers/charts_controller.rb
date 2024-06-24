class ChartsController < ApplicationController
  before_action :set_chart, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ edit new create destroy ]

  # GET /charts or /charts.json
  def index
    @charts = Chart.all
  end
00
  # GET /charts/1 or /charts/1.json
  def show
    p @chart
    @chart_data = ChartDataGenerator.chart_data(@chart).to_json
    p @chart_data
  end

  def embed
    @chart = Chart.find(params[:id])
    response.headers.delete('X-Frame-Options')
    @chart_data = ChartDataGenerator.chart_data(@chart).to_json
    render layout: 'embed'
  end

  # GET /charts/new
  def new
    @chart = Chart.new
  end

  # GET /charts/1/edit
  def edit
    redirect_to chart_url(@chart), notice: "You are not authorized to Edit this chart" unless @chart.user_id == current_user.id
  end

  # POST /charts or /charts.json
  def create
    # @chart = Chart.new(chart_params)
    @chart = current_user.charts.build(chart_params)
    @chart.chart_data = JSON.parse(chart_params[:chart_data])
    @chart.chart_settings = JSON.parse(chart_params[:chart_settings])

    respond_to do |format|
      if @chart.save
        format.html { redirect_to chart_url(@chart), notice: "Chart was successfully created." }
        format.json { render :show, status: :created, location: @chart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /charts/1 or /charts/1.json
  def update
    @chart.chart_data = JSON.parse(chart_params[:chart_data])
    @chart.chart_settings = JSON.parse(chart_params[:chart_settings])
    respond_to do |format|
      if @chart.update(chart_params)
        format.html { redirect_to chart_url(@chart), notice: "Chart was successfully updated." }
        format.json { render :show, status: :ok, location: @chart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charts/1 or /charts/1.json
  def destroy
    @chart.destroy! if current_user.id == @chart.user_id

    respond_to do |format|
      format.html { redirect_to charts_url, notice: "Chart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chart
      @chart = Chart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chart_params
      params.require(:chart).permit(:title, :subtitle, :description, :chart_type_id, :chart_data, :chart_settings, :user_id, :data_source_type)
    end
end
