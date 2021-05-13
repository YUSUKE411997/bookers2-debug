class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!


  def create
    #スーパークラス(devise)のcreateアクションを呼ぶ
    super
    #WelcomeMailerクラスのsend_when_signupメソッドを呼び、POSTから受け取ったuserのemailとnameを渡す
    
    # validates を掛けていても処理が実行されてしまう為 ifでサインインしていたらのメソッドを記述
    if user_signed_in?
    WelcomeMailer.send_when_signup(current_user).deliver
    end 
  end
  
end
