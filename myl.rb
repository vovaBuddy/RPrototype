p 'myl.rb included'

class Sym
  attr_accessor :name, :type, :fnc, :translate_to, :var
  def initialize(name, type, fnc, translate_to, var)
    @name = name
    @type = type
    @fnc = lambda { fnc }
    @translate_to = translate_to
    @var = var
  end
end

class SignalInfo
  attr_accessor :name, :number
  def initialize(name, number)
    @name = name
    @number = number
  end
end




class SymContainer

    attr_accessor :array

    def push(name, type, fnc, translate_to, var)
      @array = Array.new if @array.nil?
      sym = Sym.new(name, type, fnc, translate_to, var)
      @array.push(sym)
    end

    def get_by_name(name)
      return nil if @array.nil?
      @array.each do |s|
        return s if s.name == name
      end
      nil
    end

    def remove_by_name(name)
      @array.delete_if {|s| s.name == name}
    end
  
end

$SymTable = SymContainer.new

def signals_number(name)
  string = File.open('./signalTable.myl'){ |file| file.read }
  array = string.split(/\n| /)
  index = array.index(name)
  return array[index + 1] unless index.nil?
  nil
end


def some_function
  p 'test f'
end
