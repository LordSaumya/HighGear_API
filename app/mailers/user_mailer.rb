class UserMailer < ApplicationMailer
    default from: email_address_with_name('notification@HighGear.com', 'HighGear')

    def welcome_email(user)
        @user = user
        @url = 'http://localhost:3000/login'
        mail(to: @user.email, subject: 'Welcome to HighGear')
    end
end
