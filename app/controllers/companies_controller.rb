class CompaniesController < ApplicationController


  def billing
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)

    if @company
      flash[:success] = "Thank you for signing up!"
      session[:user_id] = @company.id
      redirect_to home_path
    else
      flash[:danger] = @result.error_message
      render :new
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(company_params)
      flash[:success] = "You have successfully edited Your Account"
      redirect_to edit_company_path
    else
      flash[:danger] = "Something Went Wrong! Your account wasn't edited properly"
      render :edit
    end 

    respond_to do |format|
      if @company.update_attributes(company_params)
        format.html { redirect_to(@company, :notice => 'Company was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@company) }
      end
    end

  end

  def show
      @user = current_user
      @company = @user.company
      @opportunities_all_time = @company.opportunities.where(reviewed: true)
      @bymonthopportunitiescount = @company.opportunities.where(reviewed: true).group('date(opportunities.created_at)').count(:id).values
      @bymonthleadscount = @company.opportunities.actual_leads.group('date(opportunities.created_at)').count(:id).values
      @leadsmonths = @company.opportunities.where(reviewed: true).actual_leads.group('date(opportunities.created_at)').count(:id).map {|k, v| k.to_date.strftime("%B %Y")}
      @actual_leads = @company.opportunities.actual_leads
      @actual_leads_year = @actual_leads.where(created_at: Time.now.beginning_of_year..Time.now.beginning_of_day)
      @actual_leads_sixty = @actual_leads.where(created_at: 60.days.ago..Time.now.beginning_of_day)
      @actual_leads_thirty = @actual_leads.where(created_at: 30.days.ago..Time.now.beginning_of_day)
      

      bymonthleads = @company.opportunities.group_by { |o| o.created_at.to_date}

      

      @opportunity_leads_chart = LazyHighCharts::HighChart.new('graph') do |f|
        f.title({ :text => "LEADS & OPPORTUNITIES OVER TIME" })
        f.xAxis(:categories => @leadsmonths)
        f.plot_options(:pointStart => 6.months.ago)
        f.series(:name => "Opportunities", :yAxis => 0, :data => @bymonthopportunitiescount)
        f.series(:name => "Leads", :yAxis => 0, :data => @bymonthleadscount )
        f.dimensions = '600x190'
        f.yAxis [
          {:title => {:text => "Leads & Opportunities"} },
        ]

        f.legend(:enabled => false)
        f.chart({:defaultSeriesType => "line"})
      end

      @leads_breakdown_chart = LazyHighCharts::HighChart.new('graph') do |f|
        f.title({ :text => "LEADS BREAKDOWN CHART" })
        f.xAxis(:categories => @leadsmonths)
        f.plot_options(:pointStart => 6.months.ago)
        f.series(:name => "Service", :yAxis => 0, :data => [20,30,100,50])
        f.series(:name => "New System Quote", :yAxis => 0, :data => [10,20,30,40])
        f.series(:name => "Non HVAC Service", :yAxis => 0, :data => [10,20,30,40])
        f.dimensions = '600x190'
        f.yAxis [
          {:title => {:text => "Leads"} },
        ]

        f.legend(:align => 'center', :verticalAlign => 'bottom', :x => -20, :layout => 'horizontal')
        f.chart({:defaultSeriesType => "column"})
      end

      @source_chart = LazyHighCharts::HighChart.new('graph') do |f|
        f.title({ :text => "LEADS BY SOURCE" })
        f.xAxis(:categories => @leadsmonths)
        f.plot_options(:pointStart => 6.months.ago)
        @company.source_breakdown.each do |k, v|
          f.series(:name => k, :yAxis => 0, :data => v)
        end
        f.dimensions = '600x190'
        f.yAxis [
          {:title => {:text => "Number of Calls By Source"} },
        ]

        f.legend(:enabled => false)
        f.chart({:defaultSeriesType => "line"})
      end

      @leads_breakdown_pie = LazyHighCharts::HighChart.new('pie') do |f|
            f.chart({:defaultSeriesType=>"pie"})
            series = {
                     :type=> 'pie',
                     :name=> 'Opportunity',
                     :innerSize=> '70%',
                     :data=> @company.leads_breakdown
            }
            f.series(series)
            f.options[:title][:text] = "Opportunities Breakdown"
            f.options[:title][:align] = "center"
            f.options[:title][:verticalAlign] = "top"
            f.options[:tooltip][:pointFormat] = "<b>{point.percentage:.1f}%</b>  |  <b>{point.y}</b>"
            f.legend(:layout=> 'horizontal', :position=> 'bottom') 
            f.plot_options(:pie=>{
              :allowPointSelect=>true,
              :cursor=>"pointer",
              :startAngle=>-90,
              :endAngle=>90,
              :center=>['50%', '75%'],
              :dataLabels=>{
                :enabled=>false,
                }
            })
      end

      @source_breakdown_pie = LazyHighCharts::HighChart.new('pie') do |f|
            f.chart({:defaultSeriesType=>"pie"})
            series = {
                     :type=> 'pie',
                     :name=> 'Source',
                     :innerSize=> '70%',
                     :data=> @company.source_breakdown
            }
            f.series(series)
            f.options[:title][:text] = "Source Breakdown"
            f.options[:title][:align] = "center"
            f.options[:title][:verticalAlign] = "top"
            f.options[:tooltip][:pointFormat] = "<b>{point.percentage:.1f}%</b>  |  <b>{point.y}</b>"
            f.legend(:layout=> 'vertical') 
            f.plot_options(:pie=>{
              :allowPointSelect=>true, 
              :cursor=>"pointer",
              :startAngle=>-90,
              :endAngle=>90,
              :center=>['50%', '75%'],
              :dataLabels=>{
                :enabled=>false,
                }
            })
      end
  end

  def index
    @companys = Company.all
  end

  def users
    @company = Company.find(params[:id])
    @users = @company.users
    @user = User.new
  end

  def destroy
    Company.find(params[:id]).destroy
    flash[:success] = "User Deleted."
    redirect_to videos_path
  end

  private

  def company_params
    params.require(:company).permit(:company_name, :phonenumber, :address_one, :address_two, :city, :state, :postcode, :country, :admin_notes, :google_account, :google_password, :google_maps_url, :google_maps_status, :google_maps_notes, :google_verified_date, :bing_places_url, :bing_account, :bing_password, :bing_places_status, :bing_places_notes, :bing_verified_date, :yelp_url, :yelp_status, :yelp_notes, :yelp_verified_date, :yelp_account, :yelp_password, :yahoo_local_url, :yahoo_local_status, :yahoo_local_notes, :yahoo_verified_date, :yahoo_account, :yahoo_password)
  end
end
