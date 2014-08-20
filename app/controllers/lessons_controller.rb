class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
    render('lessons/toc.html.erb')
  end

  def admin
    @lessons = Lesson.all
    @lesson = Lesson.new
    render('lessons/admin.html.erb')
  end

  def show
    @lesson = Lesson.find(params[:id])
    render('lessons/edit.html.erb')
  end

  def create
    @lessons = Lesson.all
    @lesson = Lesson.new(params[:lesson])
    if @lesson.save
      redirect_to("/admin/#{@lesson.id}")
    else
      render('lessons/admin.html.erb')
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
    if @lesson.update(params[:lesson])
      redirect_to("/admin/#{@lesson.id}")
    else
      render('lessons/edit.html.erb')
    end
  end
end
