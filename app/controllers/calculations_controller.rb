class CalculationsController < ApplicationController
  def home
    render({ :template => "calc_templates/home" })
  end

  def new_square
    render({ :template => "calc_templates/new_square" })
  end

  def new_square_root
    render({ :template => "calc_templates/new_square_root" })
  end

  def new_random
    render({ :template => "calc_templates/new_random" })
  end

  def new_payment
    render({ :template => "calc_templates/new_payment" })
  end

  def square
    @number = params.fetch("number").to_f
    @square = @number ** 2
    
    render({ :template => "calc_templates/square" })
  end

  def square_root
    @number = params.fetch("number").to_f
    @square_root = Math.sqrt(@number)
    
    render({ :template => "calc_templates/square_root" })
  end

  def random
    @min = params.fetch("min").to_i
    @max = params.fetch("max").to_i
    @random = rand(@min..@max)
    
    render({ :template => "calc_templates/random" })
  end

  def payment
    @apr = params.fetch("apr").to_f
    @years = params.fetch("years").to_i
    @principal = params.fetch("principal").to_f
    
    monthly_rate = @apr / 100 / 12
    months = @years * 12
    
    @monthly_payment = (@principal * monthly_rate * (1 + monthly_rate)**months) / 
                      ((1 + monthly_rate)**months - 1)
    
    @formatted_payment = "$#{'%.2f' % @monthly_payment}".gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1,")
    @formatted_principal = "$#{'%.2f' % @principal}".gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1,")
    @formatted_apr = "#{@apr.round(4)}%"
    
    render({ :template => "calc_templates/payment" })
  end
  
  private
  
  def number_with_commas(number)
    whole, decimal = number.to_s.split('.')
    whole_with_commas = whole.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
    decimal ? "#{whole_with_commas}.#{decimal}" : whole_with_commas
  end
end
