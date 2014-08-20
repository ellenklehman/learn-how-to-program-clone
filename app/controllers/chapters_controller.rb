class ChaptersController < ApplicationController
  def create
    @chapters = Chapter.all
    @sections = Section.all
    @lesson = Lesson.new
    @section = Section.new
    @chapter = Chapter.new(params[:chapter])
    if @chapter.save
      flash[:notice] = "Chapter added!"
      redirect_to("/admin")
    else
      render('lessons/admin.html.erb')
    end
  end
end
