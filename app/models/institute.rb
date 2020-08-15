class Institute < ApplicationRecord
    has_many :courses
    has_many :educations ,through: :courses
    ##scope its class methode ritten by simple way and use activerecord    ,it limited order to size you gave them
    scope :order_by_name ,->{(limit(20).order(name: :desc))}

end
