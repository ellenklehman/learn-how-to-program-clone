class LessonsController < ApplicationController
  def index
    @chapters = Chapter.all
    # @lessons = Lesson.all.order(:number)
    render('lessons/toc.html.erb')
  end

  def admin
    @chapters = Chapter.all
    @sections = Section.all
    @lessons = Lesson.all.order(:number)
    @lesson = Lesson.new
    @section = Section.new
    @chapter = Chapter.new
    render('lessons/admin.html.erb')
  end

  def show
    @lesson = Lesson.find(params[:id])
    @sections = Section.all
    @selected = Section.all.map do |section|
      if section == Section.find(@lesson.section_id)
        "selected"
      else
        ""
      end
    end

    render('lessons/edit.html.erb')
  end

  def create
    @chapters = Chapter.all
    @sections = Section.all
    @lessons = Lesson.all
    @lesson = Lesson.new(params[:lesson])
    @section = Section.new
    if @lesson.save
      redirect_to("/admin/#{@lesson.id}")
    else
      render('lessons/admin.html.erb')
    end
  end

  def update
    @lessons = Lesson.all
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
