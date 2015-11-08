module FileImportsHelper

  def error_list data
    correct_email = check_email data.email
    nb_error = nil
    puts case
           when FileImport.exists?(email: data.email) && FileImport.exists?(first_name: data.first_name, last_name: data.last_name)
             puts "Error mail, first name and last name duplicated"
             nb_error  = 1
           when FileImport.exists?(first_name: data.first_name, last_name: data.last_name)
             puts "Already have this user"
             nb_error = 2
           when FileImport.exists?(email: data.email)
             puts "Error mail duplicated"
             nb_error  = 3
           when data.first_name.length < 3 || data.last_name.length < 3
             puts "first or/and last name too short"
             nb_error = 4
           when  !correct_email
             puts "email format invalid"
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
