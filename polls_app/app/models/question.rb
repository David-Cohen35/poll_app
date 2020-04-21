class Question < ApplicationRecord

    belongs_to :poll,
        foreign_key: :poll_id,
        primary_key: :id,
        class_name: :Poll

    has_many :answer_choices,
        foreign_key: :question_id,
        primary_key: :id,
        class_name: :Answer_choice

    has_many :responses,
        through: :answer_choices,
        source: :responses
    
end