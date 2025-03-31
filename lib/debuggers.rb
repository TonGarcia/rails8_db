class Debuggers
  class << self
    def print(msg)
      silent = false
      puts msg unless silent
    end
  end
end
