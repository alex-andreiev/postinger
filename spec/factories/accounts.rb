FactoryGirl.define do
  factory :account do
    provider 'twitter'
    uid '718397310183555072'
    email 'test@gmail.com'
    token_tw '718397310183555072-TyWnCq6jvwihuL4itjOVikL4oTiKS1s'
    secret_tw '0XEJp1FD0t226gtEYJP6qLjvD4KFsc6gGx65M8poM7M0h'
    user_id nil
  end
end
