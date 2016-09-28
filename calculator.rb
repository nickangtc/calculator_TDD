class Calculator

  def initialize start_result
    @result = start_result
    @op_history = [start_result]
  end

  def result
    return @result
  end

  def reset (value_to_reset_to)
    @result = value_to_reset_to
  end

  def add x
    if x.is_a? String
      raise StandardError
    elsif x.is_a? Integer
      @result += x.to_i
      return self
    end
  end

  def subtract x
    @result -= x
    return self
  end

  def multiply x
    @result *= x
  end

  def divide x
    @result /= x
  end

  def operation action, input
    if action == "add"
      @result += input
    elsif action == "subtract"
      @result -= input
    elsif action == "multiply"
      @result *= input
    elsif action == "divide"
      @result /= input
    end

    @op_history << @result
    puts "op_history is #{@op_history}"
    return self
  end

  def undo
    @result = @op_history[@op_history.length - 2]
    @op_history << @result
  end

  def redo
    @result =
  end
end
