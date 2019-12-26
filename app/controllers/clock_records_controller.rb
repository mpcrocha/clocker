class ClockRecordsController < ApplicationController
  before_action :set_clock_record, only: [:show, :edit, :update, :destroy]

  def index
    @clock_records = ClockRecord.paginate(page: params[:page], per_page: 1).order('time DESC')
  end

  def show
  end

  def new
    @clock_record = ClockRecord.new
  end

  def edit
  end

  def create
    @clock_record = ClockRecord.new(clock_record_params)
    @clock_record.user = current_user
    respond_to do |format|
      if @clock_record.save
        format.html { redirect_to user_clock_records_path(@clock_record), notice: 'Clock record was successfully created.' }
        format.json { render :show, status: :created, location: @clock_record }
      else
        format.html { render :new }
        format.json { render json: @clock_record.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @clock_record.update(clock_record_params)
        format.html { redirect_to user_clock_records_path(@clock_record), notice: 'Clock record was successfully updated.' }
        format.json { render :show, status: :ok, location: @clock_record }
      else
        format.html { render :edit }
        format.json { render json: @clock_record.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @clock_record.destroy
    respond_to do |format|
      format.html { redirect_to user_clock_records_url, notice: 'Clock record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_clock_record
      @clock_record = ClockRecord.find(params[:id])
    end

    def clock_record_params
      params.require(:clock_record).permit(:clock_type, :time, :user_id)
    end
end
