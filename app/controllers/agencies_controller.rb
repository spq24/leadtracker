class AgenciesController < ApplicationController
	def show
		@user = current_user
		@agency = @user.agency
	    @companies = @agency.companies.all
	    @agencyleads = @agency.opportunities.actual_leads.all
	    @agencyleadsy = @agency.opportunities.actual_leads.where(created_at: Time.now.beginning_of_year..Time.now.beginning_of_day).all
	    @agencyleadsm = @agency.opportunities.actual_leads.where(created_at: Time.now.beginning_of_month..Time.now.beginning_of_day).all

	    @leadvalues = @agencyleads.map { |l| Category.find(l.category_id) }
		@leadvalueat = @leadvalues.map { |l| l.value }
		#market value of leads year
		@leadvaluesy = @agencyleadsy.map { |l| Leadaction.find(l.leadaction_id) }
		@leadvaluey = @leadvaluesy.map { |l| l.value }
		#market value of leads month
		@leadvaluesm = @agencyleadsm.map { |l| Leadaction.find(l.leadaction_id) }
		@leadvaluem = @leadvaluesm.map { |l| l.value }
		@bymonthopportunitiescount = @agency.opportunities.where(reviewed: true).group('date(opportunities.created_at)').count(:id).values
		@bymonthleadscount = @agency.opportunities.actual_leads.group('date(opportunities.created_at)').count(:id).values
		@bydayleadscount = @agency.opportunities.actual_leads.group('date(opportunities.created_at)').count(:id).values
		@leadsmonths = @agency.opportunities.actual_leads.group('date(opportunities.created_at)').count(:id).map {|k, v| k.to_date.strftime("%B %Y")}
		@leadsdays = @agency.opportunities.actual_leads.group('date(opportunities.created_at)').count(:id).map {|k, v| k.to_date.strftime("%m/%d/%Y")}
		@filterrific = Filterrific.new(Agency, params[:filterrific] || session[:filterrific_companies])
		@companies_select = @companies.to_a.map { |e| [e.company_name, e.id] }
		@filterrific.select_options = { with_companies: @companies_select }
		#@companies_actions_show = @agency.opportunities.where(reviewed: true).filterrific_find(@filterrific).page(params[:page])
		session[:filterrific_companies] = @filterrific.to_hash


		@agency_opportunity_leads_chart = LazyHighCharts::HighChart.new('graph') do |f|
	        f.title({ :text => "LEADS & OPPORTUNITIES OVER TIME FOR YOUR CUSTOMERS" })
	        f.xAxis(:categories => @leadsmonths)
	        f.plot_options(:pointStart => 6.months.ago)
	        f.series(:name => "Opportunities", :yAxis => 0, :data => @bymonthopportunitiescount)
	        f.series(:name => "Leads", :yAxis => 0, :data => @bymonthleadscount )
	        f.dimensions = '600x190'
	        f.yAxis [
	          {:title => {:text => "Leads & Opportunities"} },
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



		@opportunities = Opportunity.order(:id).page(params[:page])
		@filterrific = Filterrific.new(Opportunity, params[:filterrific] || session[:filterrific_opportunities])
		#@filterrific.select_options = { with_leadaction_id: Leadaction.options_for_select, with_nonleadaction_id: Nonleadaction.options_for_select }
		@agency_opportunities = @agency.opportunities.where(reviewed: true).filterrific_find(@filterrific).page(params[:page])
		session[:filterrific_opportunities] = @filterrific.to_hash
		@actiontypes = Actiontype.all
		@categories = Category.all
		@opportunities_all_time = @agency.opportunities.where(reviewed: true)
		@actual_leads = @agency.opportunities.actual_leads
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
	    session[:filterrific_opportunities] = nil
	    redirect_to :opportunity => :index
  	end
end
