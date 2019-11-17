require 'rails_helper'

describe User do
  describe '#create' do
    # ニックネーム、メールアドレス、パスワード、パスワードの確認、姓、名前、姓（カナ）、名前（カナ）、生年月日（年）、生年月日（月）、生年月日（日）が入力されている場合は正常に登録される
    it "is valid with a nickname, email, password, password_confirmation, first_name, last_name, first_name_kana, last_name_kana, birth_year_id, birth_month_id, birth_day_id" do
      user = build(:user)
      expect(user).to be_valid
    end

    # ニックネームが入力されていない場合エラーになる
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # ニックネームの文字数が２０文字を超過した場合はエラーになる
    it "is invalid with a nickname that has more than 20 characters" do
      user = build(:user, nickname: "000000000000000000000")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 20 characters)")
    end

    # ニックネームの文字数が２０文字以内の場合は正常に登録される
    it "is valid with a nickname that has less than 20 characters" do
      user = build(:user, nickname: "00000000000000000000")
      user.valid?
      expect(user).to be_valid
    end

    # メールアドレスが入力されていない場合エラーになる
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # すでに登録されているメールアドレスを入力した場合エラーになる
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # パスワードが入力されていない場合エラーになる
    it "is invaid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # パスワード確認が入力されていない場合エラーになる
    it "is invalid without a password_confirmation" do
      user = build(:user, password_confirmation: nil)
      user.valid?
      expect(user.errors[:password_confirmation]).to include("can't be blank")
    end

    # パスワードが７文字以上の場合正常に登録される
    it "is valid with a password that has more than 7 characters" do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    # パスワードが７文字以内の場合エラーになる
    it "is invalid with a password that has less than 7 characters" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end

    # パスワードが１２８文字を超過した場合エラーになる
    it "is invalid with a password that has more than 128 characters" do
      user = build(:user, password: "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000")
      user.valid?
      expect(user.errors[:password]).to include("is too long (maximum is 128 characters)")
    end

    # パスワードがパスワードの確認と一致しない場合エラーになる
    it "is invalid without a password_coonfirmation" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # 姓が入力されていない場合エラーになる
    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    # 姓の入力文字数が３５文字を超過した場合エラーになる
    it "is invalid with a first_name that has more than 35 characters" do
      user = build(:user, first_name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:first_name]).to include("is too long (maximum is 35 characters)")
    end

    # 名前が入力されていない場合エラーになる
    it "is invalid without a last_name" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    # 名前の入力文字数が３５文字を超過した場合エラーになる
    it "is invalid with a last_name that has more than 35 characters" do
      user = build(:user, last_name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:last_name]).to include("is too long (maximum is 35 characters)")
    end

    # 姓（カナ）の入力がされていない場合エラーになる
    it "is invalid without a first_name_kana " do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    # 姓（カナ）の文字数が３５文字を超過した場合エラーになる
    it "is invalid with a first_name_kana that has more than 35 characters" do
      user = build(:user, first_name_kana: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is too long (maximum is 35 characters)")
    end

    # 名前（カナ）の入力がされていない場合エラーになる
    it "is invalid without last_name_kana" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end

    # 名前（カナ）の文字数が３５文字を超過した場合エラーになる
    it "is invalid with last_name_kana that has more than 35 characters" do
      user = build(:user, last_name_kana: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("is too long (maximum is 35 characters)")
    end

    # 生年月日（年）が入力されていない場合エラーになる
    it "is invalid without birth_year_id" do
      user = build(:user, birth_year_id: nil)
      user.valid?
      expect(user.errors[:birth_year_id]).to include("can't be blank")
    end

    # 生年月日（月）が入力されていない場合エラーになる
    it "is invalid without birth_month_id" do
      user = build(:user, birth_month_id: nil)
      user.valid?
      expect(user.errors[:birth_month_id]).to include("can't be blank")
    end

    # 生年月日（日）を入力していない場合エラーになる
    it "is invalid without birth_day_id" do
      user = build(:user, birth_day_id: nil)
      user.valid?
      expect(user.errors[:birth_day_id]).to include("can't be blank")
    end

    # メールアドレスのフォーマットに従わないとエラーになる
    it "is invalid no match format email" do
      user = build(:user, email: "0000000000000000000")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end
    # パスワードのフォーマットに従わないとエラーになる
    it "is invalid no match format password" do
      user = build(:user, password: "あああああああ")  
      user.valid?
      expect(user.errors[:password]).to include("is invalid")
    end

    # 姓（カナ）のフォーマットに従わないとエラーになる
    it "is invalid no match format first_name_kana" do
      user = build(:user, first_name_kana: "あべ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is invalid")
    end

    # 名前（カナ）のフォーマットに従わないとエラーになる
    it "is invalid no match format last_name_kana" do
      user = build(:user, last_name_kana: "ひろし")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("is invalid")
    end
  end
end
