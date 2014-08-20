class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all.order(:number)
    render('lessons/toc.html.erb')
  end

  def admin
    @lessons = Lesson.all.order(:number)
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

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to("/admin")
  end

  def display
    @lesson = Lesson.find_by(name: params[:name])
    if @lesson.next == nil
      @next = @lesson
      @previous = @lesson.previous
    elsif @lesson.previous == nil
      @next = @lesson.next
      @previous = @lesson
    else
      @next = @lesson.next
      @previous = @lesson.previous
    end
    render('lessons/show.html.erb')
  end
end
