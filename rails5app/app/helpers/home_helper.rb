module HomeHelper
    def top_answer(question)
    @answer = question.answers.order(cached_votes_score: :desc).first(1)
    @answer.text
    end
end
