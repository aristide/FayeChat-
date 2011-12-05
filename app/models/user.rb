class User < ActiveRecord::Base
    validates :code, :presence => true , :uniqueness => true
    validates :password , :presence => true 
    validates :name , :presence => true , :uniqueness => true
    
    def self.authenticate(code="",password="")
        user = User.find_by_code(code)
        if user && user.password == password
            return user
        else 
            return false
        end 
    end
end
