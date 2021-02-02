class Public::SearchController < ApplicationController
  before_action :authenticate_end_user!
  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @method = params["search"]["metho"]
    @records = search_for(@model, @content, @method)#この順番により、search_forの値が上下する。
  end
  def 
    number1 = gets.chomp.to_i length: { in: 0..100 }
    nuber2 = gets.chomp.to_i length: { in: 0..100 }
    if (number1 - number2) < 3
       if number1 - number2 = 1
         number1 += 3
         print "Yes"
         
       end
       if numbermin = 2
        number1 += 3
         print "Yes"
       end
    else number1 > number2
       print "No"

    end
  end

  private
  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect'
        User.where(name: content)
      elsif method == 'forward'
        User.where('name LIKE ?', content+'%')#%が一文字以上である。
      elsif method == 'backward'
        User.where('name LIKE ?', '%'+content)
      else
        User.where('name LIKE ?', '%'+content+'%')
      end
    elsif model == 'book'
      if method == 'perfect'
        Book.where(title: content)
      elsif method == 'forward'
        Book.where('title LIKE ?', content+'%')
      elsif method == 'backward'
        Book.where('title LIKE ?', '%'+content)
      else
        Book.where('title LIKE ?', '%'+content+'%')
      end
    end
  end
end
