class ChartTypesController < ApplicationController
  before_action :set_chart_type, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /chart_types or /chart_types.json
  def index
    @chart_types = ChartType.all
  end

  # GET /chart_types/1 or /chart_types/1.json
  def show
  end

  # GET /chart_types/new
  def new
    @chart_type = ChartType.new
  end

  # GET /chart_types/1/edit
  def edit
  end

  # POST /chart_types or /chart_types.json
  def create
    @chart_type = ChartType.new(chart_type_params)
    @chart_type.chart_format = build_chart_format_hash(chart_type_params)

    respond_to do |format|
      if @chart_type.save
        format.html { redirect_to chart_type_url(@chart_type), notice: "Chart type was successfully created." }
        format.json { render :show, status: :created, location: @chart_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chart_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chart_types/1 or /chart_types/1.json
  def update
    @chart_type.chart_format = build_chart_format_hash(chart_type_params)
    respond_to do |format|
      if @chart_type.update(chart_type_params)
        format.html { redirect_to chart_type_url(@chart_type), notice: "Chart type was successfully updated." }
        format.json { render :show, status: :ok, location: @chart_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chart_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chart_types/1 or /chart_types/1.json
  def destroy
    @chart_type.destroy!

    respond_to do |format|
      format.html { redirect_to chart_types_url, notice: "Chart type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chart_type
      @chart_type = ChartType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chart_type_params
      params.require(:chart_type).permit(:name, :chart_settings, :x_axis, :y_axis, :x_axis_format, :y_axis_format, :x_limit, :y_limit)
    end

    def build_chart_format_hash(params)
      {
        x_axis: params[:x_axis],
        y_axis: params[:y_axis],
        x_axis_format: params[:x_axis_format],
        y_axis_format: params[:y_axis_format],
        x_limit: params[:x_limit],
        y_limit: params[:y_limit]
      }
    end
end
