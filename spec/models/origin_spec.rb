require 'rails_helper'
describe Origin do
  before do
    @origin = FactoryBot.build(:origin)
  end

  describe '投稿の保存' do
    context "投稿が保存できる場合" do
      it "本のタイトル、カテゴリー、説明文があれば投稿は保存される" do
        expect(@origin).to be_valid
      end
    end
    context "投稿が保存できない場合" do
      it "本のタイトルがないと保存できない" do
        @origin.book_title = nil
        @origin.valid?
        expect(@origin.errors.full_messages).to include("Book title can't be blank")
      end
      
      it "カテゴリーがないと保存できない" do
        @origin.category = nil
        @origin.valid?
        expect(@origin.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it "カテゴリーのcategory_idが1以上でないと保存できない" do
        @origin.category_id = 0
        @origin.valid?
        expect(@origin.errors.full_messages).to include("Category must be other than 0")
      end
      it "本の説明文がないと保存できない" do
        @origin.text = nil
        @origin.valid?
        expect(@origin.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end
