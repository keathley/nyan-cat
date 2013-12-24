require 'nyan-cat/cat.rb'
require 'nyan-cat/ui.rb'

module NyanCat
  def self.new_cat(*args)
    Cat.new(*args)
  end
end
