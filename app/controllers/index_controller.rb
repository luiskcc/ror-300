class IndexController < ApplicationController
  def main
    @sections = Section.all
    @section = Section.new
  end
end

