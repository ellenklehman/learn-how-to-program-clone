class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
    render('lessons/toc.html.erb')
  end
end
