class ApplicationController < ActionController::Base
  def blank_square_form
	  render({ :template => "calculation_templates/square_form.html.erb" })
  end

  def blank_squareroot_form
	  render({ :template => "calculation_templates/squareroot_form.html.erb" })
  end

  def blank_payment_form
    render({ :template => "calculation_templates/payment_form.html.erb" })
  end

  def blank_random_form
    render({ :template => "calculation_templates/rand_form.html.erb" })
  end

  def calculate_square
	  @num = params.fetch("elephant").to_f
	  @square_of_num = @num ** 2
	  render({ :template => "calculation_templates/square_results.html.erb" })
  end

  def calculate_payment
    @apr = params.fetch("apr_input").to_f
    @years = params.fetch("years_input").to_i
    @prin = params.fetch("principal_input").to_f
    
    monthlyrate = @apr/(12.0 * 100)
    num_months = @years * 12

    numer = @prin*monthlyrate*(1+monthlyrate)**num_months
    denom = (1+monthlyrate)**num_months-1
    @result = (numer*1.0/denom).round(2)
    @round_apr = "#{@apr.round(4)}%"

    
	  render({ :template => "calculation_templates/payment_results.html.erb" })
  end

  def calculate_squareroot
	  @num = params.fetch("elephant").to_f
	  @squareroot_of_num = @num ** 0.5
	  render({ :template => "calculation_templates/squareroot_results.html.erb" })
  end

  def calculate_random
	  @lower = params.fetch("user_min").to_f
	  @upper = params.fetch("user_max").to_f
	  @result = rand(@lower..@upper)
	  render({ :template => "calculation_templates/rand_results.html.erb" })
  end
end
