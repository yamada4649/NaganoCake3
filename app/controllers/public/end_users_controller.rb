class Public::EndUsersController < ApplicationController
	def show
		@end_user = current_end_user
	end
	def edit
		@end_user = current_end_user
		
	end
	def new
		
	end
	 def withdraw
       @end_user = current_end_user
       @end_user.destroy#deleted_atに日にちの情報が入る。
       redirect_to root_path


  end
	 def end_user_params
  	params.require(:end_user).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:email,:address,:phone,:member_status)
  end
end
