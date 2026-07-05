# Compatibility shim for running the old github-pages / Jekyll 3.9 / Liquid 4.0.3
# stack on Ruby 3.2+ (where the Object#taint family was removed).
# Loaded via RUBYOPT so it applies before any gem code runs.
unless Object.new.respond_to?(:tainted?)
  class Object
    def tainted?
      false
    end

    def taint
      self
    end

    def untaint
      self
    end
  end
end
