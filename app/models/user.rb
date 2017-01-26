class User < ActiveRecord::Base
    has_one :candidat
    before_save :default_values
    def default_values
        self.level ||= '0' # note self.level = '0' if self.level.nil? might be safer 
        self.picture ||= 'null'
    end

end
