class AgenciesController < ApplicationController
	def show
		@user = current_user
		@agency = @user.agency
	    @companies = @agency.companies.all
	    @agencyleads = @agency.actions.actual_leads.all
	    @agencyleadsy = @agency.actions.actual_leads.where(created_at: Time.now.beginning_of_year..Time.now.beginning_of_day).all
	    @agencyleadsm = @agency.actions.actual_leads.where(created_at: Time.now.beginning_of_month..Time.now.beginning_of_day).all

	    @leadvalues = @agencyleads.map { |l| Category.find(l.category_id) }
		@leadvalueat = @leadvalues.map { |l| l.value }
		#market value of leads year
		@leadvaluesy = @agencyleadsy.map { |l| Leadaction.find(l.leadaction_id) }
		@leadvaluey = @leadvaluesy.map { |l| l.value }
		#market value of leads month
		@leadvaluesm = @agencyleadsm.map { |l| Leadaction.find(l.leadaction_id) }
		@leadvaluem = @leadvaluesm.map { |l| l.value }
		@bymonthactionscount = @agency.actions.where(reviewed: true).group('date(actions.created_at)').count(:id).values
		@bymonthleadscount = @agency.actions.actual_leads.group('date(actions.created_at)').count(:id).values
		@bydayleadscount = @agency.actions.actual_leads.group('date(actions.created_at)').count(:id).values
		@leadsmonths = @agency.actions.actual_leads.group('date(actions.created_at)').count(:id).map {|k, v| k.to_date.strftime("%B %Y")}
		@leadsdays = @agency.actions.actual_leads.group('date(actions.created_at)').count(:id).map {|k, v| k.to_date.strftime("%m/%d/%Y")}
		@filterrific = Filterrific.new(Agency, params[:filterrific] || session[:filterrific_companies])
		@companies_select = @companies.to_a.map { |e| [e.company_name, e.id] }
		@filterrific.select_options = { with_companies: @companies_select }
		#@companies_actions_show = @agency.actions.where(reviewed: true).filterrific_find(@filterrific).page(params[:page])
		session[:filterrific_companies] = @filterrific.to_hash


		@agency_action_leads_chart = LazyHighCharts::HighChart.new('graph') do |f|
	        f.title({ :text => "LEADS & ACTIONS OVER TIME FOR YOUR CUSTOMERS" })
	        f.xAxis(:categories => @leadsmonths)
	        f.plot_options(:pointStart => 6.months.ago)
	        f.series(:name => "Actions", :yAxis => 0, :data => @bymonthactionscount)
	        f.series(:name => "Leads", :yAxis => 0, :data => @bymonthleadscount )
	        f.dimensions = '600x190'
	        f.yAxis [
	          {:title => {:text => "Leads & Actions"} },
	        ]

	        f.legend(:enabled => false)
	        f.chart({:defaultSeriesType => "area", :zoomType => 'x'})
	    end

	    @agency_leads_time_chart = LazyHighCharts::HighChart.new('graph') do |f|
	        f.title({ :text => "LEADS OVER TIME FOR YOUR CUSTOMERS" })
	        f.subtitle({ :text => "Click and drag in the plot area to zoom in"})
	        f.xAxis(:categories => @leadsdays)
	        f.plot_options(:pointStart => 6.months.ago)
	        f.series(:name => "Leads", :yAxis => 0, :data => @bydayleadscount )
	        f.dimensions = '1200x190'
	        f.yAxis [
	          {:title => {:text => "Leads"} },
	        ]

	        f.legend(:enabled => false)
	        f.chart({:defaultSeriesType => "area", :zoomType => 'x'})
	    end
	end	

	def index
		@user = current_user
		@agency = @user.agency
		@companies = @agency.companies.all



		@actions = Action.order(:id).page(params[:page])
		@filterrific = Filterrific.new(Action, params[:filterrific] || session[:filterrific_actions])
		@filterrific.select_options = { with_leadaction_id: Leadaction.options_for_select, with_nonleadaction_id: Nonleadaction.options_for_select }
		@agency_actions = @agency.actions.where(reviewed: true).filterrific_find(@filterrific).page(params[:page])
		session[:filterrific_actions] = @filterrific.to_hash
		@actiontypes = Actiontype.all
		@nonleadactions = Nonleadaction.all
		@leadactions = Leadaction.all
		@actions_all_time = @agency.actions.where(reviewed: true)
		@actual_leads = @agency.actions.actual_leads
	    @actual_leads_year = @actual_leads.where(created_at: Time.now.beginning_of_year..Time.now.beginning_of_day)
	    @actual_leads_sixty = @actual_leads.where(created_at: 60.days.ago..Time.now.beginning_of_day)
	    @actual_leads_thirty = @actual_leads.where(created_at: 30.days.ago..Time.now.beginning_of_day)
	end

	def users
	    @agency = Agency.find(params[:id])
	    @users = @agency.users
	    @user = User.new
 	end


	def reset_filterrific
	    session[:filterrific_actions] = nil
	    redirect_to :action => :index
  	end
end
