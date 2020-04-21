class Response < ApplicationRecord

    belongs_to :respondent,
        foreign_key: :respondent_id
        primary_key: :id
        class_name: :User

    belongs_to :answer_choice,
        foreign_key: :answer_choice_id,
        primary_key: :id,
        class_name: :AnswerChoice

    has_one :question,
        through: :answer_choice,
        source: :question

    def sibling_responses
        self.question.responses.where.not(id: self.id)
    end

    def respondent_already_answered?
        sibling_responses.exists?(respondent_id: self.respondent_id)
    end

end     
