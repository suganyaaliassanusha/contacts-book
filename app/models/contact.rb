class Contact < ActiveRecord::Base
	validates :firstname, presence: true
    validates_uniqueness_of :firstname, :scope => :lastname
	validates :email, presence: true, uniqueness: true
	validates :mobilenumber, presence: true, uniqueness: true, numericality: {only_integer: true}
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :address, presence: true
end

