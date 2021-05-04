class TroublesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @trouble = Trouble.new(trouble_params)
    
    if @trouble.save
      flash[:success] = '新しい悩みを作りました'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = '悩みを作るのに失敗しました(単語は50文字以下ですか?その悩みは既に存在していませんか?)'
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
  
  def trouble_params
    params.require(:trouble).permit(:word)
  end
end
