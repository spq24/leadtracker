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
      redirect_to edit_user_path
    else
      flash[:danger] = "Something Went Wrong! Your account wasn't edited properly"
      render :edit
    end 
  end

  def show
      @user = current_user
      @company = @user.company
      @opportunities_all_time = @company.opportunities.where(reviewed: true)
      @opportunities_this_year = @company.opportunities.where("created_at >= ?", Time.zone.now.beginning_of_year)
      @opportunities_this_month = @company.opportunities.where("created_at >= ?", Time.zone.now.beginning_of_month)
      @opportunities_this_week = @company.opportunities.where("created_at >= ?", Time.zone.now.beginning_of_week)
      #@leads_breakdown = @company.opportunities.group(:leadaction_id).distinct.count.to_a.drop(1)
      #@opportunities_breakdown = @company.opportunities.group(:nonleadaction_id).distinct.count.to_a.drop(1)
      @bymonthopportunitiescount = @company.opportunities.where(reviewed: true).group('date(created_at)').count(:id).values
      @bymonthleadscount = @company.opportunities.where(reviewed: true).actual_leads.group('date(created_at)').count(:id).values
      @leadsmonths = @company.opportunities.where(reviewed: true).actual_leads.group('date(created_at)').count(:id).map {|k, v| k.to_date.strftime("%B %Y")}
      @actual_leads = @company.opportunities.actual_leads
      @actual_leads_year = @actual_leads.where(created_at: Time.now.beginning_of_year..Time.now.beginning_of_day)
      @actual_leads_sixty = @actual_leads.where(created_at: 60.days.ago..Time.now.beginning_of_day)
      @actual_leads_thirty = @actual_leads.where(created_at: 30.days.ago..Time.now.beginning_of_day)
      @lead_source_types = @company.opportunities.actual_leads.group('source').count(:id)

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


      @leads_source_chart  = LazyHighCharts::HighChart.new('graph') do |f|
        f.title({ :text => "LEADS BY SOURCE" })
        f.xAxis(:categories => @lead_source_types.to_a.index)
        @lead_source_types.each do |type, count|
          f.series(:name => type, :data => count)
        end
        f.dimensions = '600x190'
        f.yAxis [
          {:title => {:text => "Leads"} },
        ]

        f.legend(:align => 'center', :verticalAlign => 'bottom', :x => -20, :layout => 'horizontal')
        f.chart({:defaultSeriesType => "bar"})
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

      @leads_breakdown_pie = LazyHighCharts::HighChart.new('pie') do |f|
            f.chart({:defaultSeriesType=>"pie"})
            series = {
                     :type=> 'pie',
                     :name=> 'Opportunity',
                     :innerSize=> '70%',
                     :data=> [['New System Quote',    8.41],['Non HVAC Service',    0],['Service', 33.62], ['Scheduling Question', 4.64], ['Other', 53.04]]
            }
            f.series(series)
            f.options[:title][:text] = "Opportunities<br/>Breakdown"
            f.options[:title][:align] = "center"
            f.options[:title][:verticalAlign] = "middle"
            f.options[:tooltip][:pointFormat] = "<b>{point.percentage:.1f}%</b>"
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
                     :data=> [
                        ['Google Organic',    53.04],
                        ['Facebook',    0],
                        ['Radio',             33.62],
                        ['Pens', 4.64],
                        ['Other',               8.41]
                     ]
            }
            f.series(series)
            f.options[:title][:text] = "Source<br/>Breakdown"
            f.options[:title][:align] = "center"
            f.options[:title][:verticalAlign] = "middle"
            f.options[:tooltip][:pointFormat] = "<b>{point.percentage:.1f}%</b>"
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
    params.require(:user).permit(:email, :password, :password_confirmation, :full_name, :admin, :main_contact_first_name, :main_contact_last_name, :company_name, :phonenumber, :password, :address_one, :address_two, :city, :state, :postcode)
  end
end
