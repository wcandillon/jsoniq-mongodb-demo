for $answers in collection("answers")
group by $id := $answers.question_id
let $count := count($answers)
order by $count descending
return {
    question: $id,
    answers: count($answers)
}
