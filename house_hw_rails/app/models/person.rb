# == Schema Information
#
# Table name: people
#
#  id       :bigint           not null, primary key
#  name     :string
#  house_id :integer
#


class Person < ActiveRecord::Base
    validates :name, presence: true

    # house_id is a foreign key => use belongs_to
    belongs_to :house,
        primary_key: :id,
        foreign_key: :house_id,
        class_name: :House

end
