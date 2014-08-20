class SectionsController < ApplicationController
  def create
    @chapters = Chapter.all
    @sections = Section.all
    @lesson = Lesson.new
    @section = Section.new(params[:section])
    if @section.save
      flash[:notice] = "Section added!"
      redirect_to("/admin")
    else
      render('lessons/admin.html.erb')
    end
  end
end
