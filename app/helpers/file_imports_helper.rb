module FileImportsHelper

  def error_list data
    correct_email = check_email data.email
    nb_error = nil
    puts case
           when FileImport.where(file_name: data.file_name  ).exists?(email: data.email) && FileImport.exists?(first_name: data.first_name, last_name: data.last_name)
             data.refused_reason = "Error mail, first name and last name duplicated"
             nb_error  = 1
           when FileImport.where(file_name: data.file_name).exists?(first_name: data.first_name, last_name: data.last_name)
             data.refused_reason = "Already have this user"
             nb_error = 2
           when FileImport.where(file_name: data.file_name).exists?(email: data.email)
             data.refused_reason = "Error mail duplicated"
             nb_error  = 3
           when data.first_name.length < 3 || data.last_name.length < 3
             data.refused_reason = "first or/and last name too short"
             nb_error = 4
           when  !correct_email
             data.refused_reason = "email format invalid"
             nb_error = 5
         end
    if nb_error.nil?
      return true
    else
      return false
    end
  end

  def check_email(email)
    if email.count("@") != 1 then
      return false
    elsif email =~ /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/ then
      return true
    else
      return false
    end
  end

end
