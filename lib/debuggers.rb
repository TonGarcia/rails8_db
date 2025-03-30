class Debuggers
  class << self
    def print(msg)
      silent = true
      puts msg unless silent
    end
  end
end
