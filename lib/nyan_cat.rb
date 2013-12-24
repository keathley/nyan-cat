$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'nyan-cat/cat.rb'
require 'nyan-cat/ui.rb'

module NyanCat
  def self.new_cat(*args)
    Cat.new(*args)
  end
end
