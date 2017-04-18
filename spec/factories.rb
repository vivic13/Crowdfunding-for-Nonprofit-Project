FactoryGirl.define do
    factory :npo do 
      name "afdsf"
    end


    factory :product do
        name "testtest"
        description "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae ipsum consectetur, semper dolor sed, dignissim enim."
        unit 100
        unit_price 200
        rule "daf fdfasf"
        cost 454
        cost_detail "adsfasfd"
        npo_id 1
        due_date "2017-08-31"
    end
end