import module namespace http = "http://zorba.io/modules/http-client";

(:
create("answers");
:)
let $docs := http:get("https://dl.dropboxusercontent.com/u/1487285/answers.json").body.content ! tokenize($$, "\n") ! parse-json($$)
for $doc in $docs
where empty(collection("answers")[$$.question_id eq $doc.question_id])
return {
    apply-insert("answers", $doc);
    $doc.question_id
}
