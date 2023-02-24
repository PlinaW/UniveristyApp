class UserCoursesController < ApplicationController
  
  def create
    course_to_add = Course.find(params[:course_id]) #na podstawie otrzymanego id kursu przypisujemy ten kurs do zmiennej 
    unless current_user.courses.include?(course_to_add) #i sprawdzamy czy dany kurs jest przypisany do danego usera
      UserCourse.create(course: course_to_add, user: current_user)  #jezeli nie jest, tworzymy association pomiedzy course i user tak jak w consoli
      flash[:notice] = "You have successfully enrolled in #{course_to_add.name}"
      redirect_to current_user
    else
      flash[:notice] = "Sonething was wrong with your enrollment"
      redirect_to root_path
    end
  end
  
end