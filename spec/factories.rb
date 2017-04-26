FactoryGirl.define do
    factory :user do 
      email "example@gmail.com"
      passwaord "3456778"
      password_confirmation "3456778"
    end

    factory :npo do 
      name "afdsf"
    end


    factory :product do
      name "testtest"
      description "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae ipsum consectetur, semper dolor sed, dignissim enim."
      unit 100
      unit_price 200
      cost 454
      cost_detail "adsfasfd"
      npo_id 1
      due_date "2017-08-31"
    end

    factory :donation do 
      unit 3
      user_id 1
      product_id 1
      address "adfsdf"
    end
end