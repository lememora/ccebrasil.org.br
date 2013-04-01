class ContactMail < ActionMailer::Base
  
  def contact_message(f_name, f_email, f_subject, f_message)
    @recipients     = "contato@ccebrasil.org.br"
    #@bcc            = "bona@bonacode.com"
    @from           = "CCE_SP<sistema@ccebrasil.org.br>"
    @subject        = "Nova mensagem enviada pelo site"
    @sent_on        = Time.now
    @content_type   = "text/html" 
    @f_name         = f_name   
    @f_email        = f_email
    @f_subject      = f_subject
    @f_message      = f_message
  end
  
  def contact_message_midiateca(f_name, f_email, f_subject, f_message)
    @recipients     = "mediateca@ccebrasil.org.br"
    #@bcc            = "bona@bonacode.com"
    @from           = "CCE_SP<sistema@ccebrasil.org.br>"
    @subject        = "Nova mensagem enviada pelo site - Midiateca"
    @sent_on        = Time.now
    @content_type   = "text/html" 
    @f_name         = f_name   
    @f_email        = f_email
    @f_subject      = f_subject
    @f_message      = f_message
  end
  
  def remove_email_from_database(f_name, f_email, f_subject, f_user_id, f_user_salt)
    @domain         = "http://ww2.ccebrasil.org.br"
    @recipients     = "#{f_name} <#{f_email}>"
    #@bcc            = "bona@bonacode.com"
    @from           = "CCE_SP<sistema@ccebrasil.org.br>"
    @subject        = "Remover email da newsletter"
    @sent_on        = Time.now
    @content_type   = "text/html"
    @f_name         = f_name   
    @f_email        = f_email
    @f_subject      = f_subject
    @f_user_id      = f_user_id
    @f_user_salt    = f_user_salt
  end
  
  def send_protected_file(f_email, f_message, f_id, f_salt)
    @domain         = "http://ww2.ccebrasil.org.br"
    @recipients     = "#{f_email}"
    #@bcc            = "bona@bonacode.com"
    @from           = "CCE_SP<sistema@ccebrasil.org.br>"
    @subject        = "CCE_SP - Envio de Arquivo"
    @sent_on        = Time.now
    @content_type   = "text/html"  
    @f_email        = f_email
    @f_message      = f_message
    @f_id           = f_id
    @f_salt         = f_salt
  end

end
