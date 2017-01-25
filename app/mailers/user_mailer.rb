class UserMailer < ApplicationMailer

    def create_password_email(user, url)
        @user = user
        mail(to: @user.email, subject: 'Welcome to My Awesome Site', ) do |format|
            format.text { render plain: "Hello Mikel!" }
            format.html { render html: "<h1>Hello Mikel!"+url+"</h1>".html_safe }
        end
    end
end
