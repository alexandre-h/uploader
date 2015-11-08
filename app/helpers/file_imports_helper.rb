module FileImportsHelper

  def error_list data
    correct_email = check_email data.email
    puts case
           when FileImport.where(file_name: data.file_name  ).exists?(email: data.email) && FileImport.exists?(first_name: data.first_name, last_name: data.last_name)
             data.refused_reason = "Error mail, first name and last name duplicated"
           when FileImport.where(file_name: data.file_name).exists?(first_name: data.first_name, last_name: data.last_name)
             data.refused_reason = "Already have this user"
           when FileImport.where(file_name: data.file_name).exists?(email: data.email)
             data.refused_reason = "Error mail duplicated"
           when data.first_name.length < 3 || data.last_name.length < 3
             data.refused_reason = "first or/and last name too short"
           when  !correct_email
             data.refused_reason = "email format invalid"
         end
    if data.refused_reason.nil? || data.refused_reason.empty?
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
